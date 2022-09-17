/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM ANIMALS
WHERE name LIKE '%mon';

SELECT name FROM ANIMALS
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

SELECT name FROM ANIMALS
WHERE neutered = TRUE AND escape_attempts< 3;

SELECT date_of_birth FROM ANIMALS
WHERE name IN ('Agumon','Pikachu');

SELECT escape_attempts, weitght_kg FROM ANIMALS
WHERE weitght_kg> 10.5;

SELECT * FROM ANIMALS
WHERE neutered IS TRUE;

SELECT * FROM ANIMALS
WHERE name !='Gabumon';

SELECT * FROM ANIMALS
WHERE weitght_kg >= 10.4 AND weitght_kg <= 17.3;

-- the first transation 
BEGIN;
vet_clinic=*# UPDATE animals
vet_clinic-*# SET species= 'unspecified';
ROLLBACK;


-- the second transation
BEGIN;
UPDATE animals
SET species='digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species='pokemon'
WHERE species IS NULL;
COMMIT;


-- the third transation
BEGIN;
DELETE FROM animals;
ROLLBACK;


-- the fourth transation
BEGIN;
DELETE FROM animals
WHERE date_of_birth>'2022-01-01';

SAVEPOINT sp1;

UPDATE animals
SET weight_kg=weight_kg*-1;

ROLLBACK TO SAVEPOINT sp1;

UPDATE animals
SET weight_kg=weight_kg*-1
WHERE weight_kg<0;

COMMIT;