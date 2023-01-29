#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
 echo -e "Please provide an element as an argument."

 else
 # get element if it is an atomic number between 1-10
 if [[ $1 =~ ^[0-9]+$ ]]
 then
  ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius
  FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id)
  WHERE atomic_number=$1")

 else
  # get element if it is a symbol or name
  ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius
  FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id)
  WHERE symbol='$1' OR name='$1'")
fi

# if element not found
 if [[ -z $ELEMENT ]]
 then
  echo -e "I could not find that element in the database."
  else
  echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOLING_POINT_CELSIUS
do
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOLING_POINT_CELSIUS celsius."
done
 fi
fi


