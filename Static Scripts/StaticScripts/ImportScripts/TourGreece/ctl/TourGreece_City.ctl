LOAD DATA
INFILE '/tmp/Static/Inbound/Accomodation/TourGreece/TourGreeceCity.csv'
APPEND INTO TABLE STATICDATA_CITY
FIELDS TERMINATED BY ',' optionally enclosed by '"'
Trailing nullcols
(
SUPPLIER_ID CONSTANT 'TOURGREECE',
SUPPLIER_NAME CONSTANT 'TourGreece',
COUNTRY_CODE CONSTANT 'GR',
COUNTRY_NAME CONSTANT 'Greece',
Hotelcode FILLER,
hotelname FILLER,
Area BOUNDFILLER,
CITY_CODE "upper(:Area)",
CITY_NAME "upper(:Area)"
)







