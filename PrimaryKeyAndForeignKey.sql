alter table owners add column ownerId int primary key auto_increment;
desc owners;
alter table owners modify column ownerId int auto_increment first;
select * from owners;
insert into owners (firstName, lastName, dateOfBirth, age) values ('Anton','Pann','1911-04-17','120');
insert into owners (firstName, lastName, dateOfBirth, age) values ('Anton','Pann','1911-04-17','120');


create table pets(

petId int not null auto_increment,
race varchar(45) not null,
dateOfBirth date not null,
ownerId int not null,
primary key (petId),
constraint fk_pets_owners foreign key (ownerId) references owners(ownerId)
);

select * from owners;
select * from pets;
insert into pets (race, dateOfBirth,ownerId)
values ('european','2020-04-12','5');
delete from pets where ownerId = 5;
delete from owners where ownerId = 5;