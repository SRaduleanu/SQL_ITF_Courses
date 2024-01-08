/* In baza de date pe care ati creat-o la cursul anterior efectuati urmatoarele activitati:

 1. Inserati un singur rand intr-una sau mai multe dintre tabelele deja existente - toate coloanele trebuie sa fie populate si specificate explicit in instructiunea de insert - insert into nume_tabela (coloana_1, coloana_2) values (value_1, value_2)
 2. Inserati un singur rand intr-una sau mai multe dintre tabelele deja existente - toate coloanele trebuie sa fie populate in mod implicit in instructiunea de insert -  insert into nume_tabela values (value_1, value_2)
 3. Stergeti un singur rand dintr-una sau mai multe din tabelele deja existente si observati mesajul din action output: delete from nume_tabela where conditie_de_stergere
 4. Stergeti toate randurile dintr-una sau mai multe din tabelele deja existente si observati mesajul din action output:  delete from nume_tabela 
 5. Actualizati o singura inregistrare dintr-una sau mai multe din tabelele deja existente si observati mesajul din action output: update nume_tabela set nume_coloana = valoare_de_actualizare where conditie_de_actualizare
 6. Actualizati toate inregistrarile  dintr-una sau mai multe din tabelele deja existente si observati mesajul din action output: update nume_tabela set nume_coloana = valoare_de_actualizare
 7. Incercati sa inserati intr-o tabela o valoare pe una dintre coloanele care serveste drept cheie secundara una din valorile care nu exista pe cheia primara. Observati mesajul din Action Output. De ce il primim? Cum putem sa il rezolvam?
 8. Incercati sa stergeti  dintr-o tabela o valoare pe una dintre coloanele care serveste drept cheie primara  una din valorile care au un corespondent pe o cheie secundara corespondenta. Observati mesajul din Action Output. De ce il primim? Cum putem sa il rezolvam?
 9. Incercati sa stergeti (toate) valorile dintr-o tabela in care exista o cheie primara populata cu valori ce au un corespondent pe cheia secundara. Observati mesajul din Action Output. De ce il primim? Cum putem sa il rezolvam?
10. Incercati sa actualizati (toate) valorile dintr-o tabela in care exista o cheie primara populata cu valori ce au un corespondent pe cheia secundara. Observati mesajul din Action Output. De ce il primim? Cum putem sa il rezolvam?

*/

create database TMTA11_RSN;

create table users (
	id INT primary key, 
	username VARCHAR(50), age INT
);

create table orders (
	order_id int primary key auto_increment, 
	user_id int,
	order_date DATETIME,
	total_amount DECIMAL(10,2),
	foreign key (user_id) REFERENCES users(id)
);

create table categories (
	category_id int primary key auto_increment,
    category_name varchar(50)
);
    
create table products (
	product_id int primary key auto_increment,
	product_name varchar(100),
    category_id int,
    foreign key (category_id) references categories(category_id)
);

create table customers(
	customer_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(20),
    email varchar(100),
    index(email)
);

alter table users modify column id int auto_increment;

alter table products add price decimal(10,2);

insert into users (id, username, age) values
	(1, 'Maria Cristina', 30),
    (2, 'Cristi Ion', 25),
    (3, 'Ianis Vasile', 35),
    (4, 'ANDREEA MARIA', 40);
select * from users;

insert into orders (user_id, order_date, total_amount)
values
	(1, '2023-10-26 18:30:00', 50.25),
	(2, '2023-10-26 17:30:00', 75.50),
	(1, '2023-10-25 14:01:00', 150.99),
	(3, '2023-10-24 11:05:00', 501.25),
	(4, '2023-10-20 12:40:35', 1958.49);
select * from orders;

insert into categories (category_name)
values
	('Electronice'),
	('Imbracaminte'),
	('Accesorii'),
	('Alimente');
select * from categories;

insert into products (product_name, category_id, price)
values
	('Televizor smart', 1, 1999.99),
	('Bluza din bumbac', 2, 175.64),
	('Casca bluetooth', 3, 450.75),
	('Paine neagra', 4, 9.45);
select * from products;

insert into customers (first_name, last_name, email)
values
	('Maria', 'Cristina', 'maria.cristina@yahoo.com'),
    ('Cristi', 'Ion', 'cristi.ion@yahoo.com'),
    ('Ianis', 'Vasile', 'ianis.vasile@yahoo.com'),
    ('Andreea', 'Maria', 'andreea_maria@yahoo.com');
select * from customers;

update customers set last_name = 'Ioana'
where customer_id = 4;
    
update customers set email = 'andreea_ioana@yahoo.com'
where customer_id = 4;

insert into customers (first_name, last_name, email)
values
	('Marco', 'Polo', 'dasdsadas@gmail');

delete from customers where customer_id = 5;

insert into orders (user_id, order_date, total_amount)
values
	(5, '2023-10-26 18;30:00', 50.25);

insert into users (id, username, age) values
	(5, 'Maria Cristina', 30),
    (6, 'Cristi Ion', 25),
    (7, 'Ianis Vasile', 35),
    (8, 'ANDREEA MARIA', 40);
select * from users;

/* Select commands */
select * from users;
select distinct age from users;
select * from users where id = (7);
select username from users where id = 5;
select username from users where id in (5,7,3);
select * from users order by age desc;
select age from users group by age;
select * from products;
select catgegory_id, count(*) from products group by category_id;
select age, count(*) from users group by age;
select category_id, count(*) from products group by category_id having count(*) <5;
select * from users limit 2;

/* AND operator */
select * from products
where category_id = 2 and price < 50;

/* OR operator */
select * from users
where age < 25 or age > 30;

/* NOT operator */
select * from products
where not category_id = 1;

/* All 3 operators */
select * from users
where (age < 25 or age > 30) and not username = 'ANDREEA MARIA';

/* Functii agregate */
select count(*) from users;
select sum(total_amount) from orders;
select * from orders;
select round(avg(age)) from users;
select min(price) from products;
select * from products;
select max(price) from products;
select product_id, product_name, category_id, price from products
where price = (select max(price) from products);

/* Inner JOIN */
select users.username , orders.user_id
from users
inner join orders on users.id = orders.user_id;
select * from orders;
select * from users;

/* Left JOIN */
select users.username, orders.order_id
from users
left join orders on users.id = orders.user_id;

/* Right JOIN */
select users.username, orders.order_id
from users
right join orders on users.id = orders.user_id;

/* Cross JOIN */
select users.username, products.product_name
from users
cross join products;

/* Join cu mai multe tabele */
select u.username, o.order_id, p.product_name, o.order_date, o.total_amount
from users u
join orders o on u.id = o.user_id
join products p on o.user_id = p.category_id;

/* Aliasuri de coloana */
select first_name as 'Prenume', last_name as 'Nume'
from customers;

/* Aliasuri de tabela */
select x.id, x.username, y.order_date
from users x
join orders y on x.id = y.user_id;

/* Aliasuri de functii agregate */
select round(avg(age)) as 'Varsta medie'
from users;

/* Sub-query cu WHERE */
select username, age
from users
where age>(select avg(age) from users);

/* Sub-query cu FROM */
select u.username, o.total_amount
from users u
join (select user_id, sum(total_amount) as total_amount
from orders group by user_id) o on u.id = o.user_id;

/* Sub-query cu SELECT */
select username , (select count(*) from orders where user_id = u.id) as 'Nuamr de comenzi'
from users u;

/* Sub-qury cu IN */
select order_id, user_id, order_date, total_amount
from orders
where user_id in (select id from users where age > 30);

/* LIKE '%' (unul sau mai multe caractere dintr-un cuvant) '_' (un singur caracter) */
select * from users where username like 'I%';
select * from users where username like '%a%';
select * from orders where order_date like '%14%';
select * from customers where email like '%@yahoo%';

/* Between */
select * from users where age between 25 and 35;

/* Union */
select category_name from categories
union
select distinct product_name from products;

/* DATE_SUB() este o functie SQL folosita pt a scadea o anumita perioada de timp dintr-o data */
select * from orders
where order_date <= date_sub(NOW(), interval 1 week);