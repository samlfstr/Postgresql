--Delete all the raw--
delete from signals;

--Restart the id sequence--
ALTER SEQUENCE signals_id_seq RESTART;

--Chaining with or <column_name> like '%';--
select * from signals where signals like '01%' or signals like '00%' or signals like '11%';

-- Request Signals --
--Slave Address
select substr(signals,0,3) as SlaveIDs from signals;

--Function Code
select substr(signals,3,2) as FunctionCodes from signals;

--Data Address
select substr(signals,5,4) as DataAdresses from signals;

--Data Length
select substr(signals,9,4) as Datalengths from signals;

--CRC - Cyclic Redundancy Check
select substr(signals,13,4) as CRC from signals;

--During the session
set time zone 'UTC';

create index btreeindex
on signals
using btree(signals);

show timezone;

set time zone 'UTC+3';

alter user postgres set timezone='UTC+3';

create table timestamp(
  ts timestamp with time zone,
  tz timestamp without time zone
);


insert into timestamp values(
    timestamp with time zone '2021-04-28 10:00:00-05',
    timestamp without time zone '2021-04-28 10:00:00-05'
);

select ts from timestamp;
select tz from timestamp;

-- These can be used separately as well
select now()::date as date_now;
select now()::time;
-- That shows both
select now();
-- It seems same as now()::date
select current_date as date;

-- show the timestamp in a specific format
select to_char(now()::date, 'dd/mm/yyyy');

select to_char(ts,'dd/mm/yy') from timestamp;
select to_char(ts,'dd/mm/yyyy') from timestamp;
select to_char(ts,'dd/mm/yyyy HH12:MIPM') from timestamp;
select to_char(ts,'dd/mm/yyyy HH24:MI') from timestamp;

select to_char(age(date '30/01/1994'), 'yy" years and "mm" months "');

select extract(Day from now());
select extract(Month from current_date);
select extract(Century from now());
-- day of the week
select extract(Dow from now());
-- day of the year
select extract(Doy from now());

select date_trunc('year', date '1992/11/13');
select date_trunc('day', now()::date);
select to_char(now()::time, 'HH24 "hours"');

create table rental(
    rental_id int generated always as identity unique,
    rental_date timestamp without time zone,
    primary key (rental_id)
);

drop table rental;

-- C.O.U
create index rental_b on rental using btree(rental_id);

insert into rental values(default,now());

-- When I say minute it gives me all rental date according to the minute
-- When I say sec all data that's been registered based on sec
select date_trunc('second',rental_date) m,
       count(rental_id)
from rental group by m order by m;

SELECT
	now(),
       now() - INTERVAL '1 year 3 hours 20 minutes'
	    AS "3 hours 20 minutes ago of last year";