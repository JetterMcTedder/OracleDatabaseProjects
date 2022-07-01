create or replace procedure salary_check (p_job_id in varchar2,
                                          p_salary in number, 
                                          p_result out varchar2, 
                                          p_error_out out varchar2) as

    l_salary_in_band number := 0;

begin

    select count(*)
    into l_salary_in_band
    from jobs
    where p_salary between min_salary and max_salary
    and job_id = p_job_id;        

    if l_salary_in_band > 0 then
        p_result := 'The salary of '||p_salary||' is in the salary band for job '||p_job_id;

    else
        p_result := 'The salary of '||p_salary||' is not in the salary band for job '||p_job_id;
    end if;

    exception
        when others then
            p_error_out := 'Unexpected Error: '|| SQLERRM;

end salary_check;
/


create or replace procedure create_office ( p_location_street_address in varchar2,
                                            p_location_postal_code in varchar2,
                                            p_location_city in varchar2,
                                            p_location_state in varchar2,
                                            p_country_id in varchar2 default null,
                                            p_country_name in varchar2 default null,
                                            p_region_id in number default null,
                                            p_region_name in varchar2 default null,
                                            p_location_id out number,
                                            p_error_out out varchar2)

as 

    l_region_exists number := 0;
    l_country_exists number := 0;
    l_location_exists number := 0;
    l_region_id number;

begin 

-- Check for Duplicate Values

    select count(*) 
      into l_region_exists
      from regions
     where region_name = p_region_name;
    
    select count(*) 
      into l_country_exists
      from countries
     where country_name = p_country_name and country_id = p_country_id;    
    
    select count(*) 
      into l_location_exists
      from locations
     where street_address = p_location_street_address;

-- handle duplicate value

    if l_region_exists = 1 or 
       l_country_exists = 1 or 
       l_location_exists = 1 then
    
            p_error_out := 'Resource exists, please check your values';
    
    else
    
        -- insert into regions
    
       if p_region_id is null and p_region_name is not null
        then 
            insert into regions (region_name)
                 values (p_region_name)
              returning region_id into l_region_id;
        else
            l_region_id := p_region_id;
        end if;
    
    
        if p_country_id is not null and p_country_name is not null
            then
                insert into countries (country_id, country_name, region_id)
                               values (p_country_id, p_country_name, l_region_id);
        end if;
    
    
        insert into locations (street_address, postal_code, city, state_province, country_id)
                       values (p_location_street_address, p_location_postal_code, p_location_city, p_location_state, p_country_id)
                    returning location_id into p_location_id;
    
    end if;


    exception
        when others then
            p_error_out := 'Unexpected Error: '|| SQLERRM;

end create_office;
/
