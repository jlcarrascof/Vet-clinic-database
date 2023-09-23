/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD COLUMN species varchar(255);

CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name varchar(255),
    age integer
);

CREATE TABLE species (
    id serial PRIMARY KEY,
    name varchar(255)
);

-- id needs to be PRIMARY KEY and autoincr
ALTER TABLE animals DROP CONSTRAINT animals_pkey;
ALTER TABLE animals ADD PRIMARY KEY (id);

-- Drop species column
ALTER TABLE animals DROP COLUMN species;

-- Add species_id as foreign key
ALTER TABLE animals ADD COLUMN species_id integer REFERENCES species(id);

-- Add owner_id as foreign key
ALTER TABLE animals ADD COLUMN owner_id integer REFERENCES owners(id);
