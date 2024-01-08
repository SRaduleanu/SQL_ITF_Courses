rename  table petOwners to owners;
alter table owners change ownerLastName lastName varchar(25);
alter table owners add column dateOfBirth date;

/* Instructiuni de insert */
insert into owners (firstName, lastName, dateOfBirth, age)
values('Jim','Jameson','1980-01-31','51');

-- Instructiune de insert cu mai multe randuri inserate concomitent
insert into owners (firstName, lastName, dateOfBirth, age)
values('Andrew','Smith','1957-01-31','74'),('Tom','Thompson','1966-04-12','65');

-- Instructiune de insert fara specificarea coloanelor
insert into owners values ('Tom','Anderson','1980-01-30','51');
insert into owners values ('Tom','Anderson'); -- Va returna eroare : Error Code: 1136. Column count doesn't match value count at row 1	

-- Verificam rezultatele instructiunii de insert
select  * from owners;

-- ---------------

update owners set firstName = 'James';

-- ---------------
-- Stergerea tuturor inregistrarilor din tabela

delete from owners;

-- ----------------
-- Stergerea tuturor inregistrarilor din tabela cu truncate

truncate table owners;

-- Diferenta dintre DELETE si TRUNCATE:
/*DELETE are capacitatea de a numara inregistrarile pe care le sterge.
Cu DELETE putem sa filtram si sa stergem doar anumite inregistrari*/

