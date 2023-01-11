CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE source (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL
);

CREATE TABLE book (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (source_id) REFERENCES source (id),
  FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE TABLE music_album (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publisher_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (source_id) REFERENCES source (id),
  FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE TABLE movie (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publisher_date DATE,
  archived BOOLEAN,
  silent BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (source_id) REFERENCES source (id),
  FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publisher_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (source_id) REFERENCES source (id),
  FOREIGN KEY (label_id) REFERENCES label (id)
);
