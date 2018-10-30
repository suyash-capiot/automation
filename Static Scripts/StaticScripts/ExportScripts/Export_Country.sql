set feedback off echo off term off verify off
set trimspool on
SET serveroutput ON
SET Pagesize 10000
set colsep ','
SET wrap ON
SET linesize 10000

echo"[$1]"
col date_stp new_value date_stp noprint
col time_stp new_value time_stp noprint
select to_char(sysdate,'yyyymmdd') date_stp from dual;
select to_char(sysdate,'yyyymmddhhmmss') time_stp from dual;
spool /tmp/Static/Outbound/Accomodation/&date_stp/&1/Country_&time_stp..csv

SELECT distinct(SUPPLIER_ID),SUPPLIER_NAME,COUNTRY_CODE,
'"' || trim(COUNTRY_NAME) || '"' as COUNTRYNAME, 
'"' || trim(ACTIVE_FROM) || '"' as ACTIVEFROM,
'"' || trim(ACTIVE_TO) || '"' as ACTIVETO, 
'"' || trim(ACTION) || '"' as ACTION,
'"' || trim(ACTION_TEXT) || '"' as ACTIONTEXT,
'"' || trim(UPDATE_TYPE) || '"' as UPDATETYPE 
FROM Staticdata_country where supplier_name='&1' and COUNTRY_CODE is not null;

spool off
quit;
/

