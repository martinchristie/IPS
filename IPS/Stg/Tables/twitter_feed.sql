create TABLE Stg.[twitter_feed] 
(
    [tweet_id] bigint not null,
	[tweet_idstr] varchar(50),
	[tweet_text] varchar(280),
    [createddatetime] varchar(50),
    [is_retweet] int,
	[location] varchar(1024)
)
