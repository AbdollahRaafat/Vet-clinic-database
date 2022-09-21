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


SELECT * FROM species;





--Write queries (using JOIN) to answer the following questions
--What animals belong to Melody Pond?
SELECT owners.full_name,  animals.name
FROM owners
JOIN animals ON owners.id=animals.owner_id
WHERE owners.full_name='Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT species.name AS species_name, animals.name, animals.date_of_birth
FROM species
JOIN animals ON species.id = animals.species_id
WHERE species.id =1;

--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON animalS.owner_id =owners.id;

--How many animals are there per species?
SELECT species.name AS species_name, COUNT(animals.name)
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species_name;


--List all Digimon owned by Jennifer Orwell.
SELECT species.name AS species_name, animals.name, owners.full_name
FROM animals
JOIN species ON species.id=animals.species_id
JOIN owners ON animals.owner_id=owners.id
WHERE animals.owner_id=2 AND animals.species_id=2;

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name, owners.full_name, escape_attempts
FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE animals.owner_id=5 AND escape_attempts=0;

--Who owns the most animals?
SELECT full_name, COUNT(owner_id)
FROM owners
JOIN animals ON owner_id=owners.id
GROUP BY full_name
ORDER BY COUNT(owner_id) DESC LIMIT 1;




--Writing queries to answer the following:
-- Who was the last animal seen by William Tatcher?
SELECT vets.name vet,animals.name animal,visits.date FROM ANIMALS
JOIN visits ON visits.animals_id=animals.id
JOIN vets ON vets.id=visits.vets_id
WHERE vets.name='William Tatcher'
ORDER BY visits.date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) from animals
JOIN VISITS ON ANIMALS_ID=ANIMALS.ID
JOIN VETS ON VETS.ID = VISITS.VETS_ID
WHERE VETS.NAME ='Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name vet_name, species.name species_name from vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, VISITS.DATE from animals
JOIN VISITS ON ANIMALS_ID=ANIMALS.ID
JOIN VETS ON VETS.ID = VISITS.VETS_ID
WHERE VETS.NAME ='Stephanie Mendez'
AND VISITS.DATE BETWEEN '2020-04-01' AND '2020-08-01';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(VISITS.ANIMALS_ID) from animals
JOIN VISITS ON ANIMALS_ID=ANIMALS.ID
GROUP BY ANIMALS.NAME
ORDER BY COUNT(VISITS.ANIMALS_ID) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, VISITS.DATE from animals
JOIN VISITS ON ANIMALS_ID=ANIMALS.ID
JOIN VETS ON VETS.ID = VISITS.VETS_ID
WHERE VETS.NAME ='Maisy Smith'
ORDER BY  VISITS.DATE LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT vets.name vet_name, animals.name Animal_name, VISITS.DATE visit_date from animals
JOIN VISITS ON ANIMALS_ID=ANIMALS.ID
JOIN VETS ON VETS.ID = VISITS.VETS_ID
ORDER BY  VISITS.DATE DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT animals.name, VISITS.DATE from animals
JOIN VISITS ON ANIMALS_ID=ANIMALS.ID
JOIN VETS ON VETS.ID = VISITS.VETS_ID
WHERE VETS.NAME ='Maisy Smith'
ORDER BY  VISITS.DATE LIMIT 1;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

specializations