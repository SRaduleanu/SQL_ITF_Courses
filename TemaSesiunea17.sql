/* Exercises:
 1) number of dishes for each restaurant 
 2) restaurants that didn't sell anything last month 
 3) number of burgers (dish.name = 'burger') sold in 2021 per restaurant 
 4) month with the highest revenue in 2021 
 5) date of the last order per restaurant
*/

create database restaurants_management;

create table restaurant(
id int primary key auto_increment,
name varchar(50),
address varchar(500),
rating real);

create table dish(
id int primary key auto_increment,
restaurant_id int,
name varchar(100),
description varchar(500),
price real,
constraint foreign key(restaurant_id) references restaurant(id)
);

create table orders(
id int primary key auto_increment,
status varchar(10),
created_on timestamp default CURRENT_TIMESTAMP
);

create table order_dish
(
order_id int,
dish_id int,
quantity int,
constraint foreign key(order_id) references orders(id),
constraint foreign key(dish_id) references dish(id)
);

insert into restaurant(name, rating) values ("picasso",5),("paleta de culori",4.3),("acuarella",3.6),("Marty",4.9),("Dapino",3);
insert into dish(restaurant_id, name, price) values (1,"friptura de porc",30),(1,"pui la protap",50),(1,"desert vegan",20),(2,"papanasi cu branza", 25);
insert into orders(status) values ("submitted"),("approved"),("canceled"),("approved"),("approved"),("shipped");
insert into order_dish (order_id, dish_id, quantity) values (1,1,1),(1,2,3),(1,4,2);
insert into order_dish (order_id, dish_id, quantity) values (2,3,2),(3,4,8);

select * from restaurant;
select * from dish;
select * from orders;
select * from order_dish;

insert into order_dish(order_id,dish_id, quantity) values (7,7,5);
insert into order_dish(order_id,dish_id, quantity) values (8,7,16),(9,10,5),(10,8,1),(11,9,50);
insert into orders (status) values ("active"),("done"),("done"),("done");
insert into order_dish(order_id,dish_id, quantity) values (4,9,23);
insert into order_dish(order_id,dish_id, quantity) values (6,5,10);

/* REZOLVARE */

/* 1) number of dishes for each restaurant */
select r.name, restaurant_id, count(*) 
from dish d
inner join restaurant r on d.restaurant_id = r.id
group by restaurant_id;

/* 2) restaurants that didn't sell anything last month */
select r.name, restaurant_id
from restaurant r
inner join dish d on r.id = d.restaurant_id
left join (select od.order_id, dish_id from order_dish od 
inner join orders o on o.id = od.order_id
where month(o.created_on) = month(current_date())-1) od on d.id = od.dish_id
where od.dish_id is null
group by name,restaurant_id, od.dish_id;

/* 3) number of burgers (dish.name = 'burger') sold in 2021 per restaurant */
select r.name , sum(od.quantity) 
from dish d
inner join restaurant r on d.restaurant_id = r.id
inner join order_dish od on d.id = od.dish_id
inner join orders o on od.order_id = o.id
where d.name = 'burger'
and year(created_on) = 2021
group by r.name;

/* 4) month with the highest revenue in 2021 */
select month_of_the_revenue, price
from (select month(created_on) as month_of_the_revenue, sum(price) as price
from dish d
inner join order_dish od on d.id = od.dish_id
inner join orders o
on od.order_id = o.id
where year(created_on) = 2021
group by month_of_the_revenue) rev1
inner join (select max(price) as maxprice from (select month(created_on) as month_of_the_revenue, sum(price) as price
from dish d
inner join order_dish od on d.id = od.dish_id
inner join orders o
on od.order_id = o.id
where year(created_on) = 2021
group by month_of_the_revenue) interm) rev2 on rev1.price = rev2.maxprice;

/* 5) date of the last order per restaurant */
select r.name, max(o.created_on)
from restaurant r
inner join dish d on r.id = d.restaurant_id
inner join order_dish od on d.id = od.dish_id
inner join orders o on o.id = od.order_id
group by r.name;