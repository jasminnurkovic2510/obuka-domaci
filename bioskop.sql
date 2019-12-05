# dodavanje kategorije
INSERT INTO kategorija(naziv) 
VALUES ('Filmovi'), ('Događaji'), ('Novosti');

# dodavanje zanrova
INSERT INTO zanr(naziv) 
VALUES ('Akcija'), ('Triler'), ('Drama'), ('Komedija'), ('Mjuzikl'), ('Horor');

# dodavanje dogadjaja
INSERT INTO dogadjaji(naziv, kategorija_id, opis)
VALUES
('Dogadjaj 1', (SELECT id FROM kategorija WHERE naziv = 'Događaji'), 'Dogadjaj 1 opis'),
('Dogadjaj 2', (SELECT id FROM kategorija WHERE naziv = 'Događaji'), 'Dogadjaj 2 opis'),
('Dogadjaj 3', (SELECT id FROM kategorija WHERE naziv = 'Događaji'), 'Dogadjaj 3 opis'),
('Dogadjaj 4', (SELECT id FROM kategorija WHERE naziv = 'Događaji'), 'Dogadjaj 4 opis'),
('Dogadjaj 5', (SELECT id FROM kategorija WHERE naziv = 'Događaji'), 'Dogadjaj 5 opis');


# dodavanje filmova
INSERT INTO film(naziv, trajanje, pocetak_prikazivanja, kategorija_id)
VALUES
('Joker', 2, '2019-09-01', (SELECT id FROM kategorija WHERE naziv = 'Filmovi')),
('Gemini', 1.5, '2019-12-01', (SELECT id FROM kategorija WHERE naziv = 'Filmovi')),
('The Greatest Showman', 2.5, '2019-08-12', (SELECT id FROM kategorija WHERE naziv = 'Filmovi')),
('The Best Offer', 1.45, '2017-04-07', (SELECT id FROM kategorija WHERE naziv = 'Filmovi')),
('The Sixth Sense', 1.50, '2015-07-12', (SELECT id FROM kategorija WHERE naziv = 'Filmovi'));


# dodavanje novosti
INSERT INTO vijesti(kategorija_id, naslov, opis, vrijeme_objave)
VALUES
((SELECT id FROM kategorija WHERE naziv = 'Novosti'), 'Vijest 1', 'Opis - vijest 1', '2019-10-04 10:00:00'),
((SELECT id FROM kategorija WHERE naziv = 'Novosti'), 'Vijest 2', 'Opis - vijest 2', '2019-11-17 22:00:00'),
((SELECT id FROM kategorija WHERE naziv = 'Novosti'), 'Vijest 3', 'Opis - vijest 3', '2019-12-22 14:01:10'),
((SELECT id FROM kategorija WHERE naziv = 'Novosti'), 'Vijest 4', 'Opis - vijest 4', '2019-07-15 12:00:00');


# dodavanje film_zanr
INSERT INTO film_zanr(film_id, zanr_id)
VALUES
((SELECT id FROM film WHERE naziv = 'Joker'), (SELECT id FROM zanr WHERE naziv = 'Triler')),
((SELECT id FROM film WHERE naziv = 'Joker'), (SELECT id FROM zanr WHERE naziv = 'Drama')),
((SELECT id FROM film WHERE naziv = 'Gemini'), (SELECT id FROM zanr WHERE naziv = 'Akcija')),
((SELECT id FROM film WHERE naziv = 'The Greatest Showman'), (SELECT id FROM zanr WHERE naziv = 'Mjuzikl')),
((SELECT id FROM film WHERE naziv = 'The Best Offer'), (SELECT id FROM zanr WHERE naziv = 'Triler')),
((SELECT id FROM film WHERE naziv = 'The Best Offer'), (SELECT id FROM zanr WHERE naziv = 'Drama')),
((SELECT id FROM film WHERE naziv = 'The Sixth Sense'), (SELECT id FROM zanr WHERE naziv = 'Triler')),
((SELECT id FROM film WHERE naziv = 'The Sixth Sense'), (SELECT id FROM zanr WHERE naziv = 'Horor'));


# dodavanje tipa projekcije
INSERT INTO tip_projekcije(naziv)
VALUES ('2D'), ('3D'), ('Sinhronizovano');


# dodavanje akcije
INSERT INTO akcija(naziv, popust)
VALUES ('Novogodisnji popust', 10), ('Hipotekarna banka', 5);


# dodavanje tipa kartice
INSERT INTO tip_kartice(naziv)
VALUES ('Cineplexx Bonus'), ('Gift');


# dodavanje kartice
INSERT INTO kartica(tip_kartice_id, identifikator, poeni)
VALUES
((SELECT id FROM tip_kartice WHERE naziv = 'Cineplexx Bonus'), 'CP-BB-01', 10),
((SELECT id FROM tip_kartice WHERE naziv = 'Cineplexx Bonus'), 'CP-BB-02', 20),
((SELECT id FROM tip_kartice WHERE naziv = 'Gift'), 'GF-BB-01', 5);


# dodavanje korisnika
INSERT INTO korisnik(ime, prezime, email, lozinka, kartica_id)
VALUES
('Jasmin', 'Nurkovic', 'jnurkovic@gmail.com', md5('jasmin123'), NULL),
('Aleksa', 'Sukovic', 'sukovic.aleksa@gmail.com', md5('aleksa123'), (SELECT id FROM kartica WHERE identifikator = 'AA-BB-01')),
('Marko', 'Markovic', 'marko.markovic@gmail.com', md5('marko123'), (SELECT id FROM kartica WHERE identifikator = 'AA-BB-02'));


# dodavanje film_rejting
INSERT INTO film_rejting(film_id, rejting, korisnik_id)
VALUES
((SELECT id FROM film WHERE naziv = 'Joker'), 4, (SELECT id FROM korisnik WHERE email = 'jnurkovic@gmail.com')),
((SELECT id FROM film WHERE naziv = 'Joker'), 4, (SELECT id FROM korisnik WHERE email = 'sukovic.aleksa@gmail.com')),
((SELECT id FROM film WHERE naziv = 'Gemini'), 2, (SELECT id FROM korisnik WHERE email = 'sukovic.aleksa@gmail.com')),
((SELECT id FROM film WHERE naziv = 'Gemini'), 3, (SELECT id FROM korisnik WHERE email = 'marko.markovic@gmail.com'));


# dodavanje sala
INSERT INTO sala(naziv, aktivna, ukupan_broj_mjesta)
VALUES
('Sala 1', b'1', 56),
('Sala 2', b'1', 100),
('Sala 3', b'1', 86),
('Sala 4', b'0', 140);


# dodavanje reda u sali
INSERT INTO sala_red(sala_id, red)
VALUES 
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'A'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'B'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'C'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'D'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'E'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'F'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'G'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'H'),
((SELECT id FROM sala WHERE naziv = 'Sala 1'), 'I'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'A'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'B'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'C'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'D'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'E'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'F'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'G'),
((SELECT id FROM sala WHERE naziv = 'Sala 2'), 'H'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'A'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'B'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'C'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'D'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'E'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'F'),
((SELECT id FROM sala WHERE naziv = 'Sala 3'), 'G'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'A'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'B'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'C'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'D'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'E'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'F'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'G'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'H'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'I'),
((SELECT id FROM sala WHERE naziv = 'Sala 4'), 'J');


# dodavanje mjesta u sali
INSERT INTO sala_red_mjesto(sala_red_id, mjesto)
VALUES
((SELECT id FROM sala_red WHERE id = 1), 1),
((SELECT id FROM sala_red WHERE id = 1), 2),
((SELECT id FROM sala_red WHERE id = 1), 3),
((SELECT id FROM sala_red WHERE id = 1), 4),
((SELECT id FROM sala_red WHERE id = 1), 5),
((SELECT id FROM sala_red WHERE id = 1), 6),
((SELECT id FROM sala_red WHERE id = 1), 7),
((SELECT id FROM sala_red WHERE id = 1), 1),
((SELECT id FROM sala_red WHERE id = 1), 2),
((SELECT id FROM sala_red WHERE id = 1), 3),
((SELECT id FROM sala_red WHERE id = 2), 4),
((SELECT id FROM sala_red WHERE id = 2), 5),
((SELECT id FROM sala_red WHERE id = 2), 6),
((SELECT id FROM sala_red WHERE id = 2), 7),
((SELECT id FROM sala_red WHERE id = 2), 8);


# dodavanje projekcije
INSERT INTO projekcija(film_id, tip_projekcije_id, vrijeme_prikazivanja, akcija_id, sala_id)
VALUES
((SELECT id FROM film WHERE naziv = 'Joker'), (SELECT id FROM tip_projekcije WHERE naziv = '2D'), '2019-12-05 10:00:00', NULL, (SELECT id FROM sala WHERE naziv = 'Sala 1')),
((SELECT id FROM film WHERE naziv = 'Joker'), (SELECT id FROM tip_projekcije WHERE naziv = '2D'), '2019-12-05 21:00:00', (SELECT id FROM akcija WHERE naziv = 'Hipotekarna banka'), (SELECT id FROM sala WHERE naziv = 'Sala 3')),
((SELECT id FROM film WHERE naziv = 'Gemini'), (SELECT id FROM tip_projekcije WHERE naziv = '3D'), '2019-12-05 20:00:00', NULL, (SELECT id FROM sala WHERE naziv = 'Sala 2')),
((SELECT id FROM film WHERE naziv = 'The Sixth Sense'), (SELECT id FROM tip_projekcije WHERE naziv = '2D'), '2019-12-06 19:00:00', NULL, (SELECT id FROM sala WHERE naziv = 'Sala 3')),
((SELECT id FROM film WHERE naziv = 'The Best Offer'), (SELECT id FROM tip_projekcije WHERE naziv = 'Sinhronizovano'), '2019-12-07 13:00:00', NULL, (SELECT id FROM sala WHERE naziv = 'Sala 2'));


# dodavanje rezervacije
INSERT INTO rezervacija(sala_red_mjesto, korisnik_id, projekcija_id, kreirano)
VALUES
((SELECT id FROM sala_red_mjesto WHERE id = 1), (SELECT id FROM korisnik WHERE email = 'jnurkovic@gmail.com'), (SELECT id FROM projekcija WHERE id = 1), NOW()),
((SELECT id FROM sala_red_mjesto WHERE id = 2), (SELECT id FROM korisnik WHERE email = 'marko.markovic@gmail.com'), (SELECT id FROM projekcija WHERE id = 1), NOW());