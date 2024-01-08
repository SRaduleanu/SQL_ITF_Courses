select * from users;
insert into users (id, username) values (5, 'Irina'), (6, 'Serban');
insert into products (productName, categId) values ('Frigider', 1);
insert into products (categId, price) values (2, 99.54);
select * from products;
select * from orders;
insert into orders (userId, orderDate, totalAmount) values (6, '2022-07-12 16:43:01', 3749.33),
(6, '2022-07-17 10:23:01', 7419.30), (6, '2023-03-22 06:23:01', 1149.64);
select * from customers;
insert into customers (firstName, lastName, email) values
('Irina','Ion','irina.dumitru@yahoo.com');
insert into customers (firstName, email) values
('Marcu','arculluimarcu@yahoo.com');
alter table customers modify column lastName varchar(24);

-- COALESCE

select u.username,
coalesce(month(o.orderDate),0) as luna,
coalesce(sum(o.totalAmount),0) as totalAmount
from users u 
left join orders o on u.id = o.userId and year(o.orderDate) = 2023
group by u.username, coalesce(month(o.orderDate),0);

select p.productName, ctg.catName
from products p 
	join categories ctg on p.categId = ctg.catId
    where ctg.catName in ('Electronics', 'Groceries');
    
select username from users
where age < 35 limit 2;

select * from users
	order by age asc;
    
select * from customers;

select email, count(*) as adreseEmail from customers
	group by email having count(*) > 0;