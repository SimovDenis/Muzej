# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < D:\GitHub\Muzej\Muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;

create table muzej(
	sifra int not null primary key auto_increment,
	naziv varchar(100),
	adresa varchar(100),
	kontakt varchar(50)
);

create table izlozba(
	sifra int not null primary key auto_increment,
	muzej int not null,
	tip_izlozbe varchar(50),
	trajanje int
);

create table djelo(
	sifra int not null primary key auto_increment,
	naziv varchar(150),
	izlozba int,
	velicina varchar(50),
	cijena int
);

create table kustos(
	sifra int not null primary key auto_increment,
	izlozba int,
	ime varchar(50),
	prezime varchar(50),
	broj_ugovora varchar(50)
);

create table sponzor(
	sifra int not null primary key auto_increment,
	izlozba int,
	naziv varchar(50),
	pocetak_ugovora date,
	kraj_ugovora date
);

alter table izlozba add foreign key (muzej) references muzej(sifra);
alter table djelo add foreign key (izlozba) references izlozba(sifra);
alter table kustos add foreign key (izlozba) references izlozba(sifra);
alter table sponzor add foreign key (izlozba) references izlozba(sifra);

insert into muzej(sifra, naziv, adresa, kontakt) values
(null, 'Muzej Mamurluka', null, null),
(null, 'Muzej Iluzija', null, null),
(null, 'Muzej prekinutih veza', null, null);

insert into izlozba (sifra, muzej, tip_izlozbe, trajanje) values
(null, 1, 'Mamurluci od piva', 30),
(null, 2, 'Poznati mađioničari', 60),
(null, 3, 'Hrvatske cokolade', 30);

insert into djelo(sifra, naziv, izlozba, velicina, cijena) values
(null, '18. rodendan', 1, 'Osječko pivo', 50),
(null, 'David Blaine - 7 dana pod vodom', 2, '60x60', 100),
(null, 'Dorina - mliječna', 3, '80g', 1);

insert into kustos(sifra, izlozba, ime, prezime, broj_ugovora) values
(null, 1, 'Petar', 'Perić', '343-2000'),
(null, 2, 'Andrija', 'Gospodinović', '879-2023'),
(null, 3, 'Elena', 'Starčević', '435-2000');

insert into sponzor (sifra, izlozba, naziv, pocetak_ugovora, kraj_ugovora) values
(null, 1, 'Pivovara Osijek', '2023-01-01', '2023-01-30'),
(null, 2, 'Grad Zagreb', null, '2023-01-30'),
(null, 3, 'Kraš', '2023-05-01', '2023-06-29');
