/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Agumon', '2020-02-03', 0, true, 10.23),
    ('Gabumon', '2018-11-15', 2, true, 8),
    ('Pikachu', '2021-01-07', 1, false, 15.04),
    ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Charmander', '2020-02-08', 0, false, -11),
    ('Plantmon', '2021-11-15', 2, true, -5.7),
    ('Squirtle', '1993-04-02', 3, false, -12.13),
    ('Angemon', '2005-06-12', 1, true, -45),
    ('Boarmon', '2005-06-07', 7, true, 20.4),
    ('Blossom', '1998-10-13', 3, true, 17),
    ('Ditto', '2022-05-14', 4, true, 22);

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
