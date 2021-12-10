-- Views
DROP VIEW IF EXISTS LesDossiersView;
DROP VIEW IF EXISTS LesTicketsView;
DROP VIEW IF EXISTS LesRepresentationsView;

-- Tables sans dépendance
DROP TABLE IF EXISTS LesTickets;

-- Tables en dépendance uniquement avec la table LesTickets
DROP TABLE IF EXISTS LesSituations;
DROP TABLE IF EXISTS LesDossiers;
DROP TABLE IF EXISTS LesPlaces;
DROP TABLE IF EXISTS LesRepresentations;

-- Table en dépendance avec LesRepresentations
DROP TABLE IF EXISTS LesInformations;
-- Table en dépendance avec LesPlaces
DROP TABLE IF EXISTS LesZones;

-- Table en dépendance avec LesZones
DROP TABLE IF EXISTS LesTaux;