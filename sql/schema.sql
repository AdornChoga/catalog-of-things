/* Create music_album table start */
CREATE TABLE music_album ( 
        id INTEGER GENERATED ALWAYS AS IDENTITY, 
        published_date BOOLEAN, 
        archived BOOLEAN, 
        on_spotify BOOLEAN, 
    PRIMARY KEY(id) 
);
/* Create music_album table end */

/* Create album_genres adjoint table start */
CREATE TABLE album_genres ( 
            id SERIAL PRIMARY KEY, 
            music_album_id INTEGER, 
            genre_id INTEGER, 
        CONSTRAINT unique_music_album_id UNIQUE(music_album_id),
        CONSTRAINT fk_album FOREIGN KEY (music_album_id) REFERENCES music_album(id) ON DELETE CASCADE, 
        CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
    );
/* Create album_genres adjoint table end */

/* Create genre table start */
CREATE TABLE genre (
        id INTEGER GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255) NOT NULL, 
       PRIMARY KEY(id) 
    );
/* Create genre table end */