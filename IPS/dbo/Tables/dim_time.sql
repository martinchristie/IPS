CREATE TABLE [dbo].[dim_time](
	[time_key] [int] NOT NULL,
	[date] [date] NULL,
	[date_time] [datetime] NULL,
	[year_nr] [int] NULL,
	[quarter_nr] [tinyint] NULL,
	[month_nr] [tinyint] NULL,
	[month_name] [varchar](32) NULL,
	[day_of_month_nr] [int] NULL,
	[day_of_week_nr] [int] NULL,
	[day_of_week_name] [varchar](32) NULL,
	[hour_nr] [tinyint] NULL,
	[minute_nr] [tinyint] NULL,
 CONSTRAINT [PK_time] PRIMARY KEY CLUSTERED 
(
	[time_key] ASC
)
)