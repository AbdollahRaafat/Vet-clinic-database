/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
id INT PRIMARY KEY,
name VARCHAR,
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weitght_kg DECIMAL);

ALTER TABLE animals
ADD species TEXT ;
