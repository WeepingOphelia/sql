#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
MASSES=$($PSQL "SELECT atomic_mass, atomic_number FROM properties")
echo "$MASSES" | while read MASS BAR ID
do
  MASS_TRUNK=$(echo $MASS | sed 's/0*$//')
  RES=$($PSQL "UPDATE properties SET atomic_mass=$MASS_TRUNK WHERE atomic_number=$ID")
  echo "Set Atomic #'$ID' to '$MASS_TRUNK"
done
