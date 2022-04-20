CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title CHAR(50),
  color CHAR(50),
  PRIMARY KEY(id)
)

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher CHAR(50),
  cover_state CHAR(10),
  published_date DATE,
  label_id  INT,
  CONSTRAINT fk_book FOREIGN KEY (label_id) REFERENCES labels (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
)