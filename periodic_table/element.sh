#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
elif [[ $1 =~ [0-9]+ ]]
then
  QUERY=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON types.type_id=properties.type_id WHERE elements.atomic_number=$1")
else 
  QUERY=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON types.type_id=properties.type_id WHERE name='$1' OR symbol='$1'")
fi

if [[ -z $QUERY ]]
then
  echo "I could not find that element in the database."
  exit
fi

echo $QUERY | while read ID BAR NAME BAR SYM BAR TYPE BAR MASS BAR MELT BAR BOIL
do
  echo "The element with atomic number $ID is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done

