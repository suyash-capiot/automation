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
mkdir -p $5/$4/$NOW/City
chmod -R 777 $5/$4/$NOW/City
mv $5/$4/$NOW/city.csv $5/$4/$NOW/City/city.csv
mkdir -p $5/$4/$NOW/Country
chmod -R 777 $5/$4/$NOW/Country
mv $5/$4/$NOW/country.csv $5/$4/$NOW/Country/country.csv
cd $5/$4/$NOW
cat CCBS_hotel_*.xls > $5/$4/$NOW/Hotel/CBS_Hotel.xls
cd $7/
python html2csv.py $5/$4/$NOW/Hotel/CBS_Hotel.xls
cd $5/$4
sed -i 1d $5/$4/$NOW/Hotel/CBS_Hotel.csv
sort -u -t',' -k1,1 $5/$4/$NOW/Hotel/CBS_Hotel.csv >>CbsHotel.csv
cd $1
ORACLE_HOME=$2; export ORACLE_HOME
./sqlldr $3 control=$6/$4/ctl/Cbs_ImportHotel.ctl log=$5/$4/$NOW/CbsHotel.log bad=$5/$4/$NOW/CbsHotel.bad