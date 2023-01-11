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
  FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE TABLE book_label (
  book_id INT NOT NULL,
  label_id INT NOT NULL,
  PRIMARY KEY (book_id, label_id),
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (book_id) REFERENCES book (id)
)
