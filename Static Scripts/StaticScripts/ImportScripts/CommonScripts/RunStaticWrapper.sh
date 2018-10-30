#!/bin/sh

#Call Configuration File
IMPORTSCRIPT=/tmp/Static/StaticScripts/ImportScripts/CommonScripts; export IMPORTSCRIPT
. $IMPORTSCRIPT/Config.sh

#SupplierName from CronTab
SuppName=$1
echo $SuppName

#---Import path from Config.sh file---
Oracle_bin=$ORACLE_BIN
echo $Oracle_bin
Oracle_home=$ORACLE_HOME
echo $Oracle_home
Db_Con=$DB_CON
echo $Db_Con
uri=$URI
echo $uri
exportscripts=$EXPORTSCRIPTS
echo $exportscripts
sql=$SQLScript
echo $sql
accoPath=$ACCO
echo $accoPath

#------connection-------
cd $Oracle_bin
ORACLE_HOME=$Oracle_home; export ORACLE_HOME

varCountries='Countries'
varCities='Cities'
varProduct='Product'

if [ "$SuppName" = "Acampora" ] || [ "$SuppName" = "Mansley" ] || [ "$SuppName" = "Qantas" ] || [ "$SuppName" = "WhiteSandsDubai" ] || [ "$SuppName" = "OyoRooms" ] || [ "$SuppName" = "Olympia" ]
then

./sqlplus $Db_Con @$sql/Delete.sql $1 #---DELETE SCRIPT---
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName};

else
if [ "$SuppName" = "Dotw" ]
then

./sqlplus $Db_Con @$sql/Delete.sql $1; #---DELETE SCRIPT---
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
echo  curl -XGET http://$uri/StaticAccoDOTWAccommodationsCS
curl -XGET http://$uri/StaticAccoDOTWAccommodationsCS

else
if [ "$SuppName" = "Gta" ]
then

./sqlplus $Db_Con @$sql/Delete.sql $1; #---DELETE SCRIPT---
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
echo  curl -XGET http://$uri/StaticAccoGTA_AccomodationCS
curl -XGET http://$uri/StaticAccoGTA_AccomodationCS

else
if [ "$SuppName" = "VistaRooms" ]
then

./sqlplus $Db_Con @$sql//Delete.sql $1; #---DELETE SCRIPT---
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
echo  curl -XGET http://$uri/StaticAcoVistaRoomsAccomodationsCS
curl -XGET http://$uri/StaticAcoVistaRoomsAccomodationsCS

else
if [ "$SuppName" = "LotsofHotels" ]
then

./sqlplus $Db_Con @$sql/Delete.sql $1; #---DELETE SCRIPT---
echo  curl -XGET http://$uri/StaticAccoLotsofHotelsProxyService
curl -XGET http://$uri/StaticAccoLotsofHotelsProxyService

else
if [ "$SuppName" = "Hotelbeds" ]
then
./sqlplus $Db_Con @$sql/Delete.sql $1; #---DELETE SCRIPT---
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
echo  curl -XGET http://$uri/StaticAccoHotelbedAccommodationCS
curl -XGET http://$uri/StaticAccoHotelbedAccommodationCS

else
if [ "$SuppName" = "Restel" ]
then

./sqlplus $Db_Con @$sql/Delete.sql $1; #---DELETE SCRIPT---
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
echo  curl -XGET http://$uri/StaticRestelAccommodationCSStaticRestelAccommProxyService
curl -XGET http://$uri/StaticRestelAccommodationCSStaticRestelAccommProxyService

else
./sqlplus $Db_Con @$sql/Delete.sql $1; #---DELETE SCRIPT----
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCountries};
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varCities};
echo curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varProduct};
curl -XGET http://$uri/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${SuppName}_${varProduct};

fi
fi
fi
fi
fi
fi
fi

#-----ExportCalll-------
. $EXPORTSCRIPTS/ExportCall.sh $SuppName $Oracle_bin $Oracle_home $Db_Con $exportscripts $accoPath
