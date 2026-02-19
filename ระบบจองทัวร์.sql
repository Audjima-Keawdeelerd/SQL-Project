CREATE DATABASE GoTravelDB;
USE GoTravelDB;

CREATE TABLE IF NOT EXISTS Nationality 
(
     NationalityID CHAR(15) NOT NULL,
     Nationality TEXT NOT NULL,
     PRIMARY KEY(NationalityID)
);

CREATE TABLE IF NOT EXISTS Customer
(
     CustomerID CHAR(15) NOT NULL,
     FirstName TEXT NOT NULL,
     LastName TEXT NOT NULL,
     Gender TEXT NOT NULL,
     DateOfBirth DATE NOT NULL,
     Email TEXT NOT NULL,
     Phone INTEGER NOT NULL,
     Address TEXT NOT NULL,
     NationalityID CHAR(15) NOT NULL,
     PRIMARY KEY(CustomerID)
);

CREATE TABLE IF NOT EXISTS Booking
(
     BookingID CHAR(15) NOT NULL,
     BookingDate DATE NOT NULL,
     NumberOfSeat INTEGER NOT NULL,
     Status TEXT NOT NULL,
     AdminID CHAR(15) NOT NULL,
     CustomerID CHAR(15) NOT NULL,
     PackageID CHAR(15) NOT NULL,
     CodeID CHAR(15) NOT NULL,
     PRIMARY KEY(BookingID)
);

CREATE TABLE IF NOT EXISTS DiscountCodes
(
     CodeID CHAR(15) NOT NULL,
     DiscountCode TEXT NOT NULL,
     DiscountAmount INTEGER NOT NULL,
     DiscountPercentage INTEGER NOT NULL,
     StartDate DATE NOT NULL,
     EndDate DATE NOT NULL,
     UsageLimit INTEGER NOT NULL,
     TimeUsed INTEGER NOT NULL,
     Conditions TEXT NOT NULL,
     PRIMARY KEY(CodeID)
);

CREATE TABLE IF NOT EXISTS Payment
(
     PaymentID CHAR(15) NOT NULL,
     PaymentDate DATE NOT NULL,
     AmountPaid INTEGER NOT NULL,
     PaymentMethod TEXT NOT NULL,
     PaymentStatus TEXT NOT NULL,
     CodeID CHAR(15) NOT NULL,
     PRIMARY KEY(PaymentID)
);

CREATE TABLE IF NOT EXISTS Admin
(
     AdminID CHAR(15) NOT NULL,
     Username TEXT NOT NULL,
     Password VARCHAR(50) NOT NULL,
     PRIMARY KEY(AdminID)
);

CREATE TABLE IF NOT EXISTS Review
(
     ReviewID CHAR(15) NOT NULL,
     Rating INTEGER NOT NULL,
     Comment TEXT NOT NULL,
     ReviewDate DATE NOT NULL,
     CustomerID CHAR(15) NOT NULL,
     PackageID CHAR(15) NOT NULL,
     PRIMARY KEY(ReviewID)
);

CREATE TABLE IF NOT EXISTS TourPackage 
(
     PackageID CHAR(15) NOT NULL,
     PackageName TEXT NOT NULL,
     PackageDescription TEXT NOT NULL,
     PackagePrice CHAR(15) NOT NULL,
     TotalSeats INTEGER NOT NULL,
     PackageType TEXT NOT NULL,
     LastUpdate DATE NOT NULL,
     StartDateTour DATE NOT NULL,
     EndDateTour DATE NOT NULL,
     GuideID CHAR(15) NOT NULL,
     DriverID CHAR(15) NOT NULL,
     PRIMARY KEY(PackageID)
);
 

CREATE TABLE IF NOT EXISTS TravelItinerary
(
     ItineraryID CHAR(15) NOT NULL,
     DayNumber VARCHAR(15)NOT NULL,
     DepartureTime TIME NOT NULL,
     ArrivalTime TIME NOT NULL,
     ActivityDescription TEXT NOT NULL,
     PackageID CHAR(15) NOT NULL,
     AttractionID CHAR(15) NOT NULL,
     PickupDropID CHAR(15) NOT NULL,
     PRIMARY KEY(ItineraryID)
);

CREATE TABLE IF NOT EXISTS Touristattractions
(
     AttractionID CHAR(15) NOT NULL,
     AttractionName TEXT NOT NULL,
     PickupDropID CHAR(15) NOT NULL,
     ProvinceID CHAR(15) NOT NULL,
     PRIMARY KEY(AttractionID)
);
 
CREATE TABLE IF NOT EXISTS Province
(
     ProvinceID CHAR(15) NOT NULL,
     NameProvince TEXT NOT NULL,
     Provinceabbreviation TEXT NOT NULL,
     PRIMARY KEY(ProvinceID)
);

CREATE TABLE IF NOT EXISTS PickupDrop
(
     PickupDropID CHAR(15) NOT NULL,
     PickupLocation TEXT NOT NULL,
     DropOfLocation TEXT NOT NULL,
     PRIMARY KEY(PickupDropID)
);

CREATE TABLE IF NOT EXISTS TourDriverList
(
     SubstituteDriverID CHAR(15) NOT NULL,
     DriverID CHAR(15) NOT NULL,
     PackageID CHAR(15) NOT NULL,
     PRIMARY KEY(SubstituteDriverID)
);

CREATE TABLE IF NOT EXISTS Driver
(
     DriverID CHAR(15) NOT NULL,
     DriverName TEXT NOT NULL,
     DriverLicense TEXT NOT NULL,
     TypeOfCar TEXT NOT NULL,
     LicensePlate TEXT NOT NULL,
     PRIMARY KEY(DriverID)
);

CREATE TABLE IF NOT EXISTS TourGuideList
(
     SubstituteGuideID CHAR(15) NOT NULL,
     GuideID CHAR(15) NOT NULL,
     PackageID CHAR(15) NOT NULL,
     PRIMARY KEY(SubstituteGuideID)
); 

CREATE TABLE IF NOT EXISTS Guide
(
     GuideID CHAR(15) NOT NULL,
     GuideName TEXT NOT NULL,
     GuideLastName TEXT NOT NULL,
     EmailGuide TEXT NOT NULL,
     GuidePhoneNumber CHAR(15) NOT NULL,
     PRIMARY KEY(GuideID)
);

--เพิ่มข้อมูล--
--ตารางAdmin
INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin01', 'NattawutSuwan', 'N@tt@wut2024');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin10', 'AnanyaJirasuk', 'An@nya9876!');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin03', 'ChaiwatSrisuk', 'Ch@1wat@2024');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin16', 'ChutimaWongnawit', 'Ch!tim@2020');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin04', 'KanyaRattanakosin', 'K@nya1234!');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin17', 'KittipongNang', 'K!tt1p0ng567');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin18', 'NatchaThippharat', 'N@tch@T!p2023');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin14', 'NatthakarnLertchou', 'N@tth@karn2024');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin12', 'NutthawutKamol', 'Nutt@wut123');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin20', 'PattharinJittikoon', 'P@tth@r!n345');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin13', 'PhatcharaPongpan', 'Ph@tch@ra567');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin02', 'PiyadaPhomthong', 'P!y@da789');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin07', 'PornchaiManee', 'P0rncha1!2020');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin11', 'PreechaThongchai', 'Pr33ch@2021');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin06', 'SiritornKongrat', 'S!r1torn2023');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin05', 'SomchaiChaiyapin', 'S0mcha1@567');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin08', 'SupitchaSangthong', 'Sup!tch@789');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin19', 'SuwannasriSaengsuk', 'Sw@nn@2022!');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin09', 'ThanakornSuprapan', 'Th@nakorn1234');

INSERT INTO Admin(AdminID, Username, Password)
VALUE ('Admin15', 'WaranyaSukum', 'W@rany@!2024');

--ตารางBooking
INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking02', '2024-02-12', 4, 'S2', 'Admin02', 'C002', 'P02', 'Code02');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking06', '2024-06-16', 2, 'S1', 'Admin06', 'C003', 'P06', 'Code06');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking08', '2024-08-18', 4, 'S1', 'Admin08', 'C004', 'P08', 'Code08');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking13', '2024-01-23', 4, 'S1', 'Admin13', 'C005', 'P13', 'Code13');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking01', '2024-01-11', 2, 'S1', 'Admin01', 'C001', 'P01', 'Code01');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking03', '2024-03-13', 1, 'S3', 'Admin03', 'C002', 'P03', 'Code03');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking07', '2024-07-17', 1, 'S3', 'Admin07', 'C003', 'P07', 'Code07');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking16', '2024-04-26', 2, 'S3', 'Admin16', 'C004', 'P16', 'Code16');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking14', '2024-02-24', 1, 'S2', 'Admin14', 'C005', 'P14', 'Code14');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking19', '2024-07-29', 4, 'S2', 'Admin19', 'C006', 'P19', 'Code19');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking04', '2024-04-14', 3, 'S1', 'Admin04', 'C004', 'P04', 'Code04');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking11', '2024-11-21', 5, 'S2', 'Admin11', 'C005', 'P11', 'Code11');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking09', '2024-09-19', 3, 'S2', 'Admin09', 'C009', 'P09', 'Code09');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking05', '2024-05-15', 5, 'S2', 'Admin05', 'C005', 'P05', 'Code05');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking17', '2024-05-27', 5, 'S2', 'Admin17', 'C006', 'P17', 'Code17');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking20', '2024-08-30', 1, 'S1', 'Admin20', 'C007', 'P20', 'Code20');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking12', '2024-12-22', 2, 'S3', 'Admin12', 'C012', 'P12', 'Code12');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking18', '2024-06-28', 3, 'S1', 'Admin18', 'C013', 'P18', 'Code18');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking15', '2024-03-25', 3, 'S1', 'Admin15', 'C014', 'P15', 'Code15');

INSERT INTO Booking(BookingID, BookingDate, NumberOfSeat, Status, Admin_AdminID, Customer_CustomerID, Tourpackage_PackageID, DiscountCodes_CodeID)
VALUE ('Booking10', '2024-10-20', 2, 'S1', 'Admin10', 'C010', 'P10', 'Code10');

--ตารางCustomer
INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C006', 'Manee', 'Chanchaith', 'F', '1989-04-03', 'manee.chanchaith@gmail.com', 097-890-1234, '789 Phaholyothin Rd Ayutthaya Thailand', 'N12');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C004', 'Sara', 'Wilson', 'F', '1995-03-22', 'sara.wilson@gmail.com', 087-456-7890, '987 Phayathai Rd Bangkok Thailand', 'N06');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C008', 'Chonthicha', 'Srivichai', 'F', '1992-12-10', 'chonthicha.srivichai@gmail.com', 089-678-1234, '890 Sukhumvit Soi 23 Bangkok Thailand', 'N18');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C013', 'Mark', 'Chotisak', 'M', '1983-01-10', 'mark.chotisak@gmail.com', 093-567-8901, '456 Phutthamonthon Rd Nakhon Pathom Thailand', 'N08');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C002', 'Pim', 'Thanya', 'F', '1992-07-12', 'pim.thanya@gmail.com', 091-234-5678, '456 Sukhumvit Rd Bangkok Thailand', 'N02');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C010', 'Napat', 'Sutthiwong', 'M', '1990-02-15', 'napat.sutthiwong@gmail.com', 089-987-6543, '321 Rama IX Rd Chiang Mai Thailand', 'N04');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C018', 'Surachai', 'Wongpanit', 'M', '1979-12-21', 'surachai.wongpanit@gmail.com', 091-456-7890, '234 Patpong Rd Bangkok Thailand', 'N16');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C009', 'Kritika', 'Boonmee', 'F', '1994-09-28', 'kritika.boonmee@gmail.com', 085-123-4567, '456 Petchaburi Rd Bangkok Thailand', 'N20');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C016', 'Ethan', 'Harris', 'M', '1980-05-16', 'ethan.harris@gmail.com', 089-765-4321, '321 Main St San Francisco USA', 'N13');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C012', 'James', 'Moore', 'M', '1987-08-18', 'james.moore@gmail.com', 086-234-5678, '234 Collins St Melbourne Australia', 'N07');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C001', 'John', 'Smith', 'M', '1985-04-25', 'john.smith@gmail.com', 089-123-4567, '123 Main St Springfield IL USA', 'N01');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C019', 'Jack', 'Rodriguez', 'M', '1990-05-25', 'jack.rodriguez@gmail.com', 096-234-5678, '567 Av. Reforma Mexico City Mexico', 'N17');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C014', 'David', 'Anderson', 'M', '1991-06-14', 'david.anderson@gmail.com', 090-876-5432, '890 Broadway New York USA', 'N09');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C003', 'Emily', 'Johnson', 'F', '1988-09-05', 'emily.johnson@gmail.com', 092-345-6789, '789 Maple Ave Toronto Canada', 'N03');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C020', 'Logan', 'Walker', 'M', '1988-01-11', 'logan.walker@gmail.com', 093-234-5678, '123 Park Ave Los Angeles USA', 'N19');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C017', 'Benjamin', 'Lee', 'M', '1986-11-03', 'benjamin.lee@gmail.com', 090-345-6789, '987 Orchard Rd Singapore', 'N15');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C005', 'Alice', 'Pittaya', 'F', '1993-10-20', 'alice.pittaya@gmail.com', 095-123-4567, '123 Ratchaphruek Rd Nonthaburi Thailand', 'N10');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C011', 'William', 'Miller', 'M', '1982-11-30', 'william.miller@gmail.com', 095-678-1234, '654 Oxford St London UK', 'N05');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C015', 'Daniel', 'Jackson', 'M', '1984-12-09', 'daniel.jackson@gmail.com', 088-234-5678, '456 King St Vancouver Canada', 'N11');

INSERT INTO Customer(CustomerID, FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, Nationality_NationalityID)
VALUE ('C007', 'Apinya', 'Sirivathana', 'F', '1996-08-30', 'apinya.sirivathana@gmail.com', 094-567-8901, '654 Silom Rd Bangkok Thailand', 'N14');

--ตารางDiscountCodes
INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code08', 'AUTUMN20', 3600, '20%', '2024-12-01', '2024-12-20', 150, 60, 'Special offer for December');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code01', 'BIRTHDAY10', 2300, '10%', '2024-12-01', '2024-12-31', 100, 15, 'Valid for all bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code14', 'EXTRA25', 3625, '25%', '2024-12-01', '2024-12-10', 50, 35, 'For new bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code11', 'FESTIVE20', 3500, '20%', '2024-12-01', '2024-12-20', 150, 80, 'Only for online bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code12', 'FLASHSALE10', 650, '10%', '2024-12-01', '2024-12-31', 100, 60, 'Limited time offer');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code10', 'HOLIDAY15', 1500, '15%', '2024-12-01', '2024-12-31', 100, 45, 'Valid on all bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code19', 'LASTCHANCE15', 1650, '15%', '2024-12-01', '2024-12-15', 50, 10, 'Discount for early bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code16', 'LOYAL25', 3125, '25%', '2024-12-01', '2024-12-31', 50, 10, 'Available for bookings over $200');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code20', 'MEGASALE10', 1350, '10%', '2024-12-01', '2024-12-31', 50, 15, 'Available for last-minute deals');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code02', 'NEWCUSTOMER15', 2250, '15%', '2024-12-01', '2024-12-15', 50, 20, 'Valid for bookings above 3 seats');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code03', 'NEWMONTH20', 2600, '20%', '2024-12-01', '2024-12-10', 30, 5, 'First-time users only');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code04', 'SPECIAL25', 6250, '25%', '2024-12-01', '2024-12-20', 80, 50, 'Limited to family bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code07', 'SPRING15', 825, '15%', '2024-12-01', '2024-12-15', 60, 25, 'Valid for group bookings');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code05', 'SUMMER25', 2000, '25%', '2024-12-01', '2024-12-15', 200, 75, 'Valid on weekends');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code18', 'SUPERDEAL20', 1300, '20%', '2024-12-01', '2024-12-15', 100, 40, 'Valid for large groups');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code17', 'THANKYOU15', 1425, '15%', '2024-12-01', '2024-12-20', 200, 120, 'Special offer for families');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code15', 'VIP10', 2000, '10%', '2024-12-01', '2024-12-31', 100, 25, 'Valid for group discounts');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code09', 'WEEKEND10', 2000, '10%', '2024-12-05', '2024-12-10', 75, 30, 'Valid for new customers only');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code13', 'WELCOME15', 2100, '15%', '2024-12-01', '2024-12-15', 75, 55, 'Family bookings only');

INSERT INTO DiscountCodes (CodeID, DiscountCode, DiscountAmount, DiscountPercentage, StartDate, EndDate, UsageLimit, TimeUsed, Conditions)
VALUE ('Code06', 'WINTER10', 1000, '10%', '2024-12-01', '2024-12-31', 100, 40, 'Valid for bookings over $500');

--ตารางDriver
INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver09', 'Anuwat Rattanapong', 'D123789456', 'B', '9ขข-7890');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver04', 'Apichat Wongchai', 'D789123456', 'B', '4งง-8765');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver15', 'Boonsong Lertprasert', 'D123456321', 'V', '15ขข-6781');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver19', 'Chaiwat Somsiri', 'D456987321', 'V', '19กจ-6784');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver12', 'Chatree Phanthamit', 'D987123654', 'V', '12กด-2341');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver07', 'Kittipong Namsai', 'D987321654', 'B', '7งซ-1234');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver05', 'Nattapong Boonmee', 'D654321987', 'B', '5กจ-2345');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver18', 'Pakorn Prasertkul', 'D321456987', 'V', '18งจ-2342');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver02', 'Prasit Chatchai', 'D987654321', 'B', '2ขค-5678');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver10', 'Preecha Yodchai', 'D456321789', 'B', '10งด-5432');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver14', 'Sarawut Sangchai', 'D321987654', 'V', '14จก-5433');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver01', 'Somchai Kittisak', 'D123456789', 'B', '1กข-1234');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver17', 'Sompong Ratanasak', 'D654789123', 'V', '17ขข-8907');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver08', 'Somsak Chaisiri', 'D654987123', 'B', '8จข-4567');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver20', 'Supachai Wongkam', 'D987554321', 'V', '20ขก-5431');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver11', 'Suthipong Somchai', 'D789654123', 'V', '11งจ-9876');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver03', 'Thanakorn Srisawat', 'D456789123', 'B', '3ขข-4321');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver16', 'Thawatchai Maneewong', 'D789987123', 'V', '16งค-6543');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver06', 'Wanchai Kerddee', 'D321654987', 'B', '6ขช-6789');

INSERT INTO Driver (DriverID, DriverName, DriverLicense, TypeOfCar, LicensePlate)
Value ('Driver13', 'Weerapong Chaisuk', 'D654321789', 'V', '13ขด-8764');

--ตารางGuide
INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide01', 'Somchai', 'Phonchai', 'somchai.phonchai@email.com', '081-123-4567'); 

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide09', 'Arthit', 'Muangpon', 'arthit.muangpon@email.com','089-901-2345');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide02', 'Arun', 'Suksa', 'arun.suksa@email.com', '082-234-5678');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide10', 'Boonma', 'Inthara', 'boonma.inthara@email.com', '080-012-3456');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide12', 'Chatri', 'Wongpan', 'chatri.wongpan@email.com', '082-234-7654');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide11', 'Duangjai', 'Keaw', 'duangjai.keaw@email.com', '081-123-6543');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide04', 'Jinda', 'Ruangsak', 'jinda.ruangsak@email.com', '084-456-7890');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide14', 'Jirasak', 'Intanon', 'jirasak.intanon@email.com', '084-456-9876');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide03', 'Kanchana', 'Buri', 'kanchana.buri@email.com', '083-345-6789');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide19','Kittipong','Jaree','kittipong.jaree@email.com','089-901-4321');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide06','Malee','Poomjai','malee.poomjai@email.com','086-678-9012');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide17','Nantana','Theerapong','nantana.theerapong@email.com','087-789-2109');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide15','Orathai', 'Phonsri', 'orathai.phonsri@email.com','085-567-0987');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide18','Pranee','Sinchai','pranee.sinchai@email.com','088-890-3210');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide05','Preecha','Narin', 'preecha.narin@email.com','085-567-8901');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide13', 'Saowaluk', 'Sriwan','saowaluk.sriwan@email.com','083-345-8765');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide08','Saranya','Phaisan','saranya.phaisan@email.com','088-890-1234');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide07','Sompop','Saenchai','sompop.saenchai@email.com','087-789-0123');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide20','Thitiphan', 'Wangdee', 'thitiphan.wangdee@email.com','080-012-5432');

INSERT INTO Guide(GuideID, GuideName, GuideLastName, EmailGuide, GuidePhoneNumber)
VALUE('Guide16', 'Yotin', 'Krittanon', 'yotin.krittanon@email.com', '086-678-1098');

--ตารางNationality
INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N01', 'American');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N06', 'American');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N05', 'Australian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N15', 'Brazilian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N04', 'British');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N03', 'Canadian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N12', 'Chinese');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N20', 'Filipino');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N09', 'French');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N10', 'German');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N13', 'Indian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N14', 'Italian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N11', 'Japanese');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N19', 'Malaysian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N08', 'Mexican');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N16', 'Russian');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N07', 'Singaporean');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N17', 'South Korean');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N02', 'Thai');

INSERT INTO Nationality(NationalityID, Nationality)
VALUE ('N18', 'Vietnamese');

--ตารางPayment
INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment7', '2024-11-07', '4,675', 001, 101, 'Code07');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment18', '2024-11-18', '5,200', 001, 101, 'Code18');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment12', '2024-11-12', '5,850', 002, 301, 'Code12');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment5', '2024-11-05', '6,000', 003, 101, 'Code05');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment17', '2024-11-17', '8,075', 003, 101, 'Code17');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment10', '2024-11-10', '8,500', 002, 101, 'Code10');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment6', '2024-11-06', '9,000', 002, 301, 'Code06');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment19', '2024-11-19', '9,350', 003, 201, 'Code19');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment16', '2024-11-16', '9,375', 002, 101, 'Code16');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment3', '2024-11-03', '10,400', 001, 101, 'Code03');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment13', '2024-11-13', '11,900', 003, 101, 'Code13');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment20', '2024-11-20', '12,150', 002, 101, 'Code20');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment2', '2024-11-02', '12,750', 002, 101, 'Code02');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment11', '2024-11-11', '14,000', 001, 101, 'Code011');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment8', '2024-11-08', '14,000', 001, 201, 'Code08');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment9', '2024-11-09', '18,000', 003, 101, 'Code09');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment15', '2024-11-15', '18,000', 001, 101, 'Code15');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment14', '2024-11-14', '18,750', 003, 201, 'Code14');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment4', '2024-11-04', '18,750', 003, 201, 'Code04');

INSERT INTO Payment(PaymentID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus, DiscountCodes_CodeID)
VALUES ('Payment1', '2024-11-01', '20,700', 001, 101, 'Code01');


--ตารางPickupDrop
INSERT INTO PickupDrop(PickupDropID,PickupLocation,DropOffLocation)
VALUE ('PD21', 'Ayothaya Floating Market,Ayutthaya', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation ,DropOffLocation)
VALUE ('PD14', 'Banana Beach,Phuket,or nearby areas', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID,PickupLocation,DropOffLocation)
VALUE ('PD39', 'Banchuen Beach, Koh Chang', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD23', 'Beach party at Haad Rin, Koh Phangan', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD49', 'Bridge on the River Kwai, Kanchanaburi', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD43', 'Chiang Mai city or hotel pick-up', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD44', 'Chiang Mai Zoo or nearby hotels','Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD32', 'Chiang Rai Pier or Chiang Rai Airport', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD57', 'Hat Yai Airport or local transportation hubs', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD58', 'Hat Yai markets and tourist spots', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD09', 'Hotels or locations in Chiang Mai city', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD35', 'Hua Hin Beach or Central Hua Hin area', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD37', 'Koh Chang Pier', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD29', 'Koh Larn Pier or Pattaya Pier', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD22', 'Koh Phangan Pier (Mae Haad Pier)', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD24', 'Koh Phangan pier or accommodations on the island', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD05', 'Koh Samui Pier or Samui Airport', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD40', 'Koh Tao Pier or ferry terminal', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD26', 'Krabi Pier or Krabi Airport', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD27', 'Krabi Pier or pick-up at the boat piers to Phi Phi Islands', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD52', 'Lampang Railway Station or hotels in Lampang', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD59', 'Local markets in Hat Yai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD48', 'Local markets in Pai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD31', 'Louis Tussaud’s Waxworks, Pattaya', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD01', 'Main tourist spot at Khundan Prakanchon Dam, Nakhon Nayok', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD42', 'Mallika City, R.E. 124, Kanchanaburi', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD06', 'Meayai Waterfall on Koh Samui (Starting point from pier or accommodations)', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD41', 'Mueang Sing Historical Park, Kanchanaburi', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD51', 'Museums in Chiang Mai or Kanchanaburi', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD56', 'Nakhon Si Thammarat Old Town', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD12', 'Old Town Phuket, Thalang Road, and local restaurants', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD46', 'Pai town or accommodation areas in Pai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD30', 'Pattaya Floating Market', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD17', 'Pattaya Port or main points in Pattaya', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD03', 'Pha Trom Jai viewpoint at Khao Yai National Park', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD15', 'Phimai Historical Park, Nakhon Ratchasima', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD11', 'Phuket Harbor for yacht cruises', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD13', 'Pick-up at Karon Beach, Phuket', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD10', 'Pick-up at Kata Beach or near Patong Beach, Phuket', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD38', 'Pick-up at the Koh Chang port or key tourist areas', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD34', 'Pick-up at the tourist spots around Doi Mae Salong, Chiang Rai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD36', 'Pick-up from Hua Hin Beach or night markets', 'Night Market Entrance');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD08', 'Pick-up point near Doi Suthep, Chiang Mai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD54', 'Pick-up points in Nakhon Si Thammarat, temples, and local areas', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD25', 'Sairee Beach, Koh Tao, or pick-up at the ferry pier', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD45', 'Scenic viewpoints in Chiang Mai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD50', 'Srinagarindra Dam area, Kanchanaburi', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD07', 'Starting point at Talaynai (Ha Roi Rai) on Koh Samui', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD55', 'Temples in Nakhon Si Thammarat', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD28', 'Viewpoint at Din Daeng Doi, Krabi', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD02', 'Viewpoint at Khao Chong Lom, Nakhon Nayok', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD53', 'Viewpoints in Lampang or natural sightseeing spots', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD47', 'Viewpoints in Pai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD04', 'Vintage Garden cafe and garden in Nakhon Nayok', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD16', 'Wat Luang Pho To, Nakhon Ratchasima', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD19', 'Wat Phra Yai, Pattaya', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD33', 'Wat Rong Khun (White Temple), Chiang Rai', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD20', 'Wat Yai Chai Mongkol, Ayutthaya', 'Hotel or accommodation');

INSERT INTO PickupDrop(PickupDropID, PickupLocation, DropOffLocation)
VALUE ('PD18', 'Water parks in Pattaya, such as Cartoon Network Amazone and Ramayana Water Park', 'Hotel or accommodation');

--ตารางProvince
INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV01','Nakhon Nayok','NYK');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV02','Surat Thani','URT');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV03','Chiang Mai','CNX');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV04','Phuket ','HKT');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV05','Nakhon Ratchasima','NRM');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV06','Chonburi','CBI');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV07','Ayutthaya','AYT');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV08','Nakhon Phanom','NPM');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV09','Krabi ','KBI');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV10','Ubon Ratchathani','UBR');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV11','Chiang Rai','CEI');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV12','Prachuap Khiri Khan','PKK');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV13','Trat','TRT');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV14','Mae Hong Son','MHS');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV15','Kanchanaburi ','KRI');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV16','Lampang ','LPG');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV17','Nakhon Si Thammarat','NST');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV18','Songkhla','SKA');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV19','Bangkok','Bkk');

INSERT INTO Province(ProvinceID,NameProvince,Provinceabbreviation)
VALUE('PV20','Ratchaburi','RCB');

--ตารางReview
INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review04', 5, 'Amazing trip, loved the cultural activities!', '2024-11-13', 'C004', 'P04');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review10', 5, 'Best tour I''ve ever been on, everything was perfect!', '2024-11-19', 'C010', 'P10');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review14', 2, 'Disappointing, the attractions were not as expected.', '2024-11-23', 'C014', 'P14');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review06', 4, 'Enjoyed the tour, but the weather was a bit too hot.', '2024-11-15', 'C006', 'P06');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review01', 5, 'Excellent tour, very informative and well organized!', '2024-11-10', 'C001', 'P01');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review15', 4, 'Fun trip, guide was friendly but the group was too large.', '2024-11-24', 'C015', 'P15');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review02', 4, 'Great experience, but could improve the lunch options.', '2024-11-11', 'C002', 'P02');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review09', 4, 'Great sights, but the transport could have been better.', '2024-11-18', 'C009', 'P09');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review11', 4, 'Great value for money, though the timing was tight.', '2024-11-20', 'C011', 'P11');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review16', 5, 'Had a great time, the itinerary was perfect!', '2024-11-25', 'C016', 'P16');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review13', 3, 'Interesting, but there were a few delays along the way.', '2024-11-22', 'C013', 'P13');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review18', 5, 'Loved the whole experience, will definitely come back.', '2024-11-27', 'C014', 'P18');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review08', 3, 'Nice tour, but the guide was a bit hard to understand.', '2024-11-17', 'C008', 'P08');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review05', 2, 'Not worth the money, felt rushed.', '2024-11-14', 'C005', 'P05');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review17', 3, 'Okay experience, nothing extraordinary.', '2024-11-26', 'C006', 'P17');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review20', 5, 'One of the best tours I''ve been on, would recommend it!', '2024-11-29', 'C007', 'P20');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review12', 5, 'Really enjoyed the local culture and food!', '2024-11-21', 'C012', 'P12');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review03', 3, 'The guide was knowledgeable, but the trip was too short.', '2024-11-12', 'C003', 'P03');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review07', 5, 'Wonderful experience, highly recommend!', '2024-11-16', 'C007', 'P07');

INSERT INTO Review(ReviewID, Rating, Comment, ReviewDate, Customer_CustomerID, TourPackage_PackageID)
VALUES ('Review19', 4, 'Wonderful, but there was a long wait at some points.', '2024-11-28', 'C008', 'P19');

--ตารางTourDriverList
INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE ('PD07', 'P07', 'Driver09');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD15', 'P18', 'Driver04');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD03', 'P03', 'Driver15');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD18', 'P11', 'Driver19');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD11', 'P17', 'Driver12');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD06', 'P20', 'Driver07');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD20', 'P12', 'Driver05');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD02', 'P05', 'Driver18');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD13', 'P01', 'Driver02');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD05', 'P19', 'Driver10');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD08', 'P13', 'Driver14');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD16', 'P10', 'Driver01');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD09', 'P08', 'Driver17');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD14', 'P02', 'Driver08');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD01', 'P14', 'Driver20');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD17', 'P09', 'Driver11');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD10', 'P04', 'Driver03');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD12', 'P15', 'Driver16');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD04', 'P16', 'Driver06');

INSERT INTO TourDriverList (SubstituteDriverID, TourPackage_PackageID, Driver_DriverID)
VALUE('PD19', 'P06', 'Driver13');

--ตารางTourGuideList
INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG05', 'P07', 'Guide01');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG03',	'P18', 'Guide09');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG09', 'P03', 'Guide02');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG10', 'P11', 'Guide10');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG14', 'P17', 'Guide12');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG08', 'P20', 'Guide11');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG20', 'P12', 'Guide04');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG18', 'P05', 'Guide14');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG17',	'P01', 'Guide03');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG06', 'P19', 'Guide19');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG01', 'P13', 'Guide06');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG11',	'P10', 'Guide17');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG02', 'P08', 'Guide15');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG13', 'P02', 'Guide18');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG15', 'P14', 'Guide05');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG19', 'P09', 'Guide13');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG12', 'P04', 'Guide08');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG04', 'P15', 'Guide07');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG07', 'P16', 'Guide20');

INSERT INTO TourGuideList(SubstituteGuideID, PackageID, GuideID)
VALUE('PG16', 'P06', 'Guide16');

--ตารางTouristattractions
INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A02D02',' Meayai Waterfall','PD06','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A02D03','  Talaynai (Ha Roi Rai)','PD07','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A15D01','Arrival at Chiang Mai','PD43','PV03');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A11D01','Arrival at Chiang Rai','PD32','PV11');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A20D01','Arrival at Hat Yai','PD57','PV18');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A12D01','Arrival at Hua Hin','PD35','PV12');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A13D01',' Arrival at Koh Chang,'PD37','PV13');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A10D01',' Arrival at Koh Larn','PD29','PV06');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A08D01',' Arrival at Koh Phangan','PD22','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A02D01',' Arrival at Koh Samui','PD05','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A14D01',' Arrival at Koh Tao','PD40','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A18D01','Arrival at Lampang','PD52','PV16');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A19D01','Arrival at Nakhon Si Thammarat','PD54','PV17');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A16D01',' Arrival at Pai','PD46','PV14');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A06D01','Arrival at Pattaya','PD17','PV06');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A09D01',' Arrival in Krabi','PD26','PV09');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A07D02',' Ayothaya Floating Market','PD21','PV07');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A04D05','Banana Beach','PD14','PV04');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A13D03',' Banchuen Beach','PD39','PV13');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A08D02',' Beach party','PD23','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A04D02',' Blue Water Charter Phuket','PD11','PV04');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A09D03',' Din Daeng Doi','PD28','PV09');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A06D02',' Enjoy water parks','PD18','PV06');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A03D02','Explore Chiang Mai city','PD09','PV03');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A20D02',' Explore local attractions','PD58','PV18');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A13D02','Explore the island','PD38','PV13');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A19D03','Explore the old town','PD56','PV17');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A08D03','Island tour','PD24','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A01D02','Khao Chong Lom','PD02','PV01');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A17D02','Khuean Srinagarindra National Park','PD50','PV15');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A01D01','Khundan Prakanchon Dam','PD01','PV01');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A10D03','Louis Tussaud’s Waxworks','PD31','PV06');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A14D03','Mallika City, R.E. 124','PD42','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A16D03','Market exploration','PD48','PV14');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A15D03','Mountain views','PD45','PV03');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A14D02','Mueang Sing Historical Park','PD41','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A10D02','Pattaya Floating Market','PD30','PV06');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A01D03','Pha Trom Jai','PD03','PV01');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A05D01','Phimai Historical Park','PD15','PV05');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A04D03','Phuket Old Town','PD12','PV04');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A08D04','Sairee beach','PD25','PV02');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A16D02','Scenic views','PD47','PV14');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A18D02','Scenic views and exploration','PD53','PV16');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A12D02','Sunset at the beach, shopping at night market','PD36','PV12');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A01D04','Vintage Garden','PD04','PV01');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A11D03','Visit Doi Mae Salong','PD34','PV11');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A04D04','Visit Karon Beach','PD13','PV04');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A20D03','Visit markets','PD59','PV18');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A17D03','Visit museums','PD51','PV15');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A09D02','Visit Phi Phi Islands','PD27','PV09');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A04D01','Visit Promthep Cape','PD10','PV04');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A19D02','Visit temples','PD55','PV17');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A17D01','Visit the Bridge on the River Kwai','PD49','PV15');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A03D01','Visit Wat Phra That Doi Suthep','PD08','PV03');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A06D03','Visit Wat Phra Yai','PD19','PV06');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A07D01','Visit Wat Yai Chai Mongkol','PD20','PV07');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A11D02','Visit White Temple','PD33','PV11');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A15D02','Visit zoo','PD44','PV03');

INSERT INTO Touristattractions(AttractionID,AttractionName,PickupDrop_PickupDrop,Province_ProvinceID)
VALUE('A05D02','Wat Luang Pho To','PD16','PV05');

--ตารางTourPackage
INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P07', 'Ayutthaya 2 Days 1 Night', 'Visit Wat Yai Chai Mongkol, Ayothaya Floating Market', '5,500', 50, 'GT', '2024-07-11 10:00', '2024-08-23', '2024-08-24', 'Guide07','Driver07');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P18', 'Ban Pa Miang 2 Days 1 Night', 'Arrival at Lampang, Scenic views and exploration', '6,500', 4, 'PT', '2024-06-27 11:00', '05/07/2025', '06/07/2025', 'Guide18','Driver18');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P03', 'Chiang Mai 2 Days 1 Nights', 'Visit Wat Phra That Doi Suthep, Explore Chiang Mai city', '13,000', 30, 'GT', '2024-03-02 12:00', '2024-04-19', '2024-04-21', 'Guide03','Driver03');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P11', 'Doi Mae Salong 3 Days 2 Nights', 'Arrival at Chiang Rai, Visit White Temple, Visit Doi Mae Salong', '17,500', 10, 'PT', '2024-11-20 17:00', '2024-12-25', '2024-12-28','Guide11','Driver11');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P17', 'E-Tong Village 3 Days 2 Nights', 'Visit the Bridge on the River Kwai, Khuean Srinagarindra National Park, Visit museums', '9,500', 6, 'PT', '2024-05-25 13:00', '2025-06-01', '2025-06-02','Guide17','Driver17');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P20', 'Hat Yai 3 Days 2 Nights', 'Arrival at Hat Yai, Explore local attractions, Visit markets', '13,500', 5, 'PT', '2024-08-29 9:30', '2025-09-04', '2025-09-07','Guide20','Driver20');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P12', 'Hua Hin 2 Days 1 Night', 'Arrival at Hua Hin, Sunset at the beach, shopping at night market', '6,500', 5, 'PT', '2024-12-20 12:00',	'2025-01-28', '2025-01-29','Guide12','Driver12');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P05', 'Khao Yai 2 Days 1 Night', 'Phimai Historical Park, Wat Luang Pho To', '8,000', 40, 'GT', '2024-05-10 8:00', '2024-06-20', '2024-06-21','Guide05', 'Driver05');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P01', 'Khundan Prakanchon Dam and Nakhon Nayok 4 Days 3 Nights', 'Khundan Prakanchon Dam, Khao Chong Lom, Pha Trom Jai, Vintage Garden','23,000',20, 'GT', '2024-01-01 6:30','2024-02-15','2024-02-15','Guide01','Driver01');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P19', 'Kiriwong village 3 Days 2 Nights', 'Arrival at Nakhon Si Thammarat, Visit temples, Explore the old town', '11,000',3,'PT','2024-07-28 16:00','2025-08-02', '2025-08-02','Guide19','Driver19');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P13', 'Koh Chang 3 Days 2 Nights', 'Arrival at Koh Chang, Explore the island, Banchuen Beach', '14,000', 2, 'PT', '2024-01-22 9:00','2025-02-26', '2025-02-27','Guide13','Driver13');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P10', 'Koh Larn 3 Days 2 Nights', 'Arrival at Koh Larn, Pattaya Floating Market, Louis Tussaud’s Waxworks', '10,000',30, 'GT','2024-10-04 14:30','2024-11-22', '2024-11-24','Guide10','Driver10');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P08', 'Koh Phangan 4 Days 3 Nights',	'Arrival at Koh Phangan, Beach party, Island tour, Sairee beach','18,000', 40, 'GT', '2024-08-15 16:00', '2024-09-25', '2024-09-29','Guide08','Driver08');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P02', 'Koh Samui 3 Days 2 Nights', 'Arrival at Koh Samui, Meayai Waterfall, Talaynai (Ha Roi Rai)', '15,000',15, 'GT', '2024-02-09 09:00','2024-03-17', '2024-03-20','Guide02','Driver02');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P14', 'Koh Tao 3 Days 2 Nights',	'Arrival at Koh Tao, Mueang Sing Historical Park, Mallika City, R.E. 124','14,500', 4, 'PT', '2024-02-23 10:00', '2025-03-29', '3/2/2025-04-01','Guide14','Driver14');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P09', 'Krabi 3 Days 2 Nights', 'Arrival in Krabi, Visit Phi Phi Islands, Din Daeng Doi','20,000',25, 'GT', '2024-09-08 11:00','2024-10-24', '2024-10-27','Guide09','Driver09');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P04', 'Krating Cape 5 Days 4 Nights',	'Visit Promthep Cape, Blue Water Charter Phuket, Phuket Old Town, Visit Karon Beach, Banana Beach',	'25,000',25, 'GT', '2024-05-04 9:30', '2024-05-18', '2024-05-23','Guide04','Driver04');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P15', 'Mon Jam 3 Days 2 Nights',	'Arrival at Chiang Mai, Visit zoo, Mountain views','20,000',3, 'PT', '2024-03-04 8:30', '2025-04-04', '2025-04-06','Guide15','Driver15');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID, DriverID)
VALUE('P16', 'Pai 3 Days 2 Nights', 'Arrival at Pai, Scenic views, Market exploration', '12,500',2, 'PT','4/25/2024-04-25 14:00','2025-05-02', '2025-05-04', 'Guide16','Driver16');

INSERT INTO TourPackage(PackageID, PackageName, PackageDescription, PackagePrice, TotalSeats, PackageType, LastUpdate, StartDateTour, EndDateTour, GuideID,	DriverID)
VALUE('P06','Pattaya 3 Days 2 Nights','Arrival at Pattaya, Enjoy water parks, Visit Wat Phra Yai','10,000',35,'GT','2024-06-06 13:30','2024-07-21','2024-07-23','Guide06','Driver06');

--ตารางTravelltinerary
INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary32','day 1','06:00:00 ','08:00:00','Admire the beauty of architecture','P11','A11D01','PD32');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary33','day 2','08:00:00',09:30:00','Admire the beauty of art and see modern paintings in the chapel.','P11','A11D02','PD33');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary45','day 3','08:00:00','09:30:00','Climb Doi Suthep to see the view of Chiang Mai City. Explore Doi Inthanon.','P15','A15D03','PD45');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary11','day 2','09:00:00','10:00:00','Cruise on a yacht to see the Andaman Sea, do snorkeling activities and relax on the boat.','P04','A04D02','PD11');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary21','day 2','10:00:00','11:00:00','Eat Thai food from a rowboat and watch Thai art and cultural performances.','P07','A07D02','PD21');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary22','day 1','06:00:00','08:00:00','Enjoy live music, light shows and a lively atmosphere.','P08','A08D01','PD22');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary04','day 4','10:00:00','12:00:00','Enjoy the atmosphere of a vintage coffee shop and garden. Take photos in beautiful corners and relax with a drink.','P01','A01D04','PD04');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary03','day 3','08:00:00','09:00:00','Enjoy the beautiful natural scenery and take photos with the large trees that are the highlight of the place.','P01','A01D03','PD03');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary47','day 2','09:00:00','10:00:00','Enjoy the mountain view and morning mist at Yunlai Viewpoint. Stop at the Tha Pai Historical Bridge.','P16','A16D02','PD47');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary12','day 3','16:00:00','17:30:00','Explore Sino-Portuguese architecture and sample local cuisine in old restaurants.','P04','A04D03','PD12');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary38','day 2','09:00:00','10:00:00','Explore the islands nature, snorkel or scuba dive at Koh Rang.','P13','A13D02','PD38');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary36','day 2','04:00:00','6:00:00','Explore the nature on the island, walk along the beach.','P12','A12D02','PD36');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary02','day 2','08:00:00','09:30:00','Go take photos of the waterfall, stream and mountain views.','P01','A01D02','PD02');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary06','day 2','09:00:00','10:00:00','Hike to see beautiful waterfalls and listen to the sound of flowing water and take pictures in the middle of nature.','P02','A02D02','PD06');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary42','day 3','09:00:00','10:00:00','Learn about the culture of the R.S. 124 era, dress in Thai costumes, take photos, and experience the ancient way of life.','P14','A14D03','PD42');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary49','day 1','08:00:00','09:30:00','Learn about World War II history, walk across bridges and ride the Death Railway.','P17','A17D01','PD49');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary16','day 2','08:00:00','09:30:00','Pay homage to Luang Pho To, a large Buddha statue, and admire the beautiful temple architecture.','P05','A05D02','PD16');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary19','day 3','8:00:00','09:30:00','Pay homage to the large Buddha statue on the hilltop and enjoy the view of Pattaya from above.','P06','A06D03','PD19');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary08','day 1','08:00:00','09:30:00','Pay homage to the sacred relics for good fortune and enjoy the view of Chiang Mai from above','P03','A03D01','PD08');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary18','day 2','09:00:00','10:00:00','Play slides and have fun with water rides at the water park.','P06','A06D02','PD18');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary29','day 1','6:00:00','08:00:00','Relax on the beach, go jet skiing, parasailing or kayak.','P10','A10D01','PD29');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary26','day 1','6:00:00','08:00:00','Relax on the beach, go snorkeling','P09','A09D01','PD26');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary23','day 2','09:00:00','10:00:00','Relax on the beach, go snorkeling and watch the sunset..','P08','A08D02','PD23');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary05','day 1','6:00:00','08:00:00','Relax on the beach, kayak, snorkel.','P02','A02D01','PD05');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary13','day 4','10:00:00','11:00:00','Relax on the beach, ride a jet ski, or go surfing.','P04','A04D04','PD13');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary27','day 2','08:00:00','10:00:00','Relax on the beach, snorkel and see beautiful corals and fish.','P09','A09D02','PD27');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary37','day 1','6:00:00','08:00:00','Scuba diving and snorkeling at Hin Wong Bay','P13','A13D01','PD37');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary40','day 1','6:00:00','08:00:00','Scuba diving and snorkeling at Hin Wong Bay,stroll along Sairee Beach','P14','A14D01','PD40');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary44','day 2','09:00:00','10:00:00','See animals like pandas and seals.','P15','A15D02','PD44');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary30','day 2','09:00:00','10:00:00','Shop for souvenirs, local food and handmade products from 4 regions.','P10','A10D02','PD30');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary39','day 3','09:00:00','10:00:00','Stroll along quiet beaches, visit fishing villages and sample fresh seafood.','P13','A13D03','PD39');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary17','day 1','10:00:00','12:00:00','Stroll along the beach and enjoy water activities.','P06','A06D01','PD17');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary09','day 2','10:00:00','11:00:00','Stroll around the Night Bazaar and sample local food, and visit the temples in the city.','P03','A03D02','PD09');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary01','day 1','08:00:00','09:30:00','Take a boat ride to see nature and take photos with the mountain view and large reservoir.','P01','A01D01','PD01');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary50','day 2','08:00:00','9:30:00','Take a boat trip to see the view of the dam and surrounding nature, and stop by to see Phra That Cave and Erawan Waterfall.','P17','A17D02','PD50');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary14','day 5','10:00:00','12:00:00','Take a walk along the beach, snorkel and see coral reefs and marine life.','P04','A04D05','PD14');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary56','day 3','09:00:00','10:00:00','Take a walk around the old town with its colonial-style houses.','P19','A19D03','PD56');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary31','day 3','09:00:00','10:00:00','View wax figures of important people.','P10','A10D03','PD31');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary58','day 2','9:00:00','10:00:00','Visit Hat Yai Public Park and Phra Phuttha Mongkhon Maharat, take the cable car to see the city view.','P20','A20D02','PD58');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary54','day 1','08:00:00','10:00:00','Visit Nakhon Si Thammarat City','P19','A19D01','PD54');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary24','day 3','09:00:00','10:00:00','Visit nature','P08','A08D03','PD24');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary41','day 2','09:00:00','10:00:00','Visit the ancient Khmer castle in Kanchanaburi Province and study the ancient sites and history.','P14','A14D02','PD41');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary15','day 1','08:00:00','09:30:00','Visit the ancient site','P05','A05D01','PD15');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary43','day 1','08:00:00','10:00:00','Visit the city in Chiang Mai','P15','A15D01','PD43');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary57','day 1','6:00:00','08:00:00','Visit the town in Hat Yai','P20','A20D01','PD57');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary52','day 1','10:00:00','12:00:00','Visit the town in Lampang.','P18','A18D01','PD52');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary46','day 1','10:00:00','12:00:00','Visit the town of Pai','P16','A16D01','PD46');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary51','day 3','09:00:00','10:00:00','Visit the World War II Museum in Kanchanaburi and learn about culture and history through art and antiques.','P17','A17D03','PD51');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary55','day 2','09:00:00','10:00:00','Visit Wat Phra Mahathat Woramahawihan and pay homage to the Phra Borommathat Chedi.','P19','A19D02','PD55');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary53','day 2','09:00:00','10:00:00','Visit Wat Phra That Lampang Luang and Wat Pong Sanuk, and take a horse-drawn carriage ride through the unique old town.','P18','A18D02','PD53');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary59','day 3','09:00:00','10:00:00','Walk around Kim Yong Market and Khlong Hae Floating Market to buy souvenirs and taste local food.','P20','A20D03','PD59');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary48','day 3','09:00:00','10:00:00','Walk around Pai Walking Street Market, shop for handmade products and try local food.','P16','A16D03','PD48');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary20','day 1','08:00:00','09:30:00','Walk around the large pagoda and see the history of the temple.','P07','A07D01','PD20');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary34','day 3','08:00:00','09:30:00','Walk through the tea terraces and learn about tea picking.','P11','A11D03','PD34');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary28','day 3','09:00:00','10:00:00','Watch the sunrise and the sea of ​​mist','P09','A09D03','PD28');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary25','day 4','09:00:00','10:00:00','Watch the sunrise and the sea of ​​mist in the morning.','P08','A08D04','PD25');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary35','day 1','10:00:00','12:00:00','Watch the sunset at Hua Hin Beach, stroll through Hua Hin Night Market','P12','A12D01','PD35');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary10','day 1','09:00:00','10:30:00','Watch the sunset at the most famous viewpoint in Phuket, take a walk and take photos with the sea view.','P04','A04D01','PD10');

INSERT INTO Travelitinerary(ItineraryID,DayNumber,DepartureTime,ArrivalTime,ActivityDescription,TourPackage_PackageID,Touristattraction_AttractionID,Touristattractions_PickupDrop_PickupDropID)
VALUE('Itinerary07','day 3','09:00:00','10:00:00','Watch the sunset in the middle of the sea and capture the nature and lifestyle of the fishermen.','P02','A02D03','PD07');



































