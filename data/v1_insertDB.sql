INSERT INTO LesTaux VALUES('Balcon', 1);
INSERT INTO LesTaux VALUES('Orchestre', 0.5);
INSERT INTO LesTaux VALUES('Poulailler', 0);

INSERT INTO LesZones VALUES(1, 'Poulailler');
INSERT INTO LesZones VALUES(2, 'Orchestre');
INSERT INTO LesZones VALUES(3, 'Balcon');

INSERT INTO LesPlaces VALUES(1, 1, 1);
INSERT INTO LesPlaces VALUES(2, 1, 1);
INSERT INTO LesPlaces VALUES(3, 1, 1);
INSERT INTO LesPlaces VALUES(4, 1, 1);
INSERT INTO LesPlaces VALUES(5, 1, 1);
INSERT INTO LesPlaces VALUES(1, 2, 1);
INSERT INTO LesPlaces VALUES(2, 2, 1);
INSERT INTO LesPlaces VALUES(3, 2, 1);
INSERT INTO LesPlaces VALUES(4, 2, 1);
INSERT INTO LesPlaces VALUES(5, 2, 1);
INSERT INTO LesPlaces VALUES(1, 3, 2);
INSERT INTO LesPlaces VALUES(2, 3, 2);
INSERT INTO LesPlaces VALUES(3, 3, 2);
INSERT INTO LesPlaces VALUES(4, 3, 2);
INSERT INTO LesPlaces VALUES(5, 3, 2);
INSERT INTO LesPlaces VALUES(1, 4, 3);
INSERT INTO LesPlaces VALUES(2, 4, 3);
INSERT INTO LesPlaces VALUES(3, 4, 3);
INSERT INTO LesPlaces VALUES(4, 4, 3);
INSERT INTO LesPlaces VALUES(5, 4, 3);

INSERT INTO LesInformations VALUES(1, 'How to be a parisian ?', 25);
INSERT INTO LesInformations VALUES(2, 'Je parle toute seule', 20);

INSERT INTO LesRepresentations VALUES('27/11/2008 17:00', 0.2, 1);
INSERT INTO LesRepresentations VALUES('28/11/2008 20:00', 0.1, 1);
INSERT INTO LesRepresentations VALUES('29/11/2008 21:00', 0.3, 2);

INSERT INTO LesSituations VALUES('etudiant', 0.1);
INSERT INTO LesSituations VALUES('scolaire', 0.1);
INSERT INTO LesSituations VALUES('militaire', 0.2);
INSERT INTO LesSituations VALUES('senior', 0.2);
INSERT INTO LesSituations VALUES('adherent', 0.3);
INSERT INTO LesSituations VALUES('sans reduction', 0);

INSERT INTO LesDossiers(dateCrea) VALUES('26/11/2008 20:18:20');
INSERT INTO LesDossiers(dateCrea) VALUES('22/11/2008 9:46:25');
INSERT INTO LesDossiers(dateCrea) VALUES('23/11/2008 14:16:18');

INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('26/11/2008 20:18:20', 'etudiant', '28/11/2008 20:00', 1, 2, 1);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('26/11/2008 20:18:20', 'sans reduction', '28/11/2008 20:00', 2, 2, 1);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('26/11/2008 20:18:20', 'etudiant', '28/11/2008 20:00', 3, 2, 1);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('26/11/2008 20:18:20', 'scolaire', '28/11/2008 20:00', 4, 2, 1);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('22/11/2008 9:46:25', 'militaire', '29/11/2008 21:00', 5, 1, 2);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('22/11/2008 9:46:25', 'etudiant', '29/11/2008 21:00', 4, 1, 2);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('22/11/2008 9:46:25', 'adherent', '29/11/2008 21:00', 4, 1, 2);
INSERT INTO LesTickets(dateAchat, situation, dateRep, noPlace, noRang, noDos) VALUES('23/11/2008 14:16:18', 'senior', '29/11/2008 21:00', 2, 4, 3);
