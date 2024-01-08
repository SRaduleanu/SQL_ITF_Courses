select * from owners;

alter table owners add column city varchar(50);

update owners set city = 'Cluj' where firstName = 'Tom';

select firstName, lastName from owners;

select * from owners where age = 51;

select * from owners where dateOfBirth > '1970-01-12';

select * from owners where age >= 51;

select * from owners where firstName in ('Jim','Andrew');
select * from owners where firstName not in ('Jim','Andrew');

select * from owners where city is null;

select * from owners where age != 51;

select * from owners where age between 40 and 60;

select * from owners where firstName like 'a%';
select * from owners where firstName like '%m';
select * from owners where firstName like '%n%';

select * from owners where dateOfBirth like '1980%';

select * from owners where firstName like 't%' and dateOfBirth like '19%';

select sum(age) from owners;
select avg(age) from owners;
select min(age) from owners;
select max(age) from owners;
select count(*) from owners;
select count(city) from owners;