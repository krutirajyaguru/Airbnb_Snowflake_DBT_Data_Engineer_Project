CREATE FILE FORMAT IF NOT EXISTS csv_format
  TYPE = 'CSV' 
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

SHOW FILE FORMATS;

CREATE OR REPLACE STAGE snowstage
FILE_FORMAT = csv_format
URL='s3://....';

SHOW STAGES;

COPY INTO BOOKINGS
FRoM @snowstage
FILES=('bookings.csv')
CREDENTIALS=(aws_key_id = '', aws_secret_key = '');

COPY INTO LISTINGS
FRoM @snowstage
FILES=('listings.csv')
CREDENTIALS=(aws_key_id = '', aws_secret_key = '');

COPY INTO HOSTS
FRoM @snowstage
FILES=('hosts.csv')
CREDENTIALS=(aws_key_id = '', aws_secret_key = '');


SELECT * FROM LISTINGS;
SELECT * FROM HOSTS;
SELECT * FROM BOOKINGS;