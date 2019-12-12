# Scenario 1: Pregled svih projekcija na danasnji dan
INSERT INTO projekcija(film_id, tip_projekcije_id, vrijeme_prikazivanja, akcija_id, sala_id)
VALUES
((SELECT id FROM film WHERE naziv = 'Joker'), (SELECT id FROM tip_projekcije WHERE naziv = '2D'), now(), NULL, (SELECT id FROM sala WHERE naziv = 'Sala 1')),
((SELECT id FROM film WHERE naziv = 'Joker'), (SELECT id FROM tip_projekcije WHERE naziv = '2D'), now(), (SELECT id FROM akcija WHERE naziv = 'Hipotekarna banka'), (SELECT id FROM sala WHERE naziv = 'Sala 3')),
((SELECT id FROM film WHERE naziv = 'Gemini'), (SELECT id FROM tip_projekcije WHERE naziv = '3D'), now(), NULL, (SELECT id FROM sala WHERE naziv = 'Sala 2')),
((SELECT id FROM film WHERE naziv = 'The Sixth Sense'), (SELECT id FROM tip_projekcije WHERE naziv = '2D'), now(), NULL, (SELECT id FROM sala WHERE naziv = 'Sala 3')),
((SELECT id FROM film WHERE naziv = 'The Best Offer'), (SELECT id FROM tip_projekcije WHERE naziv = 'Sinhronizovano'), now(), NULL, (SELECT id FROM sala WHERE naziv = 'Sala 2'));

SELECT * FROM projekcija
WHERE date(vrijeme_prikazivanja) = current_date();

#Scenario 2: Pregled svih projekcija za odredjeni film
SELECT film.naziv, projekcija.vrijeme_prikazivanja FROM projekcija
JOIN film on projekcija.film_id = film.id 
WHERE film.naziv = 'Joker';

SELECT film.naziv, projekcija.vrijeme_prikazivanja FROM projekcija
JOIN film on projekcija.film_id = film.id 
WHERE film.naziv = 'Gemini';

#Scenario 3: Pregled projekcije koje su na akciji(Popust)
SELECT film.naziv, projekcija.vrijeme_prikazivanja, tip_projekcije.naziv 
FROM projekcija
JOIN film on projekcija.film_id = film.id
JOIN tip_projekcije on projekcija.tip_projekcije_id = tip_projekcije.id
WHERE akcija_id IS NOT NULL;

#Scenario 4: Pregled projekcija u 3D na danasnji dan
SELECT film.naziv, projekcija.vrijeme_prikazivanja, tip_projekcije.naziv 
FROM projekcija
JOIN film on projekcija.film_id = film.id
JOIN tip_projekcije on projekcija.tip_projekcije_id = tip_projekcije.id
WHERE tip_projekcije.naziv = '3D' AND DATE(vrijeme_prikazivanja) = current_date();

#Scenario 5: Pregled svih rezervacija za odredjenog korisnika
INSERT INTO `bioskop`.`rezervacija` (`sala_red_mjesto`, `korisnik_id`, `projekcija_id`, `kreirano`) VALUES ('1', '1', '6', '2019-12-11 22:00:00');
INSERT INTO `bioskop`.`rezervacija` (`sala_red_mjesto`, `korisnik_id`, `projekcija_id`, `kreirano`) VALUES ('2', '2', '7', '2019-12-11 22:00:00');

SELECT korisnik.ime, korisnik.prezime, projekcija.vrijeme_prikazivanja , film.naziv, tip_projekcije.naziv
FROM rezervacija
JOIN korisnik on rezervacija.korisnik_id = korisnik.id
JOIN projekcija on rezervacija.projekcija_id = projekcija.id
JOIN film on projekcija.film_id = film.id
JOIN tip_projekcije on projekcija.tip_projekcije_id = tip_projekcije.id
WHERE korisnik.ime = 'Jasmin'; 

#Scenario 6: Pregled ukupnog broja poena na kartici za odredjenog korisnika
INSERT INTO `bioskop`.`korisnik` (`ime`, `prezime`, `email`, `lozinka`, `kartica_id`) VALUES ('Janko', 'Jankovic', 'janko.jankovic101@gmail.com', '26c7c9089e23c14396410bbc6675dbdf', '1');

SELECT korisnik.ime, korisnik.prezime, korisnik.email, kartica.identifikator, tip_kartice.naziv, kartica.poeni
FROM korisnik
JOIN kartica on korisnik.kartica_id = kartica.id
JOIN tip_kartice on kartica.tip_kartice_id = tip_kartice.id
WHERE korisnik.ime = 'Janko';

#Scenario 7: Pregled svih dogadjaja
SELECT * FROM dogadjaji;

#Scenario 8: Pregled svih novosti
SELECT * FROM vijesti;

#Scenario 9:  Kreiranje rezervacije za odredjenu projekciju
INSERT INTO rezervacija (sala_red_mjesto, korisnik_id, projekcija_id, kreirano) 
VALUES (2, 3, 8, now());

#Scenario 10: Registrovanje korisnika bez kartice
INSERT INTO korisnik (ime, prezime, email, lozinka, kartica_id)
VALUES ('Samir', 'Nurkovic', 'samirnurkovic111@gmail.com', md5('samir123'), NULL);

#Scenario 11: Registorvanje korisnika sa karticom
INSERT INTO tip_kartice (naziv)
VALUES ('Tip kartice Test');

INSERT INTO kartica(tip_kartice_id, identifikator, poeni)
VALUES ((SELECT id from tip_kartice where naziv ='Tip kartice Test'), 'ccddd2234', 5);

INSERT INTO korisnik(ime, prezime, email, lozinka, kartica_id)
VALUES ('Alen', 'Cindrak', 'alenc121@gmail.com', md5('cindrak444'), (SELECT id FROM kartica WHERE identifikator = 'ccddd2234' LIMIT 1));


