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

INSERT INTO LesRepresentations VALUES('27/11/2008 17H', 0.2, 1);
INSERT INTO LesRepresentations VALUES('28/11/2008 20H', 0.1, 1);
INSERT INTO LesRepresentations VALUES('29/11/2008 21H', 0.3, 2);

INSERT INTO LesSituations VALUES('etudiant', 0.1);
INSERT INTO LesSituations VALUES('scolaire', 0.1);
INSERT INTO LesSituations VALUES('militaire', 0.2);
INSERT INTO LesSituations VALUES('senior', 0.2);
INSERT INTO LesSituations VALUES('adherent', 0.3);
INSERT INTO LesSituations VALUES('sans reduction', 0);

INSERT INTO LesTickets VALUES(1000, '26/11/2008 20H-18M-20S', 'etudiant', '28/11/2008 20H', 1, 2, 404);
INSERT INTO LesTickets VALUES(1001, '26/11/2008 20H-18M-20S', 'sans reduction', '28/11/2008 20H', 2, 2, 404);
INSERT INTO LesTickets VALUES(1002, '26/11/2008 20H-18M-20S', 'etudiant', '28/11/2008 20H', 3, 2, 404);
INSERT INTO LesTickets VALUES(1003, '26/11/2008 20H-18M-20S', 'scolaire', '28/11/2008 20H', 4, 2, 404);
INSERT INTO LesTickets VALUES(1004, '22/11/2008 9H-46M-25S', 'militaire', '29/11/2008 20H', 5, 1, 405);
INSERT INTO LesTickets VALUES(1005, '22/11/2008 9H-46M-25S', 'etudiant', '29/11/2008 20H', 4, 1, 405);
INSERT INTO LesTickets VALUES(1006, '22/11/2008 9H-46M-25S', 'adherent', '29/11/2008 20H', 4, 1, 405);
INSERT INTO LesTickets VALUES(1007, '23/11/2008 14H-16M-18S', 'senior', '29/11/2008 20H', 2, 4, 406);