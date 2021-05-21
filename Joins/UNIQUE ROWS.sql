drop table if exists numbers;
drop table if exists pair_numbers;


create table numbers(
    number_id INT GENERATED ALWAYS AS IDENTITY,
    number INT
);

create table pair_numbers(
    p_number_id INT GENERATED ALWAYS AS IDENTITY,
    p_number INT
);

insert into numbers (number) values
('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9');

insert into pair_numbers(p_number) values
('0'),
('2'),
('4'),
('6'),
('8'),
('10'),
('9');

select public.numbers.number, public.pair_numbers.p_number
from numbers
full join pair_numbers
on pair_numbers.p_number = numbers.number
where numbers is null or pair_numbers is null;