DROP SCHEMA IF EXISTS "trainee" CASCADE;
CREATE SCHEMA "trainee";

CREATE TABLE IF NOT EXISTS
    trainee.t_discipline
(
    discipline_id          serial PRIMARY KEY,
    discipline_description varchar UNIQUE NOT NULL,
    world_record           decimal        NOT NULL,
    set_date               date           NOT NULL
);

CREATE TABLE IF NOT EXISTS
    trainee.t_competition
(
    competition_id   serial PRIMARY KEY,
    competition_name varchar NOT NULL,
    city             varchar NOT NULL,
    hold_date        date    NOT NULL
);

CREATE TABLE IF NOT EXISTS
    trainee.t_competitions_disciplines
(
    competition_id integer NOT NULL,
    discipline_id  serial  NOT NULL,
    PRIMARY KEY (competition_id, discipline_id),
    FOREIGN KEY (discipline_id)
    REFERENCES trainee.t_discipline (discipline_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (competition_id)
    REFERENCES trainee.t_competition (competition_id)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS
    trainee.t_sportsman
(
    sportsman_id   serial PRIMARY KEY,
    sportsman_name varchar NOT NULL,
    rank           integer,
    year_of_birth  integer NOT NULL,
    country        varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS
    trainee.t_sportsman_record
(
    sportsman_id  serial  NOT NULL,
    discipline_id integer NOT NULL,
    record_value  decimal,
    PRIMARY KEY (sportsman_id, discipline_id),
    FOREIGN KEY (sportsman_id)
    REFERENCES trainee.t_sportsman (sportsman_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (discipline_id)
    REFERENCES trainee.t_discipline (discipline_id)
    ON DELETE CASCADE ON UPDATE CASCADE
    );


CREATE TABLE IF NOT EXISTS
    trainee.t_result
(
    competition_id integer NOT NULL,
    discipline_id  integer NOT NULL,
    sportsman_id   integer NOT NULL,
    result         decimal,
    PRIMARY KEY (sportsman_id, discipline_id, result),
    FOREIGN KEY (competition_id)
    REFERENCES trainee.t_competition (competition_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (discipline_id)
    REFERENCES trainee.t_discipline (discipline_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sportsman_id)
    REFERENCES trainee.t_sportsman (sportsman_id)
    ON DELETE CASCADE ON UPDATE CASCADE
    );


INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 100 метров. Мужчины', 9.58, '2009-08-16');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 200 метров. Мужчины', 19.19, '2009-08-20');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 400 метров. Мужчины', 43.03, '2016-08-14');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 800 метров. Мужчины', 100.91, '2012-08-09');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 1000 метров. Мужчины', 131.96, '1999-09-05');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 1500 метров. Мужчины', 206.00, '1998-07-14');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 1 милю. Мужчины', 223.13, '1999-07-07');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 2000 метров. Мужчины', 284.79, '1999-09-07');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 3000 метров. Мужчины', 440.67, '1996-09-01');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 5000 метров. Мужчины', 755.36, '2020-08-14');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 10000 метров. Мужчины', 1577.53, '2005-08-26');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 20000 метров. Мужчины', 3385.98, '2007-06-27');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 25000 метров. Мужчины', 4345.4, '2011-06-03');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 30000 метров. Мужчины', 5207.4, '2011-06-13');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег. Марафон. Мужчины', 7299, '2018-09-16');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег 3000 метров с препятствиями. Мужчины', 473.63, '2004-09-03');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 110 метров c барьерами. Мужчины', 12.80, '2012-09-07');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Бег на 400 метров с барьерами. Мужчины', 46.78, '1992-08-06');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Ходьба на 20000 метров. Мужчины', 4645.6, '1994-05-07');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Ходьба на 30000 метров. Мужчины', 7304.1, '1992-10-03');
INSERT INTO trainee.t_discipline (discipline_description, world_record, set_date)
VALUES ('Ходьба на 50000 метров. Мужчины', 12927.2, '2011-03-12');

INSERT INTO trainee.t_competition (competition_name, city, hold_date)
VALUES ('Чемпионат мира по лёгкой атлетике 2021', 'Москва', '2021-06-01');

INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);
INSERT INTO trainee.t_competitions_disciplines (competition_id)
VALUES (1);

INSERT INTO trainee.t_sportsman (sportsman_name, rank, year_of_birth, country)
VALUES ('Petrov Stepan Olegovich', 1, 1990, 'Russia');
INSERT INTO trainee.t_sportsman_record (sportsman_id, discipline_id, record_value)
VALUES (1, 1, 10.23);
INSERT INTO trainee.t_result (competition_id, discipline_id, sportsman_id, result)
VALUES (1, 1, 1, 10.45);

INSERT INTO trainee.t_sportsman (sportsman_name, rank, year_of_birth, country)
VALUES ('Ivanov Igor Maratovich', 2, 1996, 'Ukraine');
INSERT INTO trainee.t_sportsman_record (sportsman_id, discipline_id, record_value)
VALUES (2, 1, 11.46);
INSERT INTO trainee.t_sportsman_record (sportsman_id, discipline_id, record_value)
VALUES (2, 2, 20.22);
INSERT INTO trainee.t_result (competition_id, discipline_id, sportsman_id, result)
VALUES (1, 1, 2, 11.46);
INSERT INTO trainee.t_result (competition_id, discipline_id, sportsman_id, result)
VALUES (1, 2, 2, 20.45);
-- ...

select *
from trainee.t_competition;

select *
from trainee.t_sportsman;

select result, competition_name
from trainee.t_result
         join trainee.t_competition tc on tc.competition_id = t_result.competition_id;

select *
from trainee.t_sportsman
where year_of_birth = 1990;

select *
from trainee.t_result
         join trainee.t_competition tc on tc.competition_id = t_result.competition_id
where hold_date between '2010-05-12' and '2010-05-15';

select *
from trainee.t_sportsman
where year_of_birth = 1990;

SELECT c.hold_date
FROM trainee.t_competition c
         JOIN trainee.t_result r ON c.competition_id = r.competition_id
WHERE c.city = 'Москва'
  AND r.result = 10;

SELECT s.sportsman_name
FROM trainee.t_sportsman s
         JOIN trainee.t_sportsman_record sr ON s.sportsman_id = sr.sportsman_id
WHERE sr.record_value != 25;

SELECT c.competition_name
FROM trainee.t_discipline d
         JOIN trainee.t_competitions_disciplines cd ON d.discipline_id = cd.discipline_id
         JOIN trainee.t_competition c ON cd.competition_id = c.competition_id
WHERE d.world_record = 15
  AND d.set_date != '2015-02-12';


SELECT DISTINCT c.city
FROM trainee.t_competition c
         JOIN trainee.t_result r ON c.competition_id = r.competition_id
WHERE r.result IN (13, 25, 17, 9);

SELECT s.sportsman_name
FROM trainee.t_sportsman s
WHERE s.year_of_birth = 2000
  AND s.rank NOT IN (3, 7, 9);
SELECT hold_date
FROM trainee.t_competition
WHERE city LIKE 'М%';

SELECT sportsman_name
FROM trainee.t_sportsman
WHERE sportsman_name LIKE 'М%'
  AND NOT year_of_birth LIKE '%6';


SELECT competition_name
FROM trainee.t_competition
WHERE competition_name LIKE '%международные%';

SELECT DISTINCT year_of_birth
FROM trainee.t_sportsman;

SELECT s.sportsman_name
FROM trainee.t_sportsman s
WHERE s.year_of_birth = 2000
  AND s.rank NOT IN (3, 7, 9);

SELECT hold_date
FROM trainee.t_competition
WHERE city LIKE 'М%';

SELECT *
FROM trainee.t_sportsman
WHERE sportsman_name LIKE 'P%'
  AND year_of_birth NOT LIKE '%6';

SELECT c.competition_name
FROM trainee.t_competition c
WHERE competition_name LIKE '%мира%';

SELECT DISTINCT s.year_of_birth
FROM trainee.t_sportsman s;

SELECT d.set_date, COUNT(d.set_date)
FROM trainee.t_discipline d
WHERE d.set_date = '2014-05-12'
GROUP BY d.set_date;

SELECT MAX(r.result)
FROM trainee.t_competition c
         INNER JOIN trainee.t_result r USING (competition_id)
WHERE c.city = 'Москва';

SELECT *
FROM trainee.t_competition c
         INNER JOIN trainee.t_result r USING (competition_id)
WHERE r.result = (SELECT MAX(result) FROM trainee.t_result WHERE city = 'Москва')
  AND c.city = 'Москва';

SELECT MIN(year_of_birth)
FROM trainee.t_sportsman
WHERE rank = 1;

SELECT s.sportsman_name
FROM trainee.t_sportsman s
         INNER JOIN trainee.t_sportsman_record sr USING (sportsman_id)
WHERE sr.record_value IN (SELECT world_record FROM trainee.t_discipline WHERE set_date = '2014-05-12');

SELECT s.sportsman_id, s.sportsman_name, AVG(sr.record_value) AS avg_result
FROM trainee.t_sportsman s
         INNER JOIN trainee.t_sportsman_record sr ON s.sportsman_id = sr.sportsman_id
GROUP BY s.sportsman_id, s.sportsman_name;

SELECT s.year_of_birth
FROM trainee.t_competition
         INNER JOIN trainee.t_result r USING (competition_id)
         INNER JOIN trainee.t_sportsman s USING (sportsman_id)
WHERE city = 'Москва'
  AND r.result > (SELECT AVG(r.result)
                  FROM trainee.t_competition
                           INNER JOIN trainee.t_result r USING (competition_id)
                  WHERE city = 'Москва');