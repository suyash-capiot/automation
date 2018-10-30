OPTIONS(SKIP=1)
LOAD DATA 
INFILE '/tmp/Static/Inbound/Accomodation/Bonotel/PropertyRenovation/*.csv' "str '\r\n'"
APPEND INTO TABLE Property_Renovations
FIELDS TERMINATED BY ',' optionally enclosed by '"'
Trailing nullcols
(
HOTEL_ID,
A FILLER,
B FILLER,
START_DATE,
END_DATE,
E FILLER,
RENOVATION_DESCRIPTION CHAR(8000)
)

