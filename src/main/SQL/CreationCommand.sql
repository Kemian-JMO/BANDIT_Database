PRAGMA foreign_keys = ON;

CREATE TABLE lærer
(
    lærer_id INTEGER PRIMARY KEY,
    navn      TEXT NOT NULL,
    email     TEXT NOT NULL,
    fag       TEXT NOT NULL
);

CREATE TABLE klasse
(
    klasse_id        INTEGER PRIMARY KEY,
    navn             TEXT NOT NULL,
    klassetrin       INTEGER NOT NULL,
    kontaktlærer_id INTEGER REFERENCES lærer (lærer_id)
);

CREATE TABLE elev
(
    elev_id      INTEGER PRIMARY KEY,
    navn         TEXT NOT NULL,
    fødselsdato DATE NOT NULL,
    klasse_id    INTEGER REFERENCES klasse (klasse_id)
);

CREATE TABLE forælder
(
    forælder_id INTEGER NOT NULL PRIMARY KEY,
    navn         TEXT NOT NULL,
    email        TEXT NOT NULL
);

CREATE TABLE elevforælder
(
    elev_id      INTEGER REFERENCES elev (elev_id),
    forælder_id INTEGER REFERENCES forælder (forælder_id),
    PRIMARY KEY (elev_id, forælder_id)
);

CREATE TABLE opslag
(
    opslag_id    INTEGER PRIMARY KEY,
    lærer_id    INTEGER REFERENCES lærer (lærer_id),
    klasse_id    INTEGER REFERENCES klasse (klasse_id),
    titel        TEXT    NOT NULL,
    indhold      TEXT NOT NULL,
    oprettet_tid INTEGER NOT NULL
);

CREATE TABLE besked
(
    besked_id   INTEGER PRIMARY KEY,
    lærer_id   INTEGER REFERENCES lærer (lærer_id),
    forælder_id INTEGER REFERENCES forælder (forælder_id),
    elev_id     INTEGER REFERENCES elev (elev_id),
    afsender    TEXT,
    emne        TEXT,
    tekst       TEXT,
    sendt_tid   INTEGER
);

INSERT INTO lærer(lærer_id, navn, email, fag) VALUES ('1', 'Socrates', 'Socrates@skole.dk', 'Dansk');
INSERT INTO lærer(lærer_id, navn, email, fag) VALUES ('2', 'Euclid', 'Euclid@skole.dk', 'Matematik');
INSERT INTO lærer(lærer_id, navn, email, fag) VALUES ('3', 'Plato', 'Plato@skole.dk', 'Historie');
INSERT INTO lærer(lærer_id, navn, email, fag) VALUES ('4', 'Diogenes', 'Diogenes@skole.dk', 'Samfundsfag');
INSERT INTO lærer(lærer_id, navn, email, fag) VALUES ('5', 'Aristotle', 'Aristotle@skole.dk', 'Naturfag');

INSERT INTO klasse(klasse_id, navn, klassetrin, kontaktlærer_id) VALUES ('1', 'Alpha', '5', '1');
INSERT INTO klasse(klasse_id, navn, klassetrin, kontaktlærer_id) VALUES ('2', 'Beta', '4', '2');
INSERT INTO klasse(klasse_id, navn, klassetrin, kontaktlærer_id) VALUES ('3', 'Gamma', '3', '3');
INSERT INTO klasse(klasse_id, navn, klassetrin, kontaktlærer_id) VALUES ('4', 'Delta', '2', '4');
INSERT INTO klasse(klasse_id, navn, klassetrin, kontaktlærer_id) VALUES ('5', 'Epsilon', '1', '5');

INSERT INTO elev(elev_id, navn, fødselsdato, klasse_id) VALUES (1, 'Galileo Galilei', '1564-02-15', '1');
INSERT INTO elev(elev_id, navn, fødselsdato, klasse_id) VALUES (2, 'John Locke', '1632-08-29', '2');
INSERT INTO elev(elev_id, navn, fødselsdato, klasse_id) VALUES (3, 'Immanuel Kant', '1724-04-22', '3');
INSERT INTO elev(elev_id, navn, fødselsdato, klasse_id) VALUES (4, 'Søren Kierkegaard', '1813-5-5', '4');
INSERT INTO elev(elev_id, navn, fødselsdato, klasse_id) VALUES (5, 'Elizabeth Anscombe', '1919-3-18', '5');

INSERT INTO forælder(forælder_id, navn, email) VALUES (1, 'Augustine', 'Augustine@forælder.dk');
INSERT INTO forælder(forælder_id, navn, email) VALUES (2, 'Avicenna', 'Avicenna@forælder.dk');
INSERT INTO forælder(forælder_id, navn, email) VALUES (3, 'Averroes', 'Averroes@forælder.dk');
INSERT INTO forælder(forælder_id, navn, email) VALUES (4, 'Thomas Aquinas', 'ThomasAquinas@forælder.dk');
INSERT INTO forælder(forælder_id, navn, email) VALUES (5, 'William of Ockham', 'WilliamofOckham@forælder.dk');

INSERT INTO elevforælder(elev_id, forælder_id) VALUES (1, 1);
INSERT INTO elevforælder(elev_id, forælder_id) VALUES (2, 2);
INSERT INTO elevforælder(elev_id, forælder_id) VALUES (3, 3);
INSERT INTO elevforælder(elev_id, forælder_id) VALUES (4, 4);
INSERT INTO elevforælder(elev_id, forælder_id) VALUES (5, 5);
INSERT INTO elevforælder(elev_id, forælder_id) VALUES (5, 4);
