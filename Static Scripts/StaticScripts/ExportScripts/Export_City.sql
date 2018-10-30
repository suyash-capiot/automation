set feedback off echo off term off verify off
set trimspool on
SET serveroutput ON
SET Pagesize 20000
set colsep ','
set wrap off
SET linesize 20000


echo"[$1]"
col date_stp new_value date_stp noprint
col time_stp new_value time_stp noprint
select to_char(sysdate,'yyyymmdd') date_stp from dual;
select to_char(sysdate,'yyyymmddhhmmss') time_stp from dual;

spool /tmp/Static/Outbound/Accomodation/&date_stp/&1/City_&time_stp..csv
SELECT distinct(SUPPLIER_ID),SUPPLIER_NAME, 
'"' || trim(COUNTRY_CODE) || '"' as COUNTRYCODE, 
'"' || trim(COUNTRY_NAME) || '"' as COUNTRYNAME,
'"' || trim(STATE_CODE) || '"' as STATECODE,
'"' || trim(STATE_NAME) || '"' as STATENAME, 
CITY_CODE,
'"' || trim(CITY_NAME) || '"' as CITYNAME,
'"' || trim(ACTIVE_FROM) || '"' as ACTIVEFROM,
'"' || trim(ACTIVE_TO) || '"' as ACTIVETO, 
'"' || trim(ACTION_TEXT) || '"' as ACTIONTEXT,
'"' || trim(ACTION) || '"' as ACTION,
'"' || trim(UPDATE_TYPE) || '"' as UPDATETYPE 
 FROM Staticdata_city where supplier_name='&1' and CITY_CODE is not null;
spool off
quit;
/
