CREATE TABLE quandl.rates
(
rate_key int identity(1,1) not null,
symbol varchar(64) not null,
rate_date date not null,
rate_hour int not null,
openbid float,
highbid float,
lowbid float,
closebid float,
openask float,
highask float,
lowask float,
closeask float,
totalticks int,
[load_etl_bath_key] int
)