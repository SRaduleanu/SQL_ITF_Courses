alter table products add price decimal(10,2);

insert into users (id, username, age) values 
('1','resene','34'),
(2,'Cristi',41),
(3,'Andreea Tomescu',19),
(4,'ION CRISTESCU', 22);
select * from users;

insert into orders (userId, orderDate, totalAmount) values
(1, '2023-04-12 18:30:00', 50.25),
(2, '2023-09-17 17:30:01', 100.44),
(2, '2023-09-17 17:44:00', 53.77),
(3, '2023-10-26 11:31:22', 501.00),
(4, '2023-10-26 19:59:59', 1199.03);
select * from orders;

insert into categories (catName) values
('Electronics'),
('Clothes'),
('Accessories'),
('Groceries');
select * from categories;

insert into products (productName, categId, price) values
('Marvel T-Shirt', 2, 50.25),
('Smart TV', 1, 1199.03),
('Gold Ring', 3, 3209.11),
('Eggs', 4, 12.10);
select * from products;

insert into customers(firstName, lastName, email) values
('Andreea', 'jbbsb', 'andreea@yahoo.com');
select * from customers;

update customers set lastName = 'Ioana'
where customerId = 5;

update customers set email = 'andreea.ioana@yahoo.com'
where customerId = 5;

delete from customers where customerId = 5;

create table products (
productId INT primary key auto_increment,
productName varchar(100),
categId INT,
foreign key (categId) references categories(categId) on delete set null);
delete from products where categId = 5;