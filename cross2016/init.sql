CREATE DATABASE cross2016 DEFAULT CHARSET utf8;
use cross2016;
CREATE TABLE report (
  report_from DATE,
  report_to DATE,
  campaign_name VARCHAR(100) NOT NULL,
  placement VARCHAR(100) NOT NULL,
  status VARCHAR(20) NOT NULL,
  result INT NOT NULL,
  result_type VARCHAR(100) NOT NULL,
  reach INT NOT NULL,
  cpa INT NOT NULL,
  spend INT NOT NULL
);
LOAD DATA INFILE '/tmp/report.csv' INTO TABLE report FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
