LOAD DATA
INFILE '/tmp/Static/Inbound/Accomodation/Aot/AotCountry.csv'
APPEND INTO TABLE STATICDATA_COUNTRY 
FIELDS TERMINATED BY ',' optionally enclosed by '"'
trailing nullcols
(
SUPPLIER_ID CONSTANT 'AOT',
SUPPLIER_NAME CONSTANT 'Aot',
COUNTRY_CODE,
COUNTRY_NAME
)








