CREATE TABLE etl.batch_log
(
batch_log_key INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
batch_key INT,
package_name varchar(64) NOT NULL,
source_name varchar(64) NOT NULL,
file_loaded varchar(256) NULL,
loaded_datetime DATETIME NOT NULL

CONSTRAINT FK_batch_log_batch FOREIGN KEY (batch_key)     
    REFERENCES etl.batch (batch_key)
)