drop table admin.DRIVER_STANDINGS;

drop table admin.LAP_TIMES;

drop table admin.PIT_STOPS;

drop table admin.RACES;

drop table admin.RESULTS;

drop table admin.SAFETY_CAR;

CREATE TABLE ADMIN.DRIVER_STANDINGS 
    ( 
     DRIVERSTANDINGSID                          NUMBER(38) , 
     RACEID                                     NUMBER(38) , 
     DRIVERID                                   NUMBER(38) , 
     POINTS                                     NUMBER(38) , 
     POSITION                                   NUMBER(38) , 
     POSITIONTEXT                               VARCHAR2(4000) , 
     WINS                                       NUMBER(38) , 
     YEAR                                       NUMBER(38) , 
     ROUND                                      NUMBER(38) , 
     NAME                                       VARCHAR2(4000) , 
     DRIVERREF                                  VARCHAR2(4000) , 
     FINAL                                      VARCHAR2(4000) , 
     DRIVER_POSITION_BEFORE_RACE                NUMBER(38) , 
     DRIVER_POINTS_BEFORE_RACE                  NUMBER(38) , 
     POSITION_POINTS_BEFORE_RACE                NUMBER(38) , 
     POINTS_OF_LOWER_POSITION                   NUMBER(38) , 
     POINTS_OF_LOWER_POSITION_BEFORE_RACE       NUMBER(38) , 
     DELTA_POINTS_TO_LOWER_POSITION             NUMBER(38) , 
     DELTA_POINTS_TO_LOWER_POSITION_BEFORE_RACE NUMBER(38) , 
     CHANGE_DELTA_BEFORE_AND_AFTER_RACE         NUMBER(38) 
    ) 
    LOGGING 
;


CREATE TABLE ADMIN.LAP_TIMES
    ( 
     RACEID                         NUMBER(38) , 
     DRIVERID                       NUMBER(38) , 
     LAP                            NUMBER(38) , 
     POSITION                       NUMBER(38) , 
     MILLISECONDS                   NUMBER(38) , 
     DRIVERREF                      VARCHAR2(4000) , 
     RACE_NAME                      VARCHAR2(4000) , 
     PIT_STOP                       VARCHAR2(4000) , 
     MILLISECONDS_CUMULATIVE        NUMBER(38) , 
     MEDIAN_MILLISECONDS_CUMULATIVE NUMBER(38) 
    ) 
    LOGGING 
;


CREATE TABLE ADMIN.PIT_STOPS 
    ( 
     RACEID           NUMBER(38) , 
     DRIVERID         NUMBER(38) , 
     STOP             NUMBER(38) , 
     LAP              NUMBER(38) , 
     TIME             VARCHAR2(4000) , 
     DURATION         VARCHAR2(4000) , 
     MILLISECONDS     NUMBER(38) , 
     DATETIME_PITSTOP DATE , 
     DRIVERREF        VARCHAR2(4000) 
    ) 
    LOGGING 
;


CREATE TABLE ADMIN.RACES
    ( 
     RACEID                    NUMBER(38) , 
     YEAR                      NUMBER(38) , 
     ROUND                     NUMBER(38) , 
     NAME                      VARCHAR2(4000) , 
     F1DATE                    DATE, 
     TIME                      VARCHAR2(4000) , 
     URL                       VARCHAR2(4000) , 
     SCORE                     NUMBER(10,3) , 
     DNF_COUNT                 NUMBER(38) , 
     DNF_DUE_TO_ACCIDENT_COUNT NUMBER(38) , 
     WEATHER                   VARCHAR2(4000) , 
     WEATHER_WET               VARCHAR2(4000) , 
     CIRCUITREF                VARCHAR2(4000) , 
     YEAR_C                    NUMBER(38) , 
     RACE_COUNT                NUMBER(38) , 
     NAME_YEAR                 VARCHAR2(4000) , 
     OVERTAKEN_POSITIONS_TOTAL NUMBER(38) 
    ) 
    LOGGING 
;


CREATE TABLE ADMIN.RESULTS
    ( 
     RESULTID        NUMBER(38) , 
     RACEID          NUMBER(38) , 
     DRIVERID        NUMBER(38) , 
     CONSTRUCTORID   NUMBER(38) , 
     F1NUM           NUMBER(38) , 
     GRID            NUMBER(38) , 
     POSITION        NUMBER(38) , 
     POSITIONTEXT    VARCHAR2(4000) , 
     POSITIONORDER   NUMBER(38) , 
     POINTS          NUMBER(38) , 
     LAPS            NUMBER(38) , 
     TIME            VARCHAR2(4000) , 
     MILLISECONDS    NUMBER(38) , 
     FASTESTLAP      NUMBER(38) , 
     RANK            NUMBER(38) , 
     FASTESTLAPTIME  VARCHAR2(4000) , 
     FASTESTLAPSPEED NUMBER(38) , 
     STATUSID        NUMBER(38) , 
     YEAR            NUMBER(38) , 
     ROUND           NUMBER(38) , 
     NAME            VARCHAR2(4000) , 
     POINTS_CHAR     VARCHAR2(4000) 
    ) 
    LOGGING 
;


CREATE TABLE ADMIN.SAFETY_CAR 
    ( 
     YEAR  NUMBER(38) , 
     RACE  VARCHAR2(4000) , 
     COUNT NUMBER(38) , 
     LAPS  NUMBER(38) 
    ) 
    LOGGING 
;

create view driver_names as
select distinct driverid, driverref
from DRIVER_STANDINGS
where driverref is not null
order by driverid;

