-- show time zone
show timezone;

-- not date() but now() function date() doesn't exist
-- and not with show keyword but select key word
select now()::date;

select now()::time;

-- you can even use concat to put time and date together
select concat(now()::date, now()::time);

-- now use the to_char function to specify the time format
-- you can use it with now() function
select to_char(now(), 'DD/MM/YY');


-- some other parameters
-- that way you can configure the time format
select to_char(now(), 'DD/MM/YYYY HH12:MM:SS');

-- go further french time format babe
select to_char(now(), 'DD/MM/YYYY HH24:MM:SS');

-- lets now calculate the age
-- you'll provide the first date and the other date
select age(now(),'30/08/1994');

-- lets now modify the current time zone from utc to something else
-- +3 is Turkey
alter user postgres set timezone = 'MST';


-- here is a very very useful function that return all the time zone names
select name from pg_timezone_names;

-- you want something more exhaustive
select * from pg_timezone_names;

-- abbreviations
select abbrev from pg_timezone_names order by abbrev;

-- lets find Turkey
select name from pg_timezone_names where name like '%is';

-- lets try again
alter user postgres set timezone = 'Europe/Paris';

-- lets rerun the code
select now();

-- Okay when I change the time zone with the region name it works
-- but wont let me change the UTC, okay

-- lets restart and try again if it remains
-- yes it is now Europe/Paris




