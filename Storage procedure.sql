Use [AddressBook_Service]
Go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE[GetAllAddressBookData()]
AS
BEGIN
SELECT FirstName, LastName, Address, City, State, Zip, PhoneNumber, EmailID from AddressBook
END
GO