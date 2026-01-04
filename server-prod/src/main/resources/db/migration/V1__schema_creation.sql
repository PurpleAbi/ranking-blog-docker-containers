
-- PostgreSQL compatible schema for Movieranking

DROP TABLE IF EXISTS movies CASCADE;
CREATE TABLE movies (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    abis_review TEXT NOT NULL,
    abis_rating SMALLINT NOT NULL CHECK (abis_rating BETWEEN 0 AND 5),
    sequel VARCHAR(100) DEFAULT NULL,
    year_abi_reviewed INT NOT NULL,
    poster_url VARCHAR(2048) DEFAULT NULL
);

DROP TABLE IF EXISTS series CASCADE;
CREATE TABLE series (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    abis_review TEXT NOT NULL,
    abis_rating SMALLINT NOT NULL CHECK (abis_rating BETWEEN 0 AND 5),
    ongoing BOOLEAN NOT NULL,
    year_abi_reviewed INT NOT NULL,
    poster_url VARCHAR(2048) DEFAULT NULL
);

