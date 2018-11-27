create table dbo.dim_location
(
location_key int identity(1,1) not null,
county varchar(50) not null,
country varchar(50) not null
)