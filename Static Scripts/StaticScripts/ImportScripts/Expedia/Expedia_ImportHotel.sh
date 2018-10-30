#!/bin/bash
echo [$1] #Oracle_bin
echo [$2] #Oracle_Home
echo [$3] #Db_con
echo [$4] #Supplier_name
echo [$5] #Inbound Path
echo [$6] #ImportPath
NOW=$(date +"%Y%m%d")
echo [$NOW]
mkdir -p $5/$4/$NOW/Hotel
chmod -R 777 $5/$4/$NOW/Hotel
mv $5/$4/$NOW/ActiveProperty*.txt $5/$4/$NOW/Hotel/HotelData.txt
mkdir -p $5/$4/$NOW/City
chmod -R 777 $5/$4/$NOW/City
mv $5/$4/$NOW/City*.txt $5/$4/$NOW/City/city.txt

mkdir -p $5/$4/$NOW/Country
chmod -R 777 $5/$4/$NOW/Country
mv $5/$4/$NOW/Country*.txt $5/$4/$NOW/Country/country.txt

mkdir -p $5/$4/PropertyRenovation
chmod -R 777 $5/$4/PropertyRenovation
mv $5/$4/$NOW/Property*.txt $5/$4/PropertyRenovation/Renovation.txt

cd $5/$4/
sed -i 1d $5/$4/$NOW/Hotel/*.txt
sort -u -t'|' -k1,1 $5/$4/$NOW/Hotel/*.txt >>ExpediaHotel.txt
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Expedia_ImportHotel.ctl log=$5/$4/$NOW/ExpediaHotel.log bad=$5/$4/$NOW/ExpediaHotel.bad