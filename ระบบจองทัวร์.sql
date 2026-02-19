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
