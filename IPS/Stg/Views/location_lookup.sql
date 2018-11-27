create view Stg.location_lookup
as
select 
[county],
[country],
[name] + ' ' +county + ' ' + country as [location]
from [Stg].[location]