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



-- How many animals are there?
SELECT COUNT(*) FROM animals;


--How many animals have never tried to escape?
SELECT escape_attempts, COUNT(*)
FROM animals
GROUP BY escape_attempts
HAVING escape_attempts=0;

--What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;

--Who escapes the most, neutered or not neutered animals?
SELECT neutered,SUM(escape_attempts)
FROM animals
GROUP BY neutered;


--What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg),MAX(weight_kg)
FROM animals
GROUP BY species;


--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species ,AVG(escape_attempts)
FROM animals
WHERE date_of_birth >='1990-01-01' AND date_of_birth <='2000-01-01'
GROUP BY species;