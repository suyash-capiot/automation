#!/bin/bash
echo $1
DB_con=$2
echo $DB_con
sql=$3
echo $sql
./sqlplus $DB_con @$sql/Export_Country.sql $1