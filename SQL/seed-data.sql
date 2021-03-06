INSERT INTO ads.role(id, type)
  VALUES
    (1, 'Nurse'),
    (2, 'Pharmacy Technician');

INSERT INTO ads.status (id, status) 
  VALUES 
    (1, 'Active'), 
    (2, 'Discontinued'), 
    (3, 'Admitted'), 
    (4, 'Transferred'), 
    (5, 'Discharged');

INSERT INTO ads.doctor (id, fname, lname, mi) 
  VALUES 
    (1, 'Caroly', 'Josh', 'T'), 
    (2, 'Rudie', 'Vincion', 'U'),
    (3, 'Luffy', 'Jay', 'J'),
    (4, 'Robinson', 'Robin', 'H');

INSERT INTO ads.machine (id, building_floor, num_drawers) 
  VALUES 
    (1, 1, 13), 
    (2, 2, 15), 
    (3, 3, 12), 
    (4, 4, 12);
   

INSERT INTO ads.user (id, username, password, role, fname, lname, mi) 
  VALUES 
    (1, 'Vitory', 'Thunder234', 1, 'Victor', 'Lucas', 'T'), 
    (2, 'John3421', 'Hacker9', 1, 'John', 'Lee', ''), 
    (3, 'Mssummer8573', 'Flower', 1, 'May', 'Lee', 'K'), 
    (4, 'gjior88', 'Jupiter', 1, 'Bao', 'Vu', 'T'), 
    (5, 'f4snke', 'Minnesota', 1, 'Luois', 'christerpher', ''), 
    (6, 'Jhug8d', 'Hacker9', 1, 'John', 'Lee', ''), 
    (7, 'John3421', 'Hacker9', 1, 'Ruddie', 'Illinoize', 'H'), 
    (8, 'jjllji4', 'Minnesota', 1, 'Harry', 'Porter', ''), 
    (9, 'fihnk43', 'hnfaof', 1, 'Jonny', 'Depp', ''), 
    (10, 'Hon3421', 'Sunshine3u4', 1, 'Anna', 'Ellizabet', ''), 
    (11, 'lgkaeer1', 'Kitten48520', 1, 'Robert', 'John', ''), 
    (12, 'OwlsNight35k', 'MsNight101', 1, 'Michaiel', 'kein', ''), 
    (13, 'Programmer592', 'Javacodeisthebest43', 1, 'Patricia', 'Venus', ''), 
    (14, 'Coddingisfun204', 'I345po', 1, 'Linda', 'James', ''), 
    (15, 'Jo42e1', 'DinoSaurou394', 2, 'John', 'Nguyen', 'T'), 
    (16, 'BBB', 'BBB22', 2, 'Trinh', 'Nguyen', '');

INSERT INTO ads.medication (id, name, strength, expiration) 
  VALUES 
    (1, 'Adderall', '20mg', '2021-03-20'), 
    (2, 'Adderall', '10mg', '2025-09-01'), 
    (3, 'Amitriptyline', '25mg', '2023-06-26'), 
    (4, 'Amlodipine', '10mg', '2021-05-20'), 
    (5, 'Dupixent', '15mg', '2025-03-16'), 
    (6, 'Buprenorphine', '50mg', '2028-01-10'), 
    (7, 'Brilinta', '20mg', '2021-11-11'), 
    (8, 'Clindamycin', '50mg', '2021-10-15'), 
    (9, 'Trazodone', '10mg', '2021-07-19'), 
    (10, 'Ozempic', '15mg', '2023-10-11'), 
    (11, 'Kevzara', '10mg', '2022-08-08'), 
    (12, 'Omeprazole', '10mg', '2025-01-30'), 
    (13, 'Probuphine', '20mg', '2028-05-28'), 
    (14, 'Zubsolv', '20mg', '2029-04-23'), 
    (15, 'Lyrica', '15mg', '2027-06-17'), 
    (16, 'Methotrexate', '25mg', '2024-07-10'), 
    (17, 'Fentanyl Patch', '10mg', '2030-10-01'), 
    (18, 'Gilenya', '50mg', '2023-09-11'), 
    (19, 'Hydroxychloroquine', '25mg', '2029-08-10'), 
    (20, 'Invokana', '15mg', '2021-10-20'), 
    (21, 'Naltrexone', '20mg', '2029-10-20');

INSERT INTO ads.inventory (machine, drawer, medication, qty, active, audit_date, last_audited_by, min_qty, max_qty) 
  VALUES
    (2, 14, 3, 10, true, '2020-06-20', 15, 5, 50)
    (1, 1, 1, 10, true, '2020-06-20', 15, 20, 50),
    (1, 2, 3, 10, true, '2020-06-20', 15, 20, 50),
    (1, 3, 5, 10, true, '2020-06-20', 15, 20, 50),
    (1, 4, 7, 10, true, '2020-06-20', 15, 20, 50),
    (1, 5, 9, 10, true, '2020-06-20', 15, 20, 50),
    (2, 1, 11, 10, true, '2020-06-20', 15, 20, 50),
    (2, 2, 13, 10, true, '2020-06-20', 15, 20, 50),
    (2, 3, 15, 10, true, '2020-06-20', 15, 20, 50),
    (2, 4, 17, 10, true, '2020-06-20', 15, 20, 50),
    (2, 5, 19, 10, true, '2020-06-20', 15, 20, 50),
    (3, 1, 21, 10, true, '2020-06-20', 15, 20, 50),
    (3, 2, 2, 10, true, '2020-06-20', 15, 20, 50),
    (3, 3, 4, 10, true, '2020-06-20', 15, 20, 50),
    (3, 4, 6, 10, true, '2020-06-20', 15, 20, 50),
    (3, 5, 8, 10, true, '2020-06-20', 15, 20, 50),
    (4, 1, 9, 10, true, '2020-06-20', 15, 20, 50),
    (4, 2, 12, 10, true, '2020-06-20', 15, 20, 50),
    (4, 3, 14, 10, true, '2020-06-20', 15, 20, 50),
    (4, 4, 16, 10, true, '2020-06-20', 15, 20, 50),
    (4, 5, 18, 10, true, '2020-06-20', 15, 20, 50),
    (2, 13, 19, 10, true, '2020-06-20', 15, 20, 50),
    (1, 13, 20, 10, true, '2020-06-20', 15, 20, 50),
    (4, 12, 3, 10, true, '2020-06-20', 15, 20, 50),
    (3, 12, 6, 10, true, '2020-06-20', 15, 20, 50),
    (2, 12, 9, 10, true, '2020-06-20', 15, 20, 50),
    (1, 12, 12, 10, true, '2020-06-20', 15, 20, 50),
    (4, 11, 15, 10, true, '2020-06-20', 15, 20, 50),
    (3, 11, 18, 10, true, '2020-06-20', 15, 20, 50),
    (2, 11, 21, 10, true, '2020-06-20', 15, 20, 50),
    (1, 11, 5, 10, true, '2020-06-20', 15, 20, 50),
    (4, 10, 10, 10, true, '2020-06-20', 15, 20, 50),
    (4, 9, 15, 10, true, '2020-06-20', 15, 20, 50),
    (4, 8, 20, 10, true, '2020-06-20', 15, 20, 50),
    (4, 7, 7, 10, true, '2020-06-20', 15, 20, 50),
    (4, 6, 14, 10, true, '2020-06-20', 15, 20, 50),
    (3, 10, 21, 10, true, '2020-06-20', 15, 20, 50),
    (3, 9, 6, 10, true, '2020-06-20', 15, 20, 50),
    (3, 8, 12, 10, true, '2020-06-20', 15, 20, 50),
    (3, 7, 4, 10, true, '2020-06-20', 15, 20, 50),
    (3, 6, 8, 10, true, '2020-06-20', 15, 20, 50),
    (2, 10, 12, 10, true, '2020-06-20', 15, 20, 50),
    (2, 9, 16, 10, true, '2020-06-20', 15, 20, 50),
    (2, 8, 20, 10, true, '2020-06-20', 15, 20, 50),
    (2, 7, 1, 10, true, '2020-06-20', 15, 20, 50),
    (2, 6, 5, 10, true, '2020-06-20', 15, 20, 50),
    (1, 10, 7, 10, true, '2020-06-20', 15, 20, 50),
    (1, 9, 11, 10, true, '2020-06-20', 15, 20, 50),
    (1, 8, 13, 10, true, '2020-06-20', 15, 20, 50),
    (1, 7, 19, 10, true, '2020-06-20', 15, 20, 50),
    (1, 6, 5, 10, true, '2020-06-20', 15, 20, 50);

INSERT INTO ads.nurse (id, shift) 
  VALUES 
    (1, '1st'), 
    (2, '1st'), 
    (3, '1st'), 
    (4, '2nd'), 
    (5, '2nd'), 
    (6, '3rd'), 
    (7, '3rd'), 
    (8, '3rd'), 
    (9, '2nd'), 
    (10, 'Swing'), 
    (11, '2nd'), 
    (12, 'Swing'), 
    (13, 'Swing'), 
    (14, 'Swing');

INSERT INTO ads.patient (id, fname, lname, mi, building_floor, status, bed) 
  VALUES 
    (1, 'Nami', 'Christin', '', 1, 3, 1), 
    (2, 'Franky', 'King', '', 1, 3, 2),
    (3, 'Robinson', 'Smith', '', 1, 3, 3), 
    (4, 'Victoria', 'Hasty', '', 1, 3, 4), 
    (5, 'Kim', 'Nguyen', '', 1, 3, 5),
    (6, 'Benedict', 'Cumberbatch', '', 1, 3, 6),
    (7, 'Robert', 'Downey Jr.', '', 2, 3, 1),
    (8, 'Bob', 'Jackson', '', 2, 3, 2),
    (9, 'Oswald', 'Osbourne', '', 2, 3, 3),
    (10, 'Chris', 'Bowes', '', 2, 3, 4),
    (11, 'John', 'Five', '', 2, 3, 5),
    (12, 'Marilyn', 'Manson', '', 2, 3, 6),
    (13, 'Amber', 'Heard', '', 3, 3, 1),
    (14, 'Wanda', 'Maximov', '', 3, 3, 2),
    (15, 'Bruce', 'Banner', '', 3, 3, 3),
    (16, 'Rob', 'Zombie', '', 3, 3, 4),
    (17, 'Jackson', 'Smith', '', 3, 3, 5),
    (18, 'Keaunu', 'Reeves', '', 3, 3, 6),
    (19, 'Edwardo', 'Moldanado', '', 4, 3, 1),
    (20, 'Andy', 'Johnson', '', 4, 3, 2),
    (21, 'Steven', 'Spielburg', '', 4, 3, 3),
    (22, 'Lianna', 'Ming', '', 4, 3, 4),
    (23, 'Joshua', 'Albrecht', '', 4, 3, 5),
    (24, 'Alison', 'Murphey', '', 4, 3, 6);

INSERT INTO ads."order" (id, patient, doctor, medication, status, dosage) 
  VALUES 
    (2, 1, 1, 2, 1, '1 pill 2 times daily'),
    (3, 2, 2, 3, 1, '1 pill 2 times daily') , 
    (4, 3, 3, 10, 2, '1 pill as needed'), 
    (5, 4, 2, 15, 1, '1 pill daily'), 
    (6, 5, 1, 10, 1, '1 pill 2 times daily'), 
    (7, 6, 3, 13, 2, '1 pill as needed'), 
    (8, 7, 1, 4, 2, 'orally 3 times a day for 7 days '), 
    (9, 8, 3, 12, 1, 'orally 3 times a day for 14 to 28 days'), 
    (10, 9, 2, 8, 2, 'every 12 hours or one 250-mg tablet every 8 hours'), 
    (11, 10, 4, 11, 1, 'orally 3 to 4 times a day'), 
    (12, 11, 2, 5, 1, 'twice daily for up to 30 days'), 
    (13, 12, 4, 10, 2, 'the maximum dose is 10 mg not more than once in every 48 hours'), 
    (14, 13, 2, 9, 2, ' The maximum dose is 5 mg not more than once in every 72 hours'), 
    (15, 14, 2, 9, 1, 'orally every 12 hours'), 
    (16, 15, 3, 6, 1, 'orally every 12 hours'), 
    (17, 16, 3, 8, 1, 'the maximum dose is 10 mg not more than once in every 48 hours'), 
    (18, 17, 3, 2, 1, 'orally 3 times a day for 7 days '), 
    (19, 18, 4, 16, 1, '1 pill as needed'), 
    (20, 19, 3, 6, 1, 'orally 3 times a day for 14 to 28 days'), 
    (21, 20, 2, 2, 1, 'the maximum dose is 10 mg not more than once in every 48 hours'), 
    (22, 21, 3, 10, 1, 'orally 3 to 4 times a day'), 
    (23, 22, 3, 20, 1, 'orally every 12 hours'), 
    (24, 23, 3, 10, 2, 'twice daily for up to 30 days'), 
    (25, 24, 3, 20, 2, 'the maximum dose is 10 mg not more than once in every 48 hours'), 
    (26, 7, 4, 11, 1, 'the maximum dose is 10 mg not more than once in every 48 hours'), 
    (27, 8, 4, 17, 1, 'every 12 hours or one 250-mg tablet every 8 hours'), 
    (28, 9, 4, 12, 1, '1 pill as needed'), 
    (29, 10, 3, 17, 1, 'every 8 hours'), 
    (30, 12, 4, 3, 1, 'At least 2 to 3 weeks'), 
    (31, 6, 4, 21, 1, 'every 12 hour');
