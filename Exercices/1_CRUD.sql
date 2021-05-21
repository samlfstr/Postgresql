-- Create table
create table _food_names (
   id int generated always as identity,
   food_name varchar(50),
   scientific_name varchar(50),
   groups varchar(50),
   subgroup varchar(50)
);

-- Read table
select * from _food_names;

-- Update table column name
alter table _food_names
rename column scientific_name to scify_name;

alter table _food_names
rename column groups to group_name;

alter table _food_names
rename column subgroup to subgroup_name;

-- update a column
-- if I run this line it'll change all the values of the column food_name
update _food_names
set food_name = 'null';

-- first query before the update
select food_name from _food_names where food_name like '_____a';

-- but if I do sth like that I give a more specific instruction
update _food_names
set food_name = 'null'
where food_name like '_____a';

-- now again and all gone
select food_name from _food_names where food_name like '_____a';

-- lets try rollback there is no transaction in progress error returns
rollback;

-- Delete table
delete from _food_names;

-- After that the id counter is fucked it is a very good occasion for us to use the proper code
-- But first you need to delete all data inside the table then import all again unless it wont work
-- I still don't know how to reorganize deleted items indexes after their deletion though
alter sequence _food_names_id_seq restart;