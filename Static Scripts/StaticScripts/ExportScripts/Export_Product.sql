set feedback off echo off term off verify off
set trimspool on
SET serveroutput ON
SET Pagesize 20000
set colsep ','
set wrap off
SET linesize 20000
set longchunksize 200000 
long 200000


echo"[$1]"
col date_stp new_value date_stp noprint
col time_stp new_value time_stp noprint
select to_char(sysdate,'yyyymmdd') date_stp from dual;
select to_char(sysdate,'yyyymmddhhmmss') time_stp from dual;
spool /tmp/Static/Outbound/Accomodation/&date_stp/&1/Product_&time_stp..csv


SELECT distinct(SUPPLIER_ID),SUPPLIER_NAME,PRODUCT_ID,
'"' || trim(PRODUCT_NAME) || '"' as PRODUCTNAME,
'"' || trim(ADDRESS) || '"' as ADDRESS,
TELEPHONE_NUMBER,
COUNTRY_CODE,
CITY_CODE,
LOCATION, 
'"' || trim(ACTIVE_FROM) || '"' as ACTIVEFROM,
'"' || trim(ACTIVE_TO) || '"' as ACTIVETO, 
'"' || trim(ACTION) || '"' as ACTION,
'"' || replace(replace(trim(ACTION_TEXT), chr(10), ''), chr(13), '') || '"' as ACTIONTEXT,
'"' || trim(UPDATE_TYPE) || '"' as UPDATETYPE
FROM Staticdata_acco where supplier_name='&1' and PRODUCT_ID is not null;

spool off
quit;
/