CREATE TABLE [dbo].[sentiment]
(
	[sentiment_key] [int] identity(1,1) NOT NULL,
	[sentiment_lower_bound] float not null,
	[sentiment_upper_bound] float not null,
	[sentiment] varchar(32) not null,
 CONSTRAINT [PK_sentiment__sentiment_key] PRIMARY KEY CLUSTERED 
(
	[sentiment_key] ASC
)
)