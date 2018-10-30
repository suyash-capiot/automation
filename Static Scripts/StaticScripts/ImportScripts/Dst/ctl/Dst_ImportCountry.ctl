LOAD DATA 
INFILE '/tmp/Static/Inbound/Accomodation/Dst/DstCountry.csv'
APPEND INTO TABLE STATICDATA_COUNTRY
FIELDS TERMINATED BY ',' optionally enclosed by '"'
(
SUPPLIER_ID CONSTANT 'DST ',
SUPPLIER_NAME CONSTANT 'Dst',
COUNTRY_CODE,
COUNTRY_NAME
)







