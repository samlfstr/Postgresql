-- I create the table
-- Then add the btree

-- I created the table after analysing the data on a CSV file
-- That gave me the basic idea about the
    -- Column names
    -- Data type
    -- Data length
create table _food_names (
   id int generated always as identity,
   food_name varchar(50),
   scientific_name varchar(50),
   groups varchar(50),
   subgroup varchar(50)
);

-- C.O.U Btree
create index _food_btree
on _food_names
using btree(id);


-- Starting with querying
select * from _food_names;
select id from _food_names;

-- Introducing to closes

-- All food name with the initial A
select food_name from _food_names where food_name like 'A%';

-- All food name that starts with A and finishes with any letter
-- Note that uppercase and lowercase is counted
select food_name from _food_names where food_name like 'A%s';

-- All food name that has exactly x letters starting by y
select food_name from _food_names where food_name like 'A_____';

-- All  food name that starts any letter and has exactly x letters underscore number = x
select food_name from _food_names where food_name like '_____a';

-- Give me only some specific letters
select substr(food_name, 0, 3) from _food_names;

-- Combine like with substr() function
-- And give me only the last 3 letters of the words that have a length of 7
select substr(food_name, 4, 5) from _food_names where food_name like '_____a';

-- Give me all the words having 6 letters with an ending of a
select substr(food_name, 0, 2) as initials from _food_names where food_name like '_____a';

-- Summary : substr and like
    -- So I can specify the initial and also the ending or both
    -- I can specify the numbers of letters
    -- I can take specifically certain parts of the data using substr
    -- I can mix substr function with where like clause

-- Use between
-- Query only 100 elements from the table
select food_name from _food_names where id between 1 and 100;

-- Implementing order by ... ascendant or descendant
select food_name from _food_names where food_name like '_____a' order by food_name asc;

-- In used as or operator and not between
-- The queries returned ID's will be shown that way and putting the like at the end
-- allows db to go from 1 to 1000 and look for only names like described on the like clause
select id, food_name from _food_names where id between 1 and 1000 and food_name like '_____a';

-- That way using the values returned from the first query I can more complex queries
-- For example on the query below I used an information returned from the line before
select food_name from _food_names where id in(557,786,843);





