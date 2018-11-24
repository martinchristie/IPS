CREATE TABLE etl.batch
(
batch_key INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
batch_data_date DATETIME NOT NULL,
batch_status VARCHAR(32) NOT NULL,
batch_start_datetime DATETIME NOT NULL,
batch_end_datetime DATETIME NULL,
)
