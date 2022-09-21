/* Populate database with sample data. */

INSERT INTO ANIMALS VALUES
(1,'Agumon', '2020-02-3', 0, TRUE, 10.23),
(2,'Gabumon', '2018-11-15', 2, TRUE, 8),
(3,'Pikachu', '2021-01-7', 1, FALSE, 15.04),
(4,'Divimon', '2017-05-12', 5, TRUE, 11);


INSERT INTO animals
VALUES (5,'Charmander','2020-02-8',0,FALSE,11.00),
(6,'Plantmon','2021-11-15',2,TRUE,5.7),
(7,'Squirtle','1993-04-2',3,FALSE,12.13),
(8,'Angemon','2005-06-12',1,TRUE,45),
(9,'Boarmon','2005-06-07',7,TRUE,20.4),
(10,'Blossom','1998-10-13',3,TRUE,17),
(11,'Ditto','2022-05-14',4,TRUE,22);


--Insert the owners data into the owners table
INSERT INTO owners (full_name, age)
 VALUES ('Sam Smith',34),
 ('Jennifer Orwell', 19),
 ('Bob',45),
 ('Melody Pond',77),
 ('Dean Winchester',14),
 ('Jodie Whittaker',38);


--Insert the species data into the species table
INSERT INTO species (name)
 VALUES ('Pokemon'),
 ('Digimon');



--Modify the inserted animals so it includes the species_id value:
--If the name ends in "mon" it will be Digimon
 UPDATE animals
 SET species_id=2
 WHERE name LIKE '%mon';

--All other animals are Pokemon
 UPDATE animals
 SET species_id=2
 WHERE name NOT LIKE '%mon';


--Modify the inserted animals to include owner information (owner_id)
--Sam Smith owns Agumon.
 UPDATE animals
 SET owner_id=1
 WHERE name='Agumon';

 --Jennifer Orwell owns Gabumon and Pikachu.
 UPDATE animals
 SET owner_id=2
 WHERE name IN ('Gabumon','Pikachu');

 --Bob owns Devimon and Plantmon.
 UPDATE animals
 SET owner_id=3
 WHERE name IN ('Devimon','Plantmon');

 --Melody Pond owns Charmander, Squirtle, and Blossom.
 UPDATE animals
 SET owner_id=4
 WHERE name IN ('Charmander','Squirtle','Blossom');

--Dean Winchester owns Angemon and Boarmon.
 UPDATE animals
 SET owner_id=5
 WHERE name IN ('Angemon','Boarmon');




--Insert the following data for vets
INSERT INTO vets
(name,age,date_of_graduation)
VALUES ('William Tatcher',45,'2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');

--Insert the following data for specialties
INSERT INTO specializations
VALUES (1,1),
(1,3),(2,3),
(2,4);


--Insert the following data for visits
INSERT INTO visits 
VALUES(1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-02-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,2,'2019-12-21'),
(6,1,'2020-08-10'),
(6,2,'2021-04-07'),
(7,3,'2019-09-29'),
(8,4,'2020-10-03'),
(8,4,'2020-11-04'),
(9,2,'2019-01-24'),
(9,2,'2019-05-15'),
(9,2,'2020-02-27'),
(9,2,'2020-08-03'),
(10,3,'2020-05-24'),
(10,1,'2021-01-11');


