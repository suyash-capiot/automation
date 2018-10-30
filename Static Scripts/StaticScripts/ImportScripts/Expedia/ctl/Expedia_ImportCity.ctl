OPTIONS (SKIP=1)
LOAD DATA
CHARACTERSET UTF8 
INFILE '/tmp/Static/Inbound/Accomodation/Expedia/ExpediaCity.txt'
APPEND INTO TABLE STATICDATA_CITY_PROD
FIELDS TERMINATED BY '|' optionally enclosed by '"'
Trailing nullcols
(
SUPPLIER_ID CONSTANT 'EXPEDIA',
SUPPLIER_NAME CONSTANT 'Expedia',
CITY_CODE,
QualifiedCity	BOUNDFILLER,
A 				FILLER CHAR(8000),
COUNTRY_NAME	"case 
					when regexp_count(:QualifiedCity, '[^,]+') > 1 then trim(regexp_substr(:QualifiedCity, '[^,]+', 1, regexp_count(:QualifiedCity, '[^,]+')))
					else NULL
				 end",
STATE_NAME		"case 
					when regexp_count(:QualifiedCity, '[^,]+') >= 3 then
						case
							when trim(regexp_substr(:QualifiedCity, '[^,]+', 1, regexp_count(:QualifiedCity, '[^,]+'))) 
									in ('Australia', 'Canada','Mexico','United States of America') then
								trim(regexp_substr(:QualifiedCity, '[^,]+', 1, (regexp_count(:QualifiedCity, '[^,]+') - 1)))
							else
								NULL
						end
					else
						NULL
				 end",
CITY_NAME		"case 
					when regexp_count(:QualifiedCity, '[^,]+') >= 3 then
						case
							when trim(regexp_substr(:QualifiedCity, '[^,]+', 1, regexp_count(:QualifiedCity, '[^,]+'))) 
									in ('Australia', 'Canada','Mexico','United States of America') 
								 OR trim(regexp_substr(:QualifiedCity, '[^,]+', 1, regexp_count(:QualifiedCity, '[^,]+'))) = 'United Kingdom' then
								trim(regexp_substr(:QualifiedCity, '[^,]+', 1, (regexp_count(:QualifiedCity, '[^,]+') - 2)))
							else
								trim(regexp_substr(:QualifiedCity, '[^,]+', 1, (regexp_count(:QualifiedCity, '[^,]+') - 1)))
						end
					when regexp_count(:QualifiedCity, '[^,]+') = 2 then
						trim(regexp_substr(:QualifiedCity, '[^,]+', 1, (regexp_count(:QualifiedCity, '[^,]+') - 1)))
					else
						NULL
				 end"
)
