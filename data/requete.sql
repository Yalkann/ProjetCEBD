SELECT * FROM LesSituations;
SELECT * FROM LesTaux;
SELECT * FROM LesZones;
SELECT * FROM LesPlaces;
SELECT * FROM LesRepresentations;
SELECT * FROM LesDossiers;
SELECT * FROM LesTickets;
SELECT * FROM LesTickets
JOIN LesPlaces USING (noPlace, noRang)
JOIN LesZones USING (noZon)
WHERE typeZone = 'Balcon';
SELECT * FROM LesTickets
JOIN LesReprentations USING (dateRep)
JOIN LesInformations USING (noSpec)
WHERE nomSpec = 'How to be a Parisian ?';
SELECT * FROM LesTickets
JOIN LesDossiers USING(noDos)
WHERE dateCrea = '26/11/2008 20:18:20';
SELECT LesDossier.noDos FROM LesTaux
JOIN LesZones USING (typeZone)
JOIN LesPlaces USING (noZone)
JOIN LesTickets USING (noPlace, noRang)
JOIN LesDossier USING (noDos)
WHERE typeZone = 'orchestre';