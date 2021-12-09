PRAGMA foreign_keys = true;

create table LesTaux (
    typeZone varchar (50),
    tauxZone decimal (4,2) not null,
    constraint pk_Tau_typeZone primary key (typeZone),
    constraint ck_Tau_tauxZone check (tauxZone >= 0),
    constraint ck_Tau_cat check (typeZone in ('Orchestre', 'Balcon', 'Poulailler'))
);

create table LesZones (
    noZone integer,
    typeZone varchar(50),
    constraint pk_Zon_noZ primary key (noZone),
    constraint ck_Zon_noZone check (noZone > 0),
    constraint fk_Zon_typeZone foreign key (typeZone) references LesTaux(typeZone)
        on update cascade
        on delete cascade
);

create table LesPlaces (
    noPlace integer,
    noRang integer,
    noZone integer,
    constraint pk_pla_noP_noR primary key (noPlace, noRang),
    constraint ck_pla_noP check (noPlace > 0),
    constraint ck_pla_noR check (noRang > 0),
    constraint fk_pla_noZ foreign key (noZone) references LesZones(noZone)
        on update cascade
        on delete cascade
);

create table LesInformations (
    noSpec integer,
    nomSpec varchar (80),
    prixBaseSpec decimal(6,2),
    constraint pk_Inf_noSpec primary key (noSpec),
    constraint ck_Inf_PBS check (prixBaseSpec >= 0)
);

create table LesRepresentations (
    dateRep date not null,
    promoRep decimal (4,2) not null,
    noSpec integer not null,
    constraint pk_rep_noSpec_dateRep primary key (dateRep),
    constraint ck_rep_promoRep check (promoRep >= 0 and promoRep <=1),
    constraint fk_rep_noSpec foreign key (noSpec) references LesInformations(noSpec)
        on update cascade
        on delete cascade
);

create table LesDossiers (
    noDos integer,
    dateCrea date not null,
    constraint pk_Dos_noD primary key (noDos)
);

create table LesSituations (
    situation varchar (50),
    promoSit decimal (4,2),
    constraint pk_Sit_sit primary key (situation),
    constraint ck_Sit_pro check (promoSit >= 0 and promoSit <=1),
    constraint pk_Sit_sit check (situation in ('adherent', 'etudiant', 'scolaire', 'militaire', 'senior', 'sans reduction'))
);

create table LesTickets (
    noTic integer,
    dateAchat date not null,
    situation varchar(50) not null,
    dateRep date not null,
    noPlace integer not null,
    noRang integer not null,
    noDos integer not null,
    constraint pk_Tic_noT primary key (noTic),
    constraint fk_Tic_sit foreign key (situation) references LesSituations(situation),
    constraint fk_Tic_daR foreign key (dateRep) references LesRepresentations(dateRep),
    constraint fk_Tic_noP foreign key (noPlace, noRang) references LesPlaces(noPlace, noRang),
    constraint fk_Tic_noD foreign key (noDos) references LesDossiers(noDos)
        on update cascade
        on delete cascade
);

--vue des places restantes par date de representations
create view LesRepresentationsView (dateRep, noPlace, noRang) as
select dateRep, noPlace, noRang
from LesRepresentations
cross join LesPlaces
except
select dateRep, noPlace, noRang
from LesTickets;

--vue du prix de chaque ticket reservé
create view LesTicketsView (noTic, prixTic) as
select noTic, round(((prixBaseSpec * (1 - promoRep) * tauxZone) * (1 - promoSit)),2) as prixTic
from LesTickets
join LesPlaces
using (noPlace, noRang)
join LesZones
using (noZone)
join LesTaux
using (typeZone)
join LesRepresentations
using (dateRep)
join LesInformations
using (noSpec)
join LesSituations
using (situation);

--vue du prix total de chaque dossier
create view LesDossiersView (noDos, prixGlob) as
select noDos, round(SUM(prixTic),2) as prixGlob
from LesTickets
join LesTicketsView
using (noTic)
group by noDos;
