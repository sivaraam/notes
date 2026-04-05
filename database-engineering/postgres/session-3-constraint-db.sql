-- Create table
create table users (
  id serial primary key,
  name text not null,
  email text unique not null,
  salary float not null,
  age integer check (age > 18),
  is_active boolean default true,
  created_at timestamp default NOW()
);

-- Insert values
insert into users (name, email, salary, age) values (
  'Mankia', 'man@man.com', 1000, 20
);

-- Insert that'll fail due to constraint
-- insert into users (name, email, salary, age) values (
--  'Kiaman', 'man@example.com', 1000, 10
-- );

-- Insert that'll fail due to constraint
-- insert into users (name, email, salary, age) values (
--  'Kiaman', 'man@man.com', 1000, 21
-- );



insert into users (name, email, salary, age) values (
  'Kiaman', 'man@exmaple.com', 1000, 21
);

insert into users (name, email, salary, age) values (
  'Kiaman', 'man@google.com', 5000, 21
);

select * from users;

update users set salary = 10000 where id = 3;

-- Truncate table
-- truncate table users;
