create sequence regions_seq START WITH 10;

ALTER TABLE REGIONS  
MODIFY (REGION_ID default regions_seq.nextval);

ALTER TABLE LOCATIONS  
MODIFY (LOCATION_ID default locations_seq.nextval);

alter table departments
modify (department_id default departments_seq.nextval);

alter table employees
modify (employee_id default EMPLOYEES_SEQ.nextval);

