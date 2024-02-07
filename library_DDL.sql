drop table if exists genre;
create table genre (
	id serial primary key,
	genre_type varchar(15) unique not null
	);

drop table if exists author;
create table author (
	id serial primary key,
	first_name varchar(15) not null,
	last_name varchar(15) not null
	);

drop table if exists publisher;
create table publisher (
	id serial primary key,	
	publisher_name text unique not null
	);

drop table if exists book_type;
create table book_type (
	id serial primary key,
	type varchar(10) unique not null
	);

drop table if exists message;
create table message (
	id serial primary key,
	message text unique not null,
	type varchar(20) unique not null
	);

drop table if exists city;
create table city (
	id serial primary key,
	city_name text unique not null
	);

drop table if exists zip_city;
create table zip_city (
	id serial primary key,
	zip_code int not null,
	city_id int not null references city (id)
	);

drop table if exists address;
create table address (
	id serial primary key,
	address text unique not null,
	zip_city_id int not null references zip_city (id)
	);

drop table if exists book;
create table book (
	id serial primary key,
	title text unique not null,
	published_year date not null,
	publisher_id int not null references publisher (id)
	);

drop table if exists author_book;
create table author_book (
	id serial primary key,
	author_id int not null references author (id),
	book_id int not null references book (id)
	);

drop table if exists book_genre;
create table book_genre (
	id serial primary key,
	book_id int not null references book (id),
	genre_id int not null references genre (id)
	);

drop table if exists book_copy;
create table book_copy (
	id serial primary key,
	page_count int not null,
	status varchar(15) not null,
	book_type_id int not null references book_type (id),
	book_id int not null references book (id)
	);

drop table if exists customer;
create table customer (
	id serial primary key,
	first_name varchar(15) not null,
	last_name varchar(15) not null,
	DOB date not null,
	phone_number text unique not null,
	email text unique not null,
	address_id int not null references address (id)
	);

drop table if exists notification;
create table notification (
	id serial primary key,
	notification_date date not null,
	status varchar(10) not null,
	message_id int not null references message (id),
	customer_id int not null references customer (id)
	);

drop table if exists rental;
create table rental (
	id serial primary key,
	start_date date not null,
	due_date date not null,
	returned_date date,
	status varchar(10),
	book_copy_id int not null references book_copy (id),
	customer_id int not null references customer (id)
	);

drop table if exists wait_list;
create table wait_list (
	id serial primary key,
	customer_id int not null references customer (id),
	book_copy_id int not null references book_copy (id)
	);











