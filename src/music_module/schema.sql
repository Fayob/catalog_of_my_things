CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE musicalbum (
	id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  artist VARCHAR(50),
  publish_date DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
  genre_id INT REFERENCES genre(id)
);