CREATE TABLE twitter.twitter_feed 
(
	tweet_key int identity(1,1) not null primary key,
    [tweet_id] bigint,
    [tweet_idstr] varchar(50),
    [tweet_text] varchar(280),
    [created_datetime] datetime,
    [retweet] int,
    [location] varchar(1024),
	[load_etl_bath_key] int
)