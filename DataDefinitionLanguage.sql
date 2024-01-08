create database cinema;
create database humanresources;

/* Optiuni pentru specificarea bazei de date pe care sa o folosim

1. Dublu click pe numele bazei de date
2. Dam click dreapta pe numele bazei de date si apasam pe optiunea "Set as default schema"
3. Sa executam instructiunea use. Ex: use cinema; use petclinic; use humanresources;

Important!!!
Orice instructiune trebuie sa fie terminata cu semnul ";" */

/*

O tabela este formata din urmatoarele elemente:
	- numele tabelei (obligatoriu)
    - cel putin o coloana (obligatoriu)
    - tip de data pentru fiecare coloana definita (obligatoriu)
    - proprietati ale coloanelor (optionale)
    
Tip de tabela - o proprietate a unei coloane care ii specifica sistemului ce fel de informatii sunt permise sa fie adaugate pe coloana respectiva */

/*Scurtaturi MySQL

CTRL + B -  Formateaza codul

/*Crearea unei tabele*/
CREATE TABLE owners (
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL
);

/*Adaugarea unei coloane intr-o tabela*/
alter table owners
add column age int;

/*Stergerea unei coloane din tabela*/
alter table owners
drop age;

/*Modify - poate sa modifice proprietatile unei coloane
Atentie!!!
Daca in momentul in care executam instructiunea nu specificam toate proprietatile pe care le-am specificat la creare, ele vor fi sterse*/
alter table owners modify firstName char(25) not null;

/* Instructiunea de CHANGE ne ajuta sa schimbam numele unei coloane */
alter table owners change lastName ownerLastName char(25) not null;

/* Instructiunea de RENAME ne ajuta sa schimbam numele tabelei */
alter table owners rename to petOwners;

drop table petOwner; -- ATENTIE!!! se va sterge tabela impreuna cu toate informatiile din ea si nu se mai poate recupera