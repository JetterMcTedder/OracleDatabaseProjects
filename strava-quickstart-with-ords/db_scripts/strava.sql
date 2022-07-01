@./db_scripts/admin.sql
/
@./db_scripts/rest.sql
/
conn strava/ST11##11rava@STVDB_high

drop table ACTIVITIES;
load activities ./activities.csv new;
@./db_scripts/chart.sql

@./db_scripts/dashboard.sql
/
-- exit
