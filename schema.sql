CREATE DATABASE vet_clinic;
CREATE TABLE animals(
  id INT,
  name TEXT,
  date_of_birth DATE, 
  escape_attemps INT,
  neutered BOOLEAN,    
  weight_kg DEC,
  species_id INT,
  owner_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY(species_id) REFERENCES species(id),
  ADD FOREIGN KEY(owner_id) REFERENCES species(id)
);

ALTER TABLE animals 
    
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
  
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES species(id);

CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 full_name TEXT,
 age INT,
 PRIMARY KEY(id)
);
CREATE TABLE species(
 id GENERATED ALWAYS AS IDENTITY,
 name TEXT,
 PRIMARY KEY(id)
);