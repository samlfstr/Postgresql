-- Parent table --
create table customer(
    customer_id INT GENERATED ALWAYS AS IDENTITY,
    customer_name varchar(255) NOT NULL,
    primary key (customer_id)
);

-- Child table --
-- After constraint keyword the fk prefix : name of the parent PK. --

create table contacts(
    contact_id int generated always as identity,
    customer_id int,
    contact_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    primary key (contact_id),
    constraint fk_customer
     foreign key (customer_id)
      references customer(customer_id)
);

insert into public.stomer
values (default,'Catia');


--delete from customer where customer_id = 1;