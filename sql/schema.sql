CREATE DATABASE catalog_of_things;
/* Create genre table start */
CREATE TABLE genre (
        id INTEGER GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255) NOT NULL, 
       PRIMARY KEY(id) 
    );
/* Create genre table end */

/* Create music_album table start */
CREATE TABLE music_album ( 
        id INTEGER GENERATED ALWAYS AS IDENTITY, 
        published_date DATE, 
        archived BOOLEAN, 
        on_spotify BOOLEAN, 
        genre_id INTEGER,
        CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
    PRIMARY KEY(id) 
);
/* Create music_album table end */

/* Create author table start */
CREATE TABLE author (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);
/* Create author table end */

/* Create game table start */
CREATE TABLE game (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    published_date DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    author_id INTEGER,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);
/* Create game table end */

/* Create label table start */
CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY,
  title CHAR(50),
  color CHAR(50),
  PRIMARY KEY(id)
)
/* Create label table end */

/* Create book table start */
CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher CHAR(50),
  cover_state CHAR(10),
  published_date DATE,
  label_id  INT,
  CONSTRAINT fk_book FOREIGN KEY (label_id) REFERENCES labels (id) ON DELETE CASCADE,
  PRIMARY KEY(id)
)
/* Creat book table end