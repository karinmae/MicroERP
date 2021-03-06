USE MircoERP;


DROP TABLE Rechnungszeile;
DROP Table Rechnungen;
CREATE TABLE Rechnungen
(
	ID_Rechnungen INT IDENTITY NOT NULL PRIMARY KEY,
	FK_Person INT,
	Datum date, 
	Faelligkeit date,
	Rechnungsnummer INT,
	Kommentar varchar(100),
	Nachricht varchar(100),
	FOREIGN KEY (FK_Person) REFERENCES Person (ID_Person)
);


CREATE TABLE Rechnungszeile
(
	ID_RZeile INT IDENTITY NOT NULL PRIMARY KEY,
	FK_Rechnungen INT,
	Artikelname varchar(50),
	Menge INT,
	Ust INT,
	Preis INT,
	FOREIGN KEY (FK_Rechnungen) REFERENCES Rechnungen (ID_Rechnungen)
);

CREATE TABLE Kontakte
(
	ID_Kontakte INT IDENTITY NOT NULL PRIMARY KEY,
	Adresse varchar(50),
	Rechnungsadresse varchar(50),
	Lieferadresse varchar(50)	
);

CREATE TABLE Person
(
	ID_Person INT IDENTITY NOT NULL PRIMARY KEY,
	FK_Kontakte INT,
	FK_FIRMA INT,
	Titel varchar(10),
	Vorname varchar(30),
	Nachname varchar(30),
	Suffix varchar(10),
	Geburtsdatum date,
	FOREIGN KEY (FK_Kontakte) REFERENCES Kontakte (ID_Kontakte),
	FOREIGN KEY (FK_Firma) REFERENCES Firma (ID_Firma)
	
);

CREATE TABLE Firma
(
	ID_Firma INT IDENTITY NOT NULL PRIMARY KEY,
	FK_Kontakte INT,
	Name varchar(30),
	UID varchar(30),
	FOREIGN KEY (FK_Kontakte) REFERENCES Kontakte (ID_Kontakte)
	
);



