CREATE DATABASE TOURNAMENTS_CA_Shaahriar;
GO
CREATE SCHEMA TOURNAMENTS_CA_Shahriar1
GO

CREATE TABLE TOURNAMENTS_CA_Shahriar1.Registration
(
	TournamentId int CONSTRAINT pkregistration PRIMARY KEY Identity(1,1),
	ParticipantID int,
	PaymentId int,
	AmountPaid money,
	PaymentDate Date,
	RegistrationCost money, 
	RegistrationCloseDate date,
	
);

CREATE TABLE TOURNAMENTS_CA_Shahriar1.participants
(	participantId int CONSTRAINT pkparticipants PRIMARY KEY IDENTITY (1,1),
	Participantname varchar(20),
	participantaddresslline1 varchar(20),
	participantaddresslline2 varchar(20),
	postcode varchar(10),
	paarticipantsDateOfBirth Date
);

Create TABLE TOURNAMENTS_CA_Shahriar1.tournament
( 
	TournamentId int ,
	TournamentName varchar (20),
	TournamentDescription varchar (100),
	Sporttype varchar(20)
	
);
