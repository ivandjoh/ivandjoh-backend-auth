drop ivandjoh_db;
drop user ivandjoh;
create user ivandjoh with password 'postgres';
create database ivandjoh_db with template=template0 owner=ivandjoh;
\connect ivandjoh_db;
alter default privileges grant all on table to ivandjoh;
alter default privileges grant all on sequence to ivandjoh;

create table id_users(
    user_id integer primary key not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(35) not null,
    password text not null
);

create table id_categories(
    category_id integer primary key not null,
    user_id integer not null,
    title varchar(50) not null,
    description varchar(225) not null
);

alter table id_categories add constraint cat_users_fk
foreign key (user_id) references id_users(user_id);

create table id_transactions(
    transaction_id integer primary key not null,
    category_id integer not null,
    user_id integer not null,
    amount numeric(10, 2) not null
);


