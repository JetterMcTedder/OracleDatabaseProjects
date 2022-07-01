create or replace package countries_tapi
is

type countries_tapi_rec is record (
region_id  countries.region_id%type
,country_id  countries.country_id%type
,country_name  countries.country_name%type
);
type countries_tapi_tab is table of countries_tapi_rec;

-- insert
procedure ins (
p_region_id in countries.region_id%type default null 
,p_country_id in countries.country_id%type
,p_country_name in countries.country_name%type default null 
);
-- update
procedure upd (
p_region_id in countries.region_id%type default null 
,p_country_id in countries.country_id%type
,p_country_name in countries.country_name%type default null 
);
-- delete
procedure del (
p_country_id in countries.country_id%type
);
end countries_tapi;

/
create or replace package body countries_tapi
is
-- insert
procedure ins (
p_region_id in countries.region_id%type default null 
,p_country_id in countries.country_id%type
,p_country_name in countries.country_name%type default null 
) is
begin
insert into countries(
region_id
,country_id
,country_name
) values (
p_region_id
,p_country_id
,p_country_name
);end;
-- update
procedure upd (
p_region_id in countries.region_id%type default null 
,p_country_id in countries.country_id%type
,p_country_name in countries.country_name%type default null 
) is
begin
update countries set
region_id = p_region_id
,country_name = p_country_name
where country_id = p_country_id;
end;
-- del
procedure del (
p_country_id in countries.country_id%type
) is
begin
delete from countries
where country_id = p_country_id;
end;
end countries_tapi;
/

create or replace package departments_tapi
is

type departments_tapi_rec is record (
department_name  departments.department_name%type
,department_id  departments.department_id%type
,location_id  departments.location_id%type
,manager_id  departments.manager_id%type
);
type departments_tapi_tab is table of departments_tapi_rec;

-- insert
procedure ins (
p_department_name in departments.department_name%type
,p_location_id in departments.location_id%type default null 
,p_manager_id in departments.manager_id%type default null 
);
-- update
procedure upd (
p_department_name in departments.department_name%type
,p_department_id in departments.department_id%type
,p_location_id in departments.location_id%type default null 
,p_manager_id in departments.manager_id%type default null 
);
-- delete
procedure del (
p_department_id in departments.department_id%type
);
end departments_tapi;

/
create or replace package body departments_tapi
is
-- insert
procedure ins (
p_department_name in departments.department_name%type
,p_location_id in departments.location_id%type default null 
,p_manager_id in departments.manager_id%type default null 
) is
begin
insert into departments(
department_name
,location_id
,manager_id
) values (
p_department_name
,p_location_id
,p_manager_id
);end;
-- update
procedure upd (
p_department_name in departments.department_name%type
,p_department_id in departments.department_id%type
,p_location_id in departments.location_id%type default null 
,p_manager_id in departments.manager_id%type default null 
) is
begin
update departments set
department_name = p_department_name
,location_id = p_location_id
,manager_id = p_manager_id
where department_id = p_department_id;
end;
-- del
procedure del (
p_department_id in departments.department_id%type
) is
begin
delete from departments
where department_id = p_department_id;
end;
end departments_tapi;
/

create or replace package employees_tapi
is

type employees_tapi_rec is record (
job_id  employees.job_id%type
,employee_id  employees.employee_id%type
,salary  employees.salary%type
,hire_date  employees.hire_date%type
,department_id  employees.department_id%type
,last_name  employees.last_name%type
,email  employees.email%type
,phone_number  employees.phone_number%type
,first_name  employees.first_name%type
,commission_pct  employees.commission_pct%type
,manager_id  employees.manager_id%type
);
type employees_tapi_tab is table of employees_tapi_rec;

-- insert
procedure ins (
p_job_id in employees.job_id%type
,p_salary in employees.salary%type default null 
,p_hire_date in employees.hire_date%type
,p_department_id in employees.department_id%type default null 
,p_last_name in employees.last_name%type
,p_email in employees.email%type
,p_phone_number in employees.phone_number%type default null 
,p_first_name in employees.first_name%type default null 
,p_commission_pct in employees.commission_pct%type default null 
,p_manager_id in employees.manager_id%type default null 
);
-- update
procedure upd (
p_job_id in employees.job_id%type
,p_employee_id in employees.employee_id%type
,p_salary in employees.salary%type default null 
,p_hire_date in employees.hire_date%type
,p_department_id in employees.department_id%type default null 
,p_last_name in employees.last_name%type
,p_email in employees.email%type
,p_phone_number in employees.phone_number%type default null 
,p_first_name in employees.first_name%type default null 
,p_commission_pct in employees.commission_pct%type default null 
,p_manager_id in employees.manager_id%type default null 
);
-- delete
procedure del (
p_employee_id in employees.employee_id%type
);
end employees_tapi;
/
create or replace package body employees_tapi
is
-- insert
procedure ins (
p_job_id in employees.job_id%type
,p_salary in employees.salary%type default null 
,p_hire_date in employees.hire_date%type
,p_department_id in employees.department_id%type default null 
,p_last_name in employees.last_name%type
,p_email in employees.email%type
,p_phone_number in employees.phone_number%type default null 
,p_first_name in employees.first_name%type default null 
,p_commission_pct in employees.commission_pct%type default null 
,p_manager_id in employees.manager_id%type default null 
) is
begin
insert into employees(
job_id
,salary
,hire_date
,department_id
,last_name
,email
,phone_number
,first_name
,commission_pct
,manager_id
) values (
p_job_id
,p_salary
,p_hire_date
,p_department_id
,p_last_name
,p_email
,p_phone_number
,p_first_name
,p_commission_pct
,p_manager_id
);end;
-- update
procedure upd (
p_job_id in employees.job_id%type
,p_employee_id in employees.employee_id%type
,p_salary in employees.salary%type default null 
,p_hire_date in employees.hire_date%type
,p_department_id in employees.department_id%type default null 
,p_last_name in employees.last_name%type
,p_email in employees.email%type
,p_phone_number in employees.phone_number%type default null 
,p_first_name in employees.first_name%type default null 
,p_commission_pct in employees.commission_pct%type default null 
,p_manager_id in employees.manager_id%type default null 
) is
begin
update employees set
job_id = p_job_id
,salary = p_salary
,hire_date = p_hire_date
,department_id = p_department_id
,last_name = p_last_name
,phone_number = p_phone_number
,first_name = p_first_name
,commission_pct = p_commission_pct
,manager_id = p_manager_id
,email = p_email
where employee_id = p_employee_id;
end;
-- del
procedure del (
p_employee_id in employees.employee_id%type
) is
begin
delete from employees
where employee_id = p_employee_id;
end;
end employees_tapi;
/

create or replace package jobs_tapi
is

type jobs_tapi_rec is record (
job_id  jobs.job_id%type
,min_salary  jobs.min_salary%type
,job_title  jobs.job_title%type
,max_salary  jobs.max_salary%type
);
type jobs_tapi_tab is table of jobs_tapi_rec;

-- insert
procedure ins (
p_job_id in jobs.job_id%type
,p_min_salary in jobs.min_salary%type default null 
,p_job_title in jobs.job_title%type
,p_max_salary in jobs.max_salary%type default null 
);
-- update
procedure upd (
p_job_id in jobs.job_id%type
,p_min_salary in jobs.min_salary%type default null 
,p_job_title in jobs.job_title%type
,p_max_salary in jobs.max_salary%type default null 
);
-- delete
procedure del (
p_job_id in jobs.job_id%type
);
end jobs_tapi;

/
create or replace package body jobs_tapi
is
-- insert
procedure ins (
p_job_id in jobs.job_id%type
,p_min_salary in jobs.min_salary%type default null 
,p_job_title in jobs.job_title%type
,p_max_salary in jobs.max_salary%type default null 
) is
begin
insert into jobs(
job_id
,min_salary
,job_title
,max_salary
) values (
p_job_id
,p_min_salary
,p_job_title
,p_max_salary
);end;
-- update
procedure upd (
p_job_id in jobs.job_id%type
,p_min_salary in jobs.min_salary%type default null 
,p_job_title in jobs.job_title%type
,p_max_salary in jobs.max_salary%type default null 
) is
begin
update jobs set
min_salary = p_min_salary
,job_title = p_job_title
,max_salary = p_max_salary
where job_id = p_job_id;
end;
-- del
procedure del (
p_job_id in jobs.job_id%type
) is
begin
delete from jobs
where job_id = p_job_id;
end;
end jobs_tapi;
/

create or replace package locations_tapi
is

type locations_tapi_rec is record (
country_id  locations.country_id%type
,city  locations.city%type
,postal_code  locations.postal_code%type
,state_province  locations.state_province%type
,location_id  locations.location_id%type
,street_address  locations.street_address%type
);
type locations_tapi_tab is table of locations_tapi_rec;

-- insert
procedure ins (
p_country_id in locations.country_id%type default null 
,p_city in locations.city%type
,p_postal_code in locations.postal_code%type default null 
,p_state_province in locations.state_province%type default null 
,p_street_address in locations.street_address%type default null 
);
-- update
procedure upd (
p_country_id in locations.country_id%type default null 
,p_city in locations.city%type
,p_postal_code in locations.postal_code%type default null 
,p_state_province in locations.state_province%type default null 
,p_location_id in locations.location_id%type
,p_street_address in locations.street_address%type default null 
);
-- delete
procedure del (
p_location_id in locations.location_id%type
);
end locations_tapi;

/
create or replace package body locations_tapi
is
-- insert
procedure ins (
p_country_id in locations.country_id%type default null 
,p_city in locations.city%type
,p_postal_code in locations.postal_code%type default null 
,p_state_province in locations.state_province%type default null 
,p_street_address in locations.street_address%type default null 
) is
begin
insert into locations(
country_id
,city
,postal_code
,state_province
,street_address
) values (
p_country_id
,p_city
,p_postal_code
,p_state_province
,p_street_address
);end;
-- update
procedure upd (
p_country_id in locations.country_id%type default null 
,p_city in locations.city%type
,p_postal_code in locations.postal_code%type default null 
,p_state_province in locations.state_province%type default null 
,p_location_id in locations.location_id%type
,p_street_address in locations.street_address%type default null 
) is
begin
update locations set
country_id = p_country_id
,city = p_city
,postal_code = p_postal_code
,state_province = p_state_province
,street_address = p_street_address
where location_id = p_location_id;
end;
-- del
procedure del (
p_location_id in locations.location_id%type
) is
begin
delete from locations
where location_id = p_location_id;
end;
end locations_tapi;
/

create or replace package regions_tapi
is

type regions_tapi_rec is record (
region_id  regions.region_id%type
,region_name  regions.region_name%type
);
type regions_tapi_tab is table of regions_tapi_rec;

-- insert
procedure ins (
p_region_name in regions.region_name%type 
);
-- update
procedure upd (
p_region_id in regions.region_id%type
,p_region_name in regions.region_name%type default null 
);
-- delete
procedure del (
p_region_id in regions.region_id%type
);
end regions_tapi;
/

create or replace package body regions_tapi
is
-- insert
procedure ins (
p_region_name in regions.region_name%type 
) is
begin
insert into regions(
region_name
) values (
p_region_name
);end;
-- update
procedure upd (
p_region_id in regions.region_id%type
,p_region_name in regions.region_name%type default null 
) is
begin
update regions set
region_name = p_region_name
where region_id = p_region_id;
end;
-- del
procedure del (
p_region_id in regions.region_id%type
) is
begin
delete from regions
where region_id = p_region_id;
end;
end regions_tapi;
/
