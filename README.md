# Periodic_table_database

This is the fourth project under freecodecamp's Relational Database Certification

It has 2 files
- periodic_table.sql containing the periodic table database
- element.sh for querying the database

### Description

periodic_table.sql

It contains 3 tables. An "elements" table listing the names of 10 elements from the periodic table along with their atomic number and symbol, a "properties" table containing the properties of the elements such as type, atomic mass, melting point and boiling point and a "types" table, containing the element types whether metal, non-metal or metalloid.

The properties table has TWO FOREIGN KEYS each of which references the PRIMARY KEY from the elements and types table.

element.sh

This file contains the bash script for querying the periodic table database and giving the desired output in the terminal.

### Learning Experience:
In this project I had to repeat most of the commands I had already learnt in PostgreSQL and bash. 

New skills I learnt
- Updating rows in a table using the ::REAL command to remove trailing zeroes after the decimal point.
- Using ON DELETE CASCADE command while adding a foreign key constraint so that deleting rows from one table referenced by a foregin key will automatically delete corresponding info from the referencing table.
