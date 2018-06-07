DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees
(
	 EmployeeID		int                     NOT NULL,
	 FirstName		varchar(25)				NOT NULL,
	 LastName		varchar(25)				NOT NULL,

			CONSTRAINT PK_Employees
				PRIMARY KEY (EmployeeID)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName)
	VALUES (1,'Iman', 'Owner'),
		   (2,'Bob', 'Marley'),
		   (3,'Ringo', 'Star');


DROP TABLE IF EXISTS PetServices;

CREATE TABLE PetServices
(
	 ServiceID				int             		NOT NULL,
	 ShortDescription		varchar(25)				NOT NULL,
	 LongDescription		text					NOT NULL,
	 AvgCompletionTime		time					NOT NULL,

			CONSTRAINT PK_PetServices
				PRIMARY KEY (ServiceID)
);

INSERT INTO PetServices (ServiceID, ShortDescription, LongDescription, AvgCompletionTime)
	VALUES (1,'Fast Bath Service', 'This service provides a quick wash of your pet with our own herbal shampoos guaranteed to 
			have your pet looking and feeling great.  Your pet will be hand dryed and their coat brushed out and returned with a smile
			and a bow around their neck.', '00:45:00'),
		   (2,'Super Star Groom', 'This service includes our Fast Bath Service and also includes a specialized de-shedding technique,
			nail clipping and rounding, herbal conditioner, special tail grooming and teeth cleaning.', '02:00:00'),
		   (3,'Stellar Day Spa', 'This service includes all the features of our Super Star Groom and also includes an entire day of 
		    pampered pet services.  We will dedicate one of our pet specialists to your pet to spend the entire day grooming, playing,
			and even napping with your pet.  This service is for those who are truly dedicated to their pet''s quality of life', 
			'08:00:00');
			

DROP TABLE IF EXISTS Appointments;

CREATE TABLE Appointments
(
	 AppointmentID			int     AUTO_INCREMENT  NOT NULL,
	 ServiceID				int						NOT NULL,
	 CustomerFName			varchar(25)				NOT NULL,
	 CustomerLName			varchar(25)				NOT NULL,
	 CustomerStreet			varchar(35)				NOT NULL,
	 CustomerCity			varchar(25)				NOT NULL,
	 CustomerState			varchar(5)				NOT NULL,
	 CustomerZip			int						NOT NULL,
	 CustomerPhone			varchar(15)				NOT NULL,
	 CustomerEmail			varchar(45)				NOT NULL,
	 AppointmentDate		date					NOT NULL,
	 AppointmentTime		time					NOT NULL,
	 CustomerPetName		varchar(25)				NOT NULL,
	 CustomerPetBreed		varchar(25)				NOT NULL,

		CONSTRAINT PK_Appointments
		  PRIMARY KEY (AppointmentID),
		  FOREIGN KEY (ServiceID)
			REFERENCES PetServices(ServiceID)
);


DROP TABLE IF EXISTS EmployeeSchedules;

CREATE TABLE EmployeeSchedules
(

	ScheduleID				int            		NOT NULL,
	AppointmentID			int						NULL,
	ServiceID				int						NULL,
	EmployeeID				int						NOT NULL,

		CONSTRAINT PK_EmployeeSchedules
		  PRIMARY KEY (ScheduleID),
		  FOREIGN KEY (AppointmentID)
			REFERENCES Appointments(AppointmentID),
		  FOREIGN KEY (ServiceID)
			REFERENCES PetServices(ServiceID),
		  FOREIGN KEY (EmployeeID)
			REFERENCES Employees(EmployeeID)

);

