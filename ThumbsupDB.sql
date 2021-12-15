-- CREATE COMMANDS


CREATE DATABASE ThumbsUpDB;

USE ThumbsUpDB;
-- Creating Table Person
CREATE TABLE `Person` (
  `personId` int(10),
  `firstName` varchar(50),
  `lastName` varchar(50),
  `sex` varchar(10),
  `dob` DATE,
  `address` varchar(100),
  `city` varchar(20),
  `state` varchar(20),
  `country` varchar(20),
  `ssn` bigint(10),
  `emailID` varchar(20),
  `phone` bigint(10),
  PRIMARY KEY (`personId`)
);

-- Creating Table Application

CREATE TABLE `Application` (
  `applicationId` int(10),
  `personID` int(10),
  `requestId` int(10),
  `applicationDate` date,
  `gunLicenseNumber` int (10),
  `docId` varchar(10),
  `docDate` date,
  PRIMARY KEY (`applicationId`));


-- Adding Foreign Key to Application Table
ALTER TABLE `Application`
 ADD CONSTRAINT FK_person_ID FOREIGN KEY (personId) REFERENCES Person(personId);
ALTER TABLE `Application`
 ADD CONSTRAINT FK_request_ID FOREIGN KEY (requestId) REFERENCES ApplicationType(requestId);

ALTER TABLE `Application`
 ADD CONSTRAINT FK_gunLicenseNo FOREIGN KEY (gunLicenseNumber) REFERENCES GunLicenseDetails(gunLicenseNumber);
ALTER TABLE `Application`
 ADD CONSTRAINT FK_docID FOREIGN KEY (docId) REFERENCES ProofOfResidency(docId);

-- Creating Table ApplicationType

CREATE TABLE `ApplicationType` (
  `requestId` int(10),
  `requestType` varchar(20),
  `fees` int(20),
  PRIMARY KEY (`requestId`)
);

-- Creating Table GunLicenseDetails

CREATE TABLE `GunLicenseDetails` (
  `gunLicenseNumber` int(10),
  `gunLicenceIssueDate` date,
  `gunLicenseExpiryDate` date,
  `serviceCode` int(10),
  PRIMARY KEY (`gunLicenseNumber`)
);

-- Creating Table ProofOfResidency

CREATE TABLE `ProofOfResidency`(
  `docId` varchar(10),
  `docName` varchar(20),
  PRIMARY KEY (`docId`)
);

-- Creating Table Applicant
CREATE TABLE `Applicant` (
  `applicantID` int(10),
  `applicationId` int(10),
  `drivingLicsense` VARCHAR(100),
  `stateID` varchar(100),
  `identificationTypeId` varchar(20),
  PRIMARY KEY (`applicantID`)
);

-- Adding Foreign Key to Applicant Table

ALTER TABLE `Applicant`
 ADD CONSTRAINT FK_applicationID FOREIGN KEY (applicationId) REFERENCES Application(applicationId);

 ALTER TABLE `Applicant`
 ADD CONSTRAINT FK_ID_Type FOREIGN KEY (identificationTypeId) REFERENCES IndentificationType(identificationTypeId);

 CREATE TABLE `IndentificationType` (
  `identificationTypeId` varchar(10),
  `indetificationType` varchar(100),
  PRIMARY KEY (`identificationTypeId`)
);

-- Creating Table Appointment

CREATE TABLE `Appointment` (
  `appointmentId` int(10),
  `applicantId` int(10),
  `appointmentDate` date,
  `appointmentTime` time,
  `statusID` int(10),
  `serviceCode` int(10),
  PRIMARY KEY (`appointmentId`)
);

-- Adding Foreign Key to Applicant Table

ALTER TABLE `Appointment`
ADD CONSTRAINT FK_applicant_ID FOREIGN KEY (applicantId) REFERENCES Applicant(applicantId);


ALTER TABLE `Appointment`
ADD CONSTRAINT FK_service_code FOREIGN KEY (serviceCode) REFERENCES ServiceLocation (serviceCode);

ALTER TABLE `Appointment`
ADD CONSTRAINT FK_status_ID FOREIGN KEY (statusId) REFERENCES AppointmentStatus (statusId);

-- Creating Table AppointmentStatus

CREATE TABLE `AppointmentStatus` (
  `statusId` int(10),
  `status` int(10),
  `penalty` int(10),
  PRIMARY KEY (`statusId`)
);

-- Creating Table ServiceLocation

CREATE TABLE `ServiceLocation` (
  `serviceCode` int(10),
  `locationAddress` varchar(10),
  `locationPhone` varchar(10),
  `taxId` varchar(10),
  PRIMARY KEY (`serviceCode`)
);

-- Creating Table Payment

CREATE TABLE `Payment` (
  `paymentId` int(10),
  `paymentDate` date,
  `paymentAmount` decimal(5,2),
  `transactionId` int(10),
  `bankId` varchar(10),
  `bankAccountNumber` varchar(20),
  `applicantId` int(10),
  PRIMARY KEY (`paymentId`)
);

-- Adding Foreign Key to Payment Table


ALTER TABLE `Payment`
ADD CONSTRAINT FK_transaction_ID FOREIGN KEY (transactionId) REFERENCES Transaction (transactionId);

ALTER TABLE `Payment`
ADD CONSTRAINT FK_bank_ID FOREIGN KEY (bankId) REFERENCES Bank (bankId);

ALTER TABLE `Payment`
ADD CONSTRAINT FK_applicant_ID2 FOREIGN KEY (applicantId) REFERENCES applicant (applicantId);


-- Creating Table Transaction


CREATE TABLE `Transaction` (
  `transactionId` int(10),
  `receiptNumber` int(10),
  PRIMARY KEY (`transactionId`)
);



-- Creating Table Bank

CREATE TABLE `Bank` (
  `bankId` varchar(10),
  `bankName` varchar(10),
  PRIMARY KEY (`bankId`)
);



-- Creating Table Verification

CREATE TABLE `Verification` (
  `verificationId` int(10),
  `serviceCode` int(10),
  `criminalVerificationStatus` boolean,
  `documentVerificationStatus` boolean,
  `verificationDate` date,
  PRIMARY KEY (`verificationId`)
);

-- Adding Foreign Key to Verification Table

ALTER TABLE `Verification`
ADD CONSTRAINT FK_service_code2 FOREIGN KEY (serviceCode) REFERENCES servicelocation (serviceCode);

-- Creating Table BiometricData

Create TABLE `BiometricData` (
  `biometricId` int(20),
  `f_Id` varchar(10),
  `p_Id` varchar(10),
  `verificationId` int(10),
  PRIMARY KEY (`biometricId`)
);


-- Adding Foreign Key to BiometricData Table

ALTER TABLE `BiometricData`
ADD CONSTRAINT FK_verification2 FOREIGN KEY (verificationId) REFERENCES Verification (verificationId);
ALTER TABLE `BiometricData`
ADD CONSTRAINT FK_FingerPrint FOREIGN KEY (f_Id) REFERENCES Fingerprint (f_Id);

ALTER TABLE `BiometricData`
ADD CONSTRAINT FK_Photo FOREIGN KEY (p_Id) REFERENCES Photo (p_Id);

-- Creating Table Fingerprint

CREATE TABLE `Fingerprint` (
  `f_Id` varchar(10),
  `thumb1` varchar(1000),
  `thumb2` varchar(1000),
  PRIMARY KEY (`f_Id`)
);

-- Creating Table Photo

CREATE TABLE `Photo` (
  `p_ID` varchar(10),
  `photo` varchar(1000),
  PRIMARY KEY (`p_ID`)
);



-- INSERT COMMANDS



--PERSON TABLE VALUES INSERTED
insert into person values ('1','John', 'Doe', 'M','1995-03-14','Phase 1Apt #21 , Google street','Dallas','Texas','United States','7483947583','abc@gmail.com','7823468723'); 

insert into person values ('2','Smith', 'Warne', 'M','1984-06-12','Phase 2 Apt #55, IBM lane','Boston','Massachusetts','United States','6373936933','bcd@gmail.com','6382936393'); 
insert into person values ('3','David', 'Armstrong', 'M','2000-01-01','7777 Fake street','Mumbai','Maharashtra','India','7403749373','sss@gmail.com','3638363873'); 
insert into person values ('4','Ileana', 'Dcruz', 'F','1989-02-03','6489 Test Street','Houston','Texas','United States','9385749329','aaa@gmail.com','4387293738'); 
insert into person values ('5','Matthew', 'Mccallum', 'M','1999-03-04','3692 High Blvd','Pune','Maharashtra','India','4795930375','def@gmail.com','5938362932'); 
insert into person values ('6','Santosh', 'Shettar', 'M','1995-03-06','2398 Chicken Street','Bengaluru','Karnataka','India','7539302834','fgh@gmail.com','8373833835'); 
insert into person values ('7','Virat', 'Kohli', 'M','1990-08-01','8349 Tandoori Lane','New York','New York','United States','3203947639','hty@gmail.com','7382638393'); 
insert into person values ('8','Cristiano', 'Ronaldo', 'M','1980-07-02','5373 JD Avenue','Austin','Texas','United States','4947473930','ert@gmail.com','6383829364'); 
insert into person values ('9','Maria', 'Sharapova', 'F','1975-03-05','4629 Cricket Street','Seattle','California','United States','4894726393','lio@yahoo.com','3788339920'); 
insert into person values ('10','David', 'Beckham', 'M','1992-09-09','2948 Coca Lane','Richardson','Texas','United States','2937494047','woeo@gmail.com','8203464640'); 

insert into person values ('11','Captain', 'America', 'M','1995-03-14','Phase 1Apt #21 , Google street','Dallas','Texas','United States','1235353737','ca@gmail.com','1132422343'); 
insert into person values ('12','Doctor', 'Strange', 'M','1984-06-12','Phase 2 Apt #55, IBM lane','Boston','Massachusetts','United States','2463637322','ds@gmail.com','2243424336'); 
insert into person values ('13','Tony ', 'Stark', 'M','2000-01-01','7777 Fake street','Mumbai','Maharashtra','India','2534546345','ts@gmail.com','3353245432'); 
insert into person values ('14','Bruce', 'Wayne', 'M','1989-02-03','6489 Test Street','Houston','Texas','United States','5324234249','bw@gmail.com','4423523528'); 
insert into person values ('15','Wonder', 'Women', 'F','1999-03-04','3692 High Blvd','Pune','Maharashtra','India','5121424254','ww@gfail.cof','5523475438'); 
insert into person values ('16','Captain', 'Marvel', 'F','1995-03-06','2398 Chicken Street','Bengaluru','Karnataka','India','54124235436','cm@gfail.cof','3242424247'); 
insert into person values ('17','Harry', 'Potter', 'M','1990-08-01','8349 Tandoori Lane','New York','New York','United States','55214343654','hp@gmail.com','872354325'); 
insert into person values ('18','John', 'Wick', 'M','1980-07-02','5373 JD Avenue','Austin','Texas','United States','11111112138','jw@gmail.com','333336453'); 
insert into person values ('19','Tejas', 'Menon', 'M','1975-03-05','4629 Cricket Street','Seattle','California','United States','11231432654','tm@gmail.com','444442343'); 
insert into person values ('20','James', 'Hetfield', 'M','1992-09-09','2948 Coca Lane','Richardson','Texas','United States','99993242343','jh@gmail.com','666666232'); 

SELECT *
from person;

-- Applicationtype table values insert

insert into applicationtype values ('1','New', '50'); 
insert into applicationtype values ('2','Renew', '20'); 

-- ProofofResidency TABLE VALUES INSERTED

insert into proofofresidency values ('1','InternetBill'); 
insert into proofofresidency values ('2','GasBill'); 

insert into proofofresidency values ('3','ElectrcityBill'); 

SELECT *
from proofofresidency;

-- Gunlicensedetails Table Values Inserted

insert into gunlicensedetails values ('63847393','2021-02-04', '2023-02-04', '555'); 
insert into gunlicensedetails values ('37493748','2021-04-06', '2023-04-06', '666'); 
insert into gunlicensedetails values ('94738573','2021-05-08', '2023-05-08', '444'); 
insert into gunlicensedetails values ('53848463','2021-06-09', '2023-06-09', '333'); 
insert into gunlicensedetails values ('23223444','2021-01-03', '2023-01-03', '999'); 
insert into gunlicensedetails values ('87232382','2021-03-05', '2023-03-05', '888'); 
insert into gunlicensedetails values ('99933738','2021-04-07', '2023-04-07', '111'); 
insert into gunlicensedetails values ('39740204','2021-04-04', '2023-04-04', '222'); 
insert into gunlicensedetails values ('28292932','2021-06-07', '2023-06-07', '123'); 
insert into gunlicensedetails values ('48493233','2020-11-12', '2022-11-12', '456'); 


insert into gunlicensedetails values ('82382432','2022-04-03', '2024-04-03', '456'); 
insert into gunlicensedetails values ('4558824','2022-01-02', '2024-01-02', '444'); 





SELECT *
from gunlicensedetails;

--APPLICATION TABLE VALUES INSERTED

insert into application values ('987','1', '1', '2021-01-02', NULL , '1', '2021-01-30'); 
insert into application values ('876','2', '2', '2021-02-03', '63847393', '2','2021-02-28'); 
insert into application values ('765','3', '1', '2021-03-04', NULL, '1', '2021-03-30'); 
insert into application values ('654','4', '2', '2021-04-05', '37493748', '3', '2021-04-30'); 
insert into application values ('565','5', '1', '2021-04-06', NULL, '3', '2021-05-30'); 
insert into application values ('373','6', '2', '2021-05-07', '94738573', '2', '2021-05-30'); 
insert into application values ('393','7', '2', '2021-06-08', '53848463', '2', '2021-05-30'); 
insert into application values ('787','8', '1', '2021-04-03', NULL, '1', '2021-01-30'); 
insert into application values ('432','9', '1', '2021-06-06', NULL, '2', '2021-05-30'); 
insert into application values ('889','10', '1', '2020-11-11', NULL, '1', '2020-10-30'); 



insert into application values ('123','5', '2', '2022-01-02', '4558824', '1', '2022-01-30'); 
insert into application values ('128','6', '2', '2022-02-03', '94738573', '2', '2022-02-28'); 
insert into application values ('124','7', '2', '2022-03-04', '53848463', '1', '2022-03-30'); 
insert into application values ('129','6', '2', '2022-04-05', '94738573', '3', '2022-04-30'); 
insert into application values ('121','5', '2', '2022-04-06', '4558824', '3', '2022-05-30'); 
insert into application values ('120','4', '2', '2022-05-07', '37493748', '2', '2022-05-30'); 
insert into application values ('544','4', '2', '2022-06-08', '37493748', '2', '2022-05-30'); 
insert into application values ('655','3', '2', '2022-04-03', '82382432', '1', '2022-01-30'); 







SELECT *
from application;


-- Verification table values instered

insert into verification values ('193','555', TRUE, FALSE, '2021-01-03'); 
insert into verification values ('293','666', FALSE, TRUE, '2021-02-04'); 
insert into verification values ('393','444', TRUE, TRUE, '2021-03-05'); 
insert into verification values ('493','333', FALSE, FALSE, '2021-04-06'); 
insert into verification values ('494','999', TRUE, TRUE, '2021-04-07'); 
insert into verification values ('649','888', TRUE, FALSE, '2021-05-08'); 
insert into verification values ('656','111', TRUE, TRUE, '2021-06-09'); 
insert into verification values ('746','222', TRUE, FALSE, '2021-04-04'); 
insert into verification values ('934','123', FALSE, TRUE, '2021-06-07'); 
insert into verification values ('948','456', FALSE, TRUE, '2020-11-12'); 



-- BiometricData Table Values inserted


insert into biometricdata values ('1', 1, 'P1', '193'); 
insert into biometricdata values ('2', 2, 'P2', '393'); 
insert into biometricdata values ('3', 3, 'P3', '494'); 
insert into biometricdata values ('4', 4, 'P4', '656'); 
insert into biometricdata values ('5', 5, 'P5', '934'); 




-- IndentificationType Table Values inserted


insert into indentificationtype  values ('1','StateID'); 
insert into indentificationtype  values ('2','Driving License'); 





-- Applicant Table Values inserted


insert into applicant  values ('1','654','87637860000','48634300000','1'); 
insert into applicant  values ('2','565','78324000000','8347300000','1'); 
insert into applicant  values ('3','373','38264200000','34834800000','2'); 
insert into applicant  values ('4','765','22334400000','32348243343','1'); 
insert into applicant  values ('5','393','23487200000','28347800000','2'); 
insert into applicant  values ('6','787','37654900000','72448500000','2'); 
insert into applicant  values ('7','876','98374300000','23749300000','1'); 



-- AppointmentStatus Table Values inserted
insert into appointmentStatus  values ('1','Completed',NULL); 
insert into appointmentStatus  values ('2','No Show','25'); 



-- Appointment table values inserted

insert into appointment values ('10', '1', '2021-01-03', '10:00' , '1', '333'); 
insert into appointment values ('20', '2', '2021-02-04', '11:00' , '1', '999'); 
insert into appointment values ('29', '3', '2021-03-05', '11:00' , '2', '888'); 
insert into appointment values ('30', '4', '2021-04-06', '14:30' , '1', '111'); 
insert into appointment values ('37', '5', '2021-04-07', '15:00' , '2', '222'); 
insert into appointment values ('40', '6', '2021-05-08', '12:00' , '2', '333'); 
insert into appointment values ('45', '7', '2021-06-09', '09:00' , '1', '999'); 
insert into appointment values ('50', '7', '2021-04-04', '09:30' , '1', '888'); 
insert into appointment values ('60', '4', '2021-06-07', '11:30' , '1', '111'); 
insert into appointment values ('88', '2', '2020-11-12', '13:00' , '2', '222'); 


SELECT *
from appointment;

-- JOIN QUERIES

-- Inner Join, Person details who have filled the application for Gunlicense renewal
SELECT person.personId, application.gunLicenseNumber, person.firstName, person.lastName, person.ssn, application.requestID
FROM application
INNER JOIN person ON application.personId = person.personId
ORDER BY person.personId;



SELECT application.gunLicenseNumber, person.firstName, person.lastName, person.ssn, application.requestID
FROM application
INNER JOIN person ON application.personId = person.personId
WHERE requestId = 1;


-- Full JOIN

SELECT person.personId, person.firstName, person.lastName, application.personID, application.gunLicenseNumber
FROM person
LEFT JOIN application 
ON person.personID = application.personID
UNION
SELECT person.personId, person.firstName, person.lastName, application.personID, application.gunLicenseNumber
FROM person
RIGHT JOIN application 
ON person.personID = application.personID;



/* Left Outer JOIN, Persons who has not filled an application yet (does NOT have gun license yet)
and just made an account in the system

*/
SELECT person.personId As PersonPersonID, application.personID AS ApplicationPersonID, person.firstName, person.lastName, application.gunLicenseNumber
FROM person
LEFT JOIN application 
ON person.personID = application.personID
Where application.personID IS NULL;


/* Right Outer JOIN, Persons details who have filled an application for renewal
*/

SELECT person.personId As PersonPersonID, application.personID AS ApplicationPersonID, person.firstName, person.lastName, application.gunLicenseNumber, application.requestID, applicationtype.requestType
FROM person
RIGHT JOIN application 
ON person.personID = application.personID
JOIN applicationtype
ON application.requestId = applicationtype.requestId
WHERE application.requestId = 2;





-- Addresses of the persons and servicelocations available for verification process


SELECT address
FROM person
UNION
SELECT locationaddress FROM servicelocation;






-- Alternative for INTERSECT clause, as INTERSECT does not work in MySQL
SELECT DISTINCT serviceCode
from servicelocation
where serviceCode in (SELECT serviceCode from appointment);






-- Alternative for EXCEPT clause, as EXCEPT does not work in MySQL


SELECT DISTINCT serviceCode
from servicelocation
where serviceCode not in (SELECT serviceCode from appointment);



