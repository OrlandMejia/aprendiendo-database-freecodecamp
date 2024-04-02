#!/bin/bash

# Define un arreglo asociativo para almacenar los nombres de los equipos únicos.
declare -A teams

# Define la variable PSQL para ejecutar comandos SQL en la base de datos.
if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Trunca las tablas teams y games para evitar duplicados.
echo "$($PSQL "TRUNCATE teams, games;")"

# Lee el archivo CSV línea por línea.
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
    # Verifica si la línea actual no es el encabezado.
    if [[ $WINNER != "winner" ]]; then
        # Agrega los nombres de los equipos a un arreglo para insertarlos en la tabla teams.
        teams["$WINNER"]=1
        teams["$OPPONENT"]=1
    fi
done < games.csv

# Inserta los nombres de los equipos en la tabla teams y obtén sus IDs.
for team in "${!teams[@]}"; do
    $PSQL "INSERT INTO teams(name) VALUES('$team')"
done

# Inserta una fila para cada juego en la tabla games.
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
    # Verifica si la línea actual no es el encabezado.
    if [[ $WINNER != "winner" ]]; then
        # Obtén los IDs de los equipos desde el arreglo.
        winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        # Inserta la fila en la tabla games.
        $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$winner_id', '$opponent_id', '$WINNER_GOALS', '$OPPONENT_GOALS')"
    fi
done < <(tail -n +2 games.csv)  # Excluye la primera línea del archivo CSV.
