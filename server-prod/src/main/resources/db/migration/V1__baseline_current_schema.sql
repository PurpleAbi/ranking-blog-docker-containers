
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

-- Dumping data for table movies
INSERT INTO movies (id, title, abis_review, abis_rating, sequel, year_abi_reviewed, poster_url) VALUES 
(1, 'Everything, Everywhere, all at once', 'This movie is kind of A Lot. It''s entertaining and crazy but it can get to a point where you just say wtf. Some jokes are not necessary and it feels super long. But it has some nice quotes and life lessons I guess. 5/10', 2, NULL, 2024, 'https://m.media-amazon.com/images/M/MV5BOWNmMzAzZmQtNDQ1NC00Nzk5LTkyMmUtNGI2N2NkOWM4MzEyXkEyXkFqcGc@._V1_SX300.jpg'),
(2, 'Don''t move', 'Nerve racking. I don''t enjoy these kinds of movies for a good reason. It''s predictable in general, but it has some peculiarities that you don''t expect. I remember almost all of it, so at least it''s memorable. 6/10', 3, NULL, 2024, 'https://m.media-amazon.com/images/M/MV5BZmFlMTMyMzQtNmI4NC00YTcyLTgwOGUtMzc4YjcyNDUyOGY3XkEyXkFqcGc@._V1_SX300.jpg'),
(3, 'Wicked', 'Despite all the Ariana Grande drama, the movie was quite enjoyable. Although, I did watch it in a 3 day lapse. I''m looking forward to the sequel. I started reading the Wizard of Oz because of it. Nothing extra, but entertaining. 7/10', 3, 'Part 1', 2024, 'https://m.media-amazon.com/images/M/MV5BOWMwYjYzYmMtMWQ2Ni00NWUwLTg2MzAtYzkzMDBiZDIwOTMwXkEyXkFqcGc@._V1_SX300.jpg'),
(4, 'The Boy and the Heron', 'Being a Ghibli film I knew what to expect. It did not disappoint. I think it left me a similar impression as the first time I watched Chihiro. 8/10', 4, NULL, 2025, 'https://m.media-amazon.com/images/M/MV5BMzA5Zjg3MTAtM2FhZS00NTNjLTg3NjEtNWQ4MTRhZjhiNzVmXkEyXkFqcGc@._V1_SX300.jpg'),
(5, 'Bridget Jones', 'I watched it because of the reminiscence I feel from watching these film series with my mom. It was funny but, I think it''s the worst from all the series. I have to give it a plain 6. Maybe if I rewatch the other films my opinion would differ. ', 2, 'Part 4: Mad About the boy', 2025, 'https://m.media-amazon.com/images/M/MV5BOTU1MTM1ZTUtMzcxNy00OTRiLTllNzItN2U3MGQ4YTQzYWE4XkEyXkFqcGc@._V1_SX300.jpg'),
(6, 'Lost in Starlight', 'The art is nice. The story is cute. It''s ok. 7/10', 3, NULL, 2025, 'https://m.media-amazon.com/images/M/MV5BNGY3OWYxMzAtNzllNC00MGU0LThhNDUtMjU1MjNhMWIxYjg1XkEyXkFqcGc@._V1_SX300.jpg'),
(7, 'Barbie', 'I mean it''s not bad but for all the attention it got I would expect more. It''s cute and entertaining but come on, 435 nominations? 7/10', 2, NULL, 2023, 'https://m.media-amazon.com/images/M/MV5BYjI3NDU0ZGYtYjA2YS00Y2RlLTgwZDAtYTE2YTM5ZjE1M2JlXkEyXkFqcGc@._V1_SX300.jpg'),
(8, 'Wonka', 'I liked it. And even my husband who doesn''t like musicals liked it.', 4, NULL, 2023, 'https://m.media-amazon.com/images/M/MV5BM2Y1N2ZhNjctYjVhZC00MDg2LWFhNTItMzI3ZjAwZDhjYmFiXkEyXkFqcGc@._V1_SX300.jpg'),
(9, 'Elemental', 'The animation is very nice. The story is cute. Since it''s a kid''s movie I have to say: 3 year olds would probably be ok watching it. But I think to fully understand the story and appreciate the movie the kid should be maybe 5.', 3, NULL, 2023, 'https://m.media-amazon.com/images/M/MV5BNjU2MjE1OGItZjdmYS00ZmIyLTljNjYtOWI5ZGRkZjM4NDEwXkEyXkFqcGc@._V1_SX300.jpg');

-- Adjust the sequence for movies so auto-increment works for new entries
SELECT setval('movies_id_seq', (SELECT MAX(id) FROM movies));

-- Dumping data for table series
INSERT INTO series (id, title, abis_review, abis_rating, ongoing, year_abi_reviewed, poster_url) VALUES 
(1, 'House of the Dragon', 'Intense, entertaining. Prequel to the Games of Thrones Series. I would give it a 7/10', 3, TRUE, 2024, 'https://m.media-amazon.com/images/M/MV5BM2QzMGVkNjUtN2Y4Yi00ODMwLTg3YzktYzUxYjJlNjFjNDY1XkEyXkFqcGc@._V1_SX300.jpg'),
(2, 'Our Blues', 'It''s a korean drama and that''s what it is: A Drama. It has good character development for the kdrama standards and you can see some of the stereotypes and prejudices the society still has. I would give it a 6/10 which is high for its category.', 2, FALSE, 2024, 'https://m.media-amazon.com/images/M/MV5BMDUwY2ZkMGYtMTJlMi00MTg0LWJiNGItYzI5YmE3Y2UxYzBiXkEyXkFqcGc@._V1_SX300.jpg'),
(3, 'The Last of Us', 'I didn''t play the videogame but I watched gameplays on youtube several years ago. I was a fan and still am. I was a bit disappointed with the last season''s finale, but that''s a very subjective opinion. 8/10', 4, TRUE, 2024, 'https://m.media-amazon.com/images/M/MV5BYWI3ODJlMzktY2U5NC00ZjdlLWE1MGItNWQxZDk3NWNjN2RhXkEyXkFqcGc@._V1_SX300.jpg'),
(4, 'A good girl''s guide to murder', 'I really didn''t expect much from this show but I was pleasantly surprised. I think I binged watched it in a few days. 7/10', 4, FALSE, 2025, 'https://m.media-amazon.com/images/M/MV5BYmVlYzBjODktZDNlZC00ZmFiLTg5YmItMTc0NmYxZDgzNDg5XkEyXkFqcGc@._V1_SX300.jpg'),
(5, 'Belascoaran PI', 'Recommended by my brother. Worth the watch. Dark mexican humor. I think latin americans can appreciate this show more than others. The bad reviews I saw online where from English speakers. 9/10', 4, TRUE, 2025, 'https://m.media-amazon.com/images/M/MV5BMjFlZGI5MzktNWY0OC00YWE1LTg3NWUtYmNmZDE5N2FhYTM0XkEyXkFqcGc@._V1_SX300.jpg'),
(6, '1899', 'Well well well... What could I say about this show? It started very intriguing, mysterious, scary even. My husband and I never knew what was going to happen or what was actually happening, lol. We still expected a second season, sad it didn''t get renewed. 6/10', 3, FALSE, 2025, 'https://m.media-amazon.com/images/M/MV5BY2UyM2YwZTEtOTk5Zi00ODhkLTg2ZjctMzIxMTViZjFmN2Y4XkEyXkFqcGc@._V1_SX300.jpg'),
(7, 'The Walking Dead: Daryl Dixon', 'I''ve been a fan of the whole TWD universe since it aired in 2012. So, of course I''m going to watch all the sequel series. This season in France is a bit slow. I struggled to keep my watching enthusiasm. I think I didn''t connect so much with the new characters tbh. 7/10', 3, TRUE, 2023, 'https://m.media-amazon.com/images/M/MV5BZjFlYzg4M2ItZjlmZC00MTA2LWJlZTgtODdlZmZjNWRkMzI5XkEyXkFqcGc@._V1_SX300.jpg'),
(8, 'Queen Charlotte: A Bridgerton story', 'Watched all the Bridgerton series before. They are entertaining. Queen Charlotte''s character seemed a bit confusing for me all the time. This show gave her some clarity and that''s why I enjoyed it more. 7/10', 3, FALSE, 2023, 'https://m.media-amazon.com/images/M/MV5BODBmZTk0NjEtNTYwZS00NzA5LWEzYjctYmI1NDUwMjdhOGJlXkEyXkFqcGc@._V1_SX300.jpg'),
(9, 'Black Knight', 'It''s a bit over the top. But it''s entertaining and keeps you wanting to watch the whole thing in one sitting.', 3, FALSE, 2023, 'https://m.media-amazon.com/images/M/MV5BYjRhMDYyZjItYWJkZC00ZWI0LWE5NzMtYmM4MDQ0MTE3MDZlXkEyXkFqcGc@._V1_SX300.jpg');

-- Adjust the sequence for series
SELECT setval('series_id_seq', (SELECT MAX(id) FROM series));
