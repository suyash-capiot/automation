#!/bin/bash

#Call Configuration File
. /tmp/Static/StaticScripts/ImportScripts/CommonScripts/Config.sh

#---Import path from Config.sh file---
varOracle_bin=$ORACLE_BIN
varOracle_Home=$ORACLE_HOME
varDb_con=$DB_CON
varCommonScripts=$SQLScript
varImportPath=$IMPORTSCRIPTS
varExportPath=$EXPORTSCRIPTS
varURI=$URI
varInbound_path=$INBOUND_PATH
varOutbound_path=$ACCO

#------connection-------
cd $ORACLE_BIN
ORACLE_HOME=$ORACLE_HOME; export ORACLE_HOME

varHotel='ImportHotel.sh'
varCity='ImportCity.sh'
varCountry='ImportCountry.sh'

#---DELETE SCRIPT---
Supplier_name=$1
./sqlplus $varDb_con @$varCommonScripts/Delete.sql $1

#if [ $Supplier_name = "Expedia" ] || [ "$Supplier_name" = "Bonotel" ]
#then
#./sqlplus $varDb_con @$varCommonScripts/Delete_Renovation.sql $Supplier_name
#fi
echo $Supplier_name

#---LOOKUP for Supplier_id---
#read Supplier_id <<< $(echo|awk  "/$Supplier_name/"'{getline;print }' $varCommonScripts/StaticData_SupplierId.dvm | cut -d'>' -f2 | cut -d'<' -f1 )

#---SUPPLIER_NAME CONSTANT in CTL file---
#echo "[$Supplier_id]"
#if [ $Supplier_name = "TripVilas" ]
#then
#{
#sed -i "s/select distinct 'TRIPVILAS'/select distinct '\\$Supplier_id'/g " $varImportPath/$Supplier_name/sql/*.sql

#}
#else
#{
#sed -i "/SUPPLIER_ID CONSTANT/ c\SUPPLIER_ID CONSTANT '\\$Supplier_id'," $varImportPath/$Supplier_name/ctl/*.ctl
#}
#fi

#---IMPORT SCRIPTS---
cd $varImportPath/$Supplier_name

if [ $Supplier_name = "Aot" ]
then
#---import_country---
. $varImportPath/$Supplier_name/${Supplier_name}_${varCountry} $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath 
echo curl -XGET http://$varURI/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${Supplier_name}_${varCities};
curl -XGET http://$varURI/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${Supplier_name}_${varCities};
echo curl -XGET http://$varURI/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${Supplier_name}_${varProduct};
curl -XGET http://$varURI/StaticAccoDataWrapperCS/StaticWrapperRestService?Supplier_Key=${Supplier_name}_${varProduct};


else
{
#---import_hotel---
. $varImportPath/$Supplier_name/${Supplier_name}_${varHotel} $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath $varCommonScripts
#---import_country---
. $varImportPath/$Supplier_name/${Supplier_name}_${varCountry} $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath 
#---import_city---
. $varImportPath/$Supplier_name/${Supplier_name}_${varCity} $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath 
}
fi
#if [ $Supplier_name = "Expedia" ]
#then
#. $varImportPath/$Supplier_name/Renovation.sh $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath
#elif [ $Supplier_name = "Bonotel" ]
#then
#. $varImportPath/$Supplier_name/Bonotel_Renovation.sh $varOracle_bin $varOracle_Home $varDb_con $Supplier_name $varInbound_path $varImportPath

#fi

#---EXPORT CALL---
#. $varExportPath/ExportCall.sh $Supplier_name $varOracle_bin $varOracle_Home $varDb_con $varExportPath $varOutbound_path
