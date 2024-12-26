#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate teams, games" )


function GET_TEAM_ID {
  TEAM_NAME=$1
  TEAM_ID=$($PSQL "select team_id from teams where name='$TEAM_NAME'")
  echo "$TEAM_ID"
}

function ADD_TEAM {
  if [[ $1 ]]
  then
    TEAM_NAME=$1
    #check if team already exists
    #TEAM_ID=$($PSQL "select team_id from teams where name='$TEAM_NAME'")
    TEAM_ID=$(GET_TEAM_ID "$TEAM_NAME")
     #if not found
    if [[ -z $TEAM_ID ]] 
    then
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values ('$TEAM_NAME')" )
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]] 
      then
        echo "Inserted into teams, $TEAM_NAME"
      fi
    fi
  fi
}

function ADD_TEAMS {
  if [[ $1 ]]
  then
    ADD_TEAM "$1"
  fi
  if [[ $2 ]]
  then
    ADD_TEAM "$2"
  fi
}

ADD_GAMES() {
  YEAR=$1
  ROUND=$2 
  WINNER=$3 
  OPPONENT=$4 
  WINNER_GOALS=$5 
  OPPONENT_GOALS=$6

  WINNER_ID=$(GET_TEAM_ID "$WINNER")
  #echo winner: $WINNER $WINNER_ID
  OPPONENT_ID=$(GET_TEAM_ID "$OPPONENT")

  INSERT_GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
  values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)" )
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]] 
  then
    echo "Inserted into games, $YEAR $ROUND $WINNER $OPPONENT"
  fi
}


#year,round,winner,opponent,winner_goals,opponent_goals
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #call function that adds both winner and opponent
    ADD_TEAMS "$WINNER" "$OPPONENT"
    ADD_GAMES $YEAR "$ROUND" "$WINNER" "$OPPONENT" $WINNER_GOALS $OPPONENT_GOALS
  fi
done