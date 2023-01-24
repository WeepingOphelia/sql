#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"



MAIN() {

  echo "Enter your username:"
  read USERNAME

  if [[ $USERNAME ]] 
  then
    QUERY=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")
  
    if [[ -z $QUERY ]]
    then
      ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  
      if [[ $ADD_USER == "INSERT 0 1" ]]
      then
        echo "Welcome, $USERNAME! It looks like this is your first time here."
        GAMES_PLAYED=0
      else 
        echo -e "Invalid username, try again.\n"
        MAIN
      fi

    else
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
    RANDOM_GUESS

  else
    MAIN

  fi
}

READ_GUESS() {

  read GUESS

  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    
    (( NUMBER_OF_GUESSES++ ))
#    echo $SECRET_NUMBER

    if (( GUESS > SECRET_NUMBER ))
      then
      echo "It's lower than that, guess again:"
      READ_GUESS

    elif (( GUESS < SECRET_NUMBER ))
    then
      echo "It's higher than that, guess again:"
      READ_GUESS

    else
      (( GAMES_PLAYED+=1 ))
      UPDATE_GP=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
      BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
      if [[ -z $BEST_GAME ]] || (( BEST_GAME > NUMBER_OF_GUESSES ))
      then
        UPDATE_BG=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
      fi
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    fi

  else
    echo "That is not an integer, guess again:"
    READ_GUESS
  fi
}

RANDOM_GUESS() {

  SECRET_NUMBER=$(($$ % 1000 + 1))
  NUMBER_OF_GUESSES=0
  echo -e "\nGuess the secret number between 1 and 1000:"
  READ_GUESS

  
}

MAIN
