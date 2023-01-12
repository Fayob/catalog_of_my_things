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
  archived BOOLEAN,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE TABLE book_label (
  book_id INT NOT NULL,
  label_id INT NOT NULL,
  PRIMARY KEY (book_id, label_id),
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (book_id) REFERENCES book (id)
);

CREATE TABLE Authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL
);

CREATE TABLE Game (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  source_id INT,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (genre_id ) REFERENCES Genre(id),
  FOREIGN KEY (author_id) REFERENCES Authors(id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);
