create or replace view office as
select l.location_id, l.street_address, l.postal_code, l.state_province,
       c.country_id, c.country_name, r.region_id, r.region_name
  from locations l,
       countries c,
       regions r
 where l.country_id = c.country_id
   and c.region_id = r.region_id;
