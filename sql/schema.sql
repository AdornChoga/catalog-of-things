
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
        published_date BOOLEAN, 
        archived BOOLEAN, 
        on_spotify BOOLEAN, 
        genre_id INTEGER,
        CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
    PRIMARY KEY(id) 
);
/* Create music_album table end */