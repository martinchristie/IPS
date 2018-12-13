create procedure upsert_fact_brexit_table @date date
as
begin


--create temp table for the day to update/ load

select 
datediff(minute, '2018-01-01 00:00',[created_datetime]) as time_key,
isnull(l.location_key,1) location_key,
case when avg([sentiment_score]) < .5 then 1  when  avg([sentiment_score]) > .5 then 3 when avg([sentiment_score]) = .5 then 2 end [sentiment_key],
sum( case retweet when 0 then 1 else 0 end ) tweet_count,
sum(retweet) retweet_count,
min([sentiment_score])[min_sentiment_score],
max([sentiment_score])[max_sentiment_score],
avg([sentiment_score])[avg_sentiment_score],
eur.[openbid] [EUR_open_bid],
usd.[openbid] [USD_open_bid],
eur.[openask] [EUR_open_ask],
usd.[openask] [USD_open_ask]
into #tmp
from 
[twitter].[twitter_feed] f 
left join [dbo].[dim_location] l on f.county = l.county and  f.country = l.country
--join [dbo].[fact_brexitstat] fact on datediff(minute, '2018-01-01 00:00',f.[created_datetime]) = fact.time_key and isnull(l.location_key,1) = fact.location_key
join dim_time ratetime on datediff(minute, '2018-01-01 00:00',[created_datetime]) = ratetime.time_key
left join [quandl].[rates] EUR on ratetime.[date] = EUR.[rate_date] and ratetime.hour_nr = eur.rate_hour  and EUR.[symbol] = 'EUR/GBP'
left join [quandl].[rates] USD on ratetime.[date] = USD.[rate_date] and ratetime.hour_nr = USD.rate_hour  and USD.[symbol] = 'GBP/USD'
where cast([created_datetime] as date) = @date
group by datediff(minute, '2018-01-01 00:00',[created_datetime]) ,
isnull(l.location_key,1) ,
eur.[openbid],
usd.[openbid],
eur.[openask],
usd.[openask]

--update the existing records if previously loaded

update f
set 
	[sentiment_key] = isnull(t.sentiment_key,.5),
	[tweet_count] = t.tweet_count,
	[retweet_count] = t.retweet_count,
	[min_sentiment_score] = t.[min_sentiment_score],
	[max_sentiment_score] = t.max_sentiment_score,
	[avg_sentiment_score] = t.[avg_sentiment_score],
	[EUR_open_bid] = t.EUR_open_bid,
	[USD_open_bid] = t.USD_open_bid,
	[EUR_open_ask] = t.EUR_open_ask,
	[USD_open_ask] = t.USD_open_ask
from [dbo].[fact_brexitstat] f join #tmp t on f.time_key = t.time_key and f.location_key = t.location_key


-- insert new records

insert into [dbo].[fact_brexitstat]
(
	[time_key],
	[location_key],
	[sentiment_key],
	[tweet_count],
	[retweet_count],
	[min_sentiment_score],
	[max_sentiment_score],
	[avg_sentiment_score],
	[EUR_open_bid],
	[USD_open_bid],
	[EUR_open_ask],
	[USD_open_ask]
)
select 
	t.[time_key],
	t.[location_key],
	isnull(t.[sentiment_key],.5),
	t.[tweet_count],
	t.[retweet_count],
	t.[min_sentiment_score],
	t.[max_sentiment_score],
	t.[avg_sentiment_score],
	t.[EUR_open_bid],
	t.[USD_open_bid],
	t.[EUR_open_ask],
	t.[USD_open_ask]
from #tmp t left join [dbo].[fact_brexitstat] f on t.[time_key] = f.[time_key] and t.[location_key] = f.location_key
where f.time_key is null


end



















