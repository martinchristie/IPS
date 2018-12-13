use [DWH_CA1]
go


declare @time datetime = '2018-01-01 00:00'


while @time <'2019-01-01 00:00'
begin
	
	insert into dbo.dim_time
	(
		[time_key],
		[date],
		[date_time],
		[year_nr],
		[quarter_nr],
		[month_nr],
		[month_name],
		[day_of_month_nr],
		[day_of_week_nr],
		[day_of_week_name],
		[hour_nr],
		[minute_nr]
	)
	select 
	datediff(minute,'2018-01-01 00:00',@time),
	cast(@time as date),
	@time,
	datepart(year,@time),
	datepart(QUARTER,@time),
	datepart(month,@time),
	datename(month,@time),
	datepart(day,@time),
	datepart(dw,@time),
	datename(dw,@time),
	datepart(hour,@time),
	datepart(minute,@time)

	set @time = dateadd(minute,1,@time)
end

select * from dim_time