drop table ACTIVITIES;
load activities ./activities.csv new;
@./db_scripts/chart.sql

@./db_scripts/dashboard.sql
/
-- exit
