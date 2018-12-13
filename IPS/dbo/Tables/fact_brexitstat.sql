CREATE TABLE [dbo].[fact_brexitstat]
(
	[brexitstat_key] INT identity(1,1) NOT NULL,
	[time_key] INT NOT NULL,
	[location_key] INT NOT NULL,
	[sentiment_key] INT NOT NULL,
	[tweet_count] BIGINT NOT NULL,
	[retweet_count] BIGINT NOT NULL,
	[total_twitter_count] AS [tweet_count] + [retweet_count],
	[min_sentiment_score] FLOAT,
	[max_sentiment_score] FLOAT,
	[avg_sentiment_score] FLOAT,
	[EUR_open_bid] FLOAT,
	[USD_open_bid] FLOAT,
	[EUR_open_ask] FLOAT,
	[USD_open_ask] FLOAT	
 CONSTRAINT [PK_brexitstat__brexitstat_key] PRIMARY KEY CLUSTERED 
(
	[brexitstat_key] ASC
)
)