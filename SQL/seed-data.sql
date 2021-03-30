INSERT INTO ads.doctor (id, fname, lname, mi) 
  VALUES 
    (1, 'Caroly', 'Josh', 'T'), 
    (2, 'Rudie', 'Vincion', 'U'),
    (3, 'Luffy', 'Jay', 'J'),
    (4, 'Robinson', 'Robin', 'H');

INSERT INTO ads.machine (id, floor, num_drawers) 
  VALUES 
    (1, 1, 5), 
    (2, 2, 5), 
    (3, 3, 5), 
    (4, 4, 5), 
    (5, 5, 5), 
    (6, 6, 5), 
    (7, 1, 5), 
    (8, 2, 5), 
    (9, 3, 5), 
    (10, 4, 5);

INSERT INTO ads."user" (id, username, password, role, fname, lname, mi) 
  VALUES 
    (1, 'Vitory', 'Thunder234', NULL, 'victor', 'Lucas', 'T'), 
    (2, 'John3421', 'Hacker9', NULL, 'John', 'Lee', ''), 
    (3, 'Mssummer8573', 'Flower', NULL, 'May', 'Lee', 'K'), 
    (4, 'gjior88', 'Jupiter', NULL, 'Bao', 'Vu', 'T'), 
    (5, 'f4snke', 'Minnesota', NULL, 'Luois', 'christerpher', ''), 
    (6, 'Jhug8d', 'Hacker9', NULL, 'John', 'Lee', ''), 
    (7, 'John3421', 'Hacker9', NULL, 'Ruddie', 'Illinoize', 'H'), 
    (8, 'jjllji4', 'Minnesota', NULL, 'Harry', 'Porter', ''), 
    (9, 'fihnk43', 'hnfaof', NULL, 'Jonny', 'Depp', ''), 
    (10, 'Hon3421', 'Sunshine3u4', NULL, 'Anna', 'Ellizabet', ''), 
    (11, 'lgkaeer1', 'Kitten48520', NULL, 'Robert', 'John', ''), 
    (12, 'OwlsNight35k', 'MsNight101', NULL, 'Michaiel', 'kein', ''), 
    (13, 'Programmer592', 'Javacodeisthebest43', NULL, 'Patricia', 'Venus', ''), 
    (14, 'Coddingisfun204', 'I345po', NULL, 'Linda', 'Jame', ''), 
    (15, 'Jo42e1', 'DinoSaurou394', NULL, 'John', 'Nguyen', 'T'), 
    (16, 'BBB', 'BBB22', NULL, 'Trinh', 'Nguyen', '');

INSERT INTO ads.medication (id, name, expiration) 
  VALUES 
    (1, '', '2021-03-20'), 
    (2, 'Adderall', '2020-09-01'), 
    (3, 'Amitriptyline', '2019-06-26'), 
    (4, 'Amlodipine', '2018-05-20'), 
    (5, 'Dupixent', '2017-03-16'), 
    (6, 'Buprenorphine', '2020-01-10'), 
    (7, 'Brilinta', '2011-11-11'), 
    (8, 'Clindamycin', '2015-10-15'), 
    (9, 'Trazodone', '2011-07-19'), 
    (10, 'Ozempic', '2011-10-11'), 
    (11, 'Kevzara', '2013-08-08'), 
    (12, 'Omeprazole', '2000-01-30'), 
    (13, 'Probuphine', '2013-05-28'), 
    (14, 'Zubsolv', '2019-04-23'), 
    (15, 'Lyrica', '2017-06-17'), 
    (16, 'Methotrexate', '2014-07-10'), 
    (17, 'Fentanyl Patch', '2000-10-01'), 
    (18, 'Gilenya', '2013-09-11'), 
    (19, 'Hydroxychloroquine', '2019-08-10'), 
    (20, 'Invokana', '2021-10-20'), 
    (21, 'Naltrexone', '1999-10-20');

INSERT INTO ads.inventory (drawer, machine, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) 
  VALUES
    (1, 3, 3, 10, true, '2020-06-20', 15, 20, 50),
    (3, 4, 6, 10, true, '2020-06-20', 15, 20, 50),
    (4, 4, 7, 10, true, '2020-06-20', 15, 20, 50),
    (2, 1, 5, 10, true, '2020-06-20', 15, 20, 50),
    (1, 2, 5, 10, true, '2020-06-20', 15, 20, 50);

INSERT INTO ads.nurse (id, shift) 
  VALUES 
    (2, '1st'), 
    (3, '1st'), 
    (4, '1st'), 
    (5, '2nd'), 
    (6, '2nd'), 
    (11, '3rd'), 
    (10, '3rd'), 
    (9, '3rd'), 
    (8, '2nd'), 
    (7, 'Swing'), 
    (12, '2nd'), 
    (13, 'Swing'), 
    (14, 'Swing'), 
    (16, 'Swing');

INSERT INTO ads.status (status) 
  VALUES 
    ('Good'), 
    ('Fair'), 
    ('Poor'), 
    ('Critical'), 
    ('Treated and Released'), 
    ('Treated and Transferred');

INSERT INTO ads.role (type) VALUES ('Nurse'), ('Tech');

INSERT INTO ads.patient (id, fname, lname, mi, floor, p_group, status, bed)
 VALUES (24, 'Sonia', 'Brzozowski', '', 4, 4, 9, 5),
(1, 'John', 'Ceana', '', 1, 1, 10, 1),
 (2, 'Lashay', 'Amon', '', 1, 3, 8, 2),
(4, 'Willard', 'Cain', '', 1, 4, 7, 3),
 (5, 'Nami', 'Christin', '', 1, 1, 9, 4),
 (6, 'Franky', 'king', '', 1, 3, 6, 5),
 (7, 'Robinson', 'Smith', '', 1, 4, 7, 6),
(8, 'Victoria', 'Hasty', '', 2, 4, 9, 1),
 (9, 'Kim', 'Nguyen', '', 2, 4, 10, 2),
(10, 'Lina', 'Bohler', '', 2, 4, 8, 3),
 (11, 'Shella', 'Tyer', '', 2, 1, 9, 4),
 (12, 'Leo', 'Venema', '', 2, 3, 10, 5),
 (13, 'Cletus', 'Cleghorn', '', 2, 4, 7, 6),
 (14, 'Eugenia', 'Lambright', '', 3, 4, 7, 1),
(15, 'Leilani', 'Tezeno', '', 3, 4, 8, 2),
(16, 'Zack', 'Nicolosi', '', 3, 1, 9, 3),
(17, 'Cecilia', 'Loredo', '', 3, 3, 11, 4),
 (18, 'Katharyn', 'Ephraim', '', 3, 4, 10, 5),
 (19, 'Mozella', 'Carrell', '', 3, 4, 6, 6),
 (20, 'Jenine', 'Hebel', '', 4, 4, 6, 1),
(21, 'Faustino', 'Gulotta', '', 4, 1, 8, 2),
 (22, 'Wilhemina', 'Ahmad', '', 4, 3, 9, 3),
(23, 'Riley', 'Harbaugh', '', 4, 4, 8, 4),
(25, 'Bette', 'Michalik', '', 4, 4, 8, 6);


INSERT INTO ads."order" (id, patient, doctor, medication, status) 
  VALUES 
    (2, 6, 1, 2, 'Your order is ready to pick up'),
    (3, 7, 2, 3, 'An order had been taken'), 
    (4, 8, 3, 10, 'An order had been taken'), 
    (5, 7, 2, 15, 'An order had been taken'), 
    (6, 5, 1, 10, 'Your order is ready to pick up'), 
    (7, 8, 3, 13, 'Your order is ready to pick up'), 
    (8, 5, 1, 4, 'A prescription is ready for refill'), 
    (9, 8, 3, 12, 'A prescription is ready for refill'), 
    (10, 7, 2, 8, 'A prescription is ready for refill'), 
    (11, 9, 4, 11, 'A prescription is ready for refill'), 
    (12, 7, 2, 5, 'Your order is ready to pick up'), 
    (13, 9, 4, 10, 'Your order is ready to pick up'), 
    (14, 7, 2, 9, 'Your order is ready to pick up'), 
    (15, 7, 2, 9, 'An order had been taken'), 
    (16, 8, 3, 6, 'Your order is ready to pick up'), 
    (17, 8, 3, 8, 'Your order is ready to pick up'), 
    (18, 8, 3, 2, 'Your order is ready to pick up'), 
    (19, 9, 4, 16, 'A payment is due'), 
    (20, 8, 3, 6, 'A payment is due'), 
    (21, 7, 2, 2, 'A payment is due'), 
    (22, 8, 3, 10, 'Your order is ready to pick up'), 
    (23, 8, 3, 20, 'An order had been taken'), 
    (24, 8, 3, 10, 'Your order is ready to pick up'), 
    (25, 8, 3, 20, 'An order had been taken'), 
    (26, 9, 4, 11, 'A presciption is ready for refill'), 
    (27, 9, 4, 17, 'A prescription is ready for refill'), 
    (28, 9, 4, 12, 'An order had been taken'), 
    (29, 8, 3, 17, 'A prescription is ready for refill'), 
    (30, 9, 4, 3, 'Your careteam needs to speak with you'), 
    (31, 9, 4, 21, 'An order had been taken');
