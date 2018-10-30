#!/bin/bash
echo [$1] #Oracle_bin
echo [$2] #Oracle_Home
echo [$3] #Db_con
echo [$4] #Supplier_name
echo [$5] #Inbound Path
echo [$6] #ImportPath
NOW=$(date +"%Y%m%d")
echo [$NOW]
cd $5/$4/
mkdir -p $5/$4/$NOW/Hotel
chmod -R 777 $5/$4/$NOW/Hotel
mv $5/$4/$NOW/HotelData_*.csv $5/$4/$NOW/Hotel/HotelData.csv
mkdir -p $5/$4/$NOW/City
chmod -R 777 $5/$4/$NOW/City
mv $5/$4/$NOW/CityList_*.csv $5/$4/$NOW/City/city.csv
mkdir -p $5/$4/$NOW/Country
chmod -R 777 $5/$4/$NOW/Country
mv $5/$4/$NOW/CountryList_*.csv $5/$4/$NOW/Country/country.csv
mkdir -p $5/$4/PropertyRenovation
chmod -R 777 /$5/$4/PropertyRenovation
mv /$5/$4/$NOW/HotelMaintenance_*.csv $5/$4/PropertyRenovation/HotelMaintenance.csv
sed -i 1d $5/$4/$NOW/Hotel/*.csv
sort -u -t',' -k1,1 $5/$4/$NOW/Hotel/*.csv>>BonotelHotel.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Bonotel_ImportHotel.ctl log=$5/$4/$NOW/HotelData.log bad=$5/$4/$NOW/HotelData.bad
