--UC1-Ability to create a Address Book Service DB.
Create Database AddressBook_Service;

--UC2-Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes.
Create Table AddressBook
(ID int identity(1, 1)  PRIMARY KEY,
FirstName varchar(50),
LastName varchar(50),
Address varchar(50),
City varchar(50),
State varchar(50),
Zip int,
PhoneNumber bigint,
EmailId varchar(50));

--UC3-Ability to insert new Contacts to Address Book.
INSERT INTO AddressBook(FirstName, LastName, Address, City, State, Zip, PhoneNumber, EmailID)VALUES
('Ajinkya', 'Shinde', 'Apegaon', 'Ambejogai', 'Maharashtra', 431517, 8806184089, 'shindeaj@gmail.com'),
('Sachin', 'Dhage', 'Dhanora', 'Latur', 'Maharashtra', 433546, 8806184087, 'dhage@gmail.com'),
('Supriya', 'Kadam', 'Tadola', 'Solapur', 'Maharashtra', 411016, 8806184085, 'kadamsupriy@gmail.com'),
('Ketaki', 'Kulkarni', 'Parali', 'Beed', 'Maharashtra', 400154, 8806184082, 'kulkarni@gmail.com'),
('Pratiksha', 'Tat', 'Kothrude', 'Pune', 'Maharashtra', 4110343, 9702420754, 'pratiksha@gmail.com');

SELECT * from AddressBook;


--UC4-Ability to edit existing contact person using their name.
UPDATE AddressBook set Phone_Number = 8303245412 where First_Name='Sachin';
SELECT * from AddressBook;

--UC5-Ability to delete a person using person's name.
Delete from AddressBook where First_Name = 'Supriya';
select * from AddressBook;

--UC6-Ability to Retrieve Person belonging to a City or State from the Address Book.
select * from AddressBook Where City = 'Beed';
select * from AddressBook Where State = 'Maharashtra';

--UC7:Ability to understand the size
SELECT City, COUNT(City) AS CITY_COUNT FROM AddressBook GROUP BY City;
SELECT State, COUNT(State) AS STATE_COUNT FROM AddressBook GROUP BY State;


--UC8-Ability to retrieve entries sorted alphabetically by Person’s name for a given city

SELECT * FROM AddressBook WHERE City = 'Latur' ORDER BY First_Name;

--UC9-Ability to identify each Address Book with name and Type.
ALTER Table AddressBook Add Type varchar(20);
select * from AddressBook;

Update AddressBook set Type ='FRIENDS';
Update AddressBook set Type ='FAMILY' WHERE First_Name = 'Ajinkya';
Update AddressBook set Type ='Profession' Where First_Name ='Sachin';

--UC10-Ability to get number of contact persons i.e. count by type.
Select Type,Count(Type) As Type_Count from AddressBook GROUP BY Type;

--UC11:Ability to add in both family and friend
INSERT INTO  AddressBook (First_Name, Last_Name, Address, City, State, Zip, Phone_Number, EmailID , Type)VALUES
('Sachin', 'Dhage', 'Dhanora', 'Latur', 'Maharashtra', '433546', '8303245412', 'dhage@gmail.com', 'FRIENDS');