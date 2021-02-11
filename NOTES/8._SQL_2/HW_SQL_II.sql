-- Question 1
SELECT * FROM User;

-- Question 2
SELECT FirstName FROM User;

-- Question 3
SELECT * FROM songs Where (id % 2 = 0 AND id > 50) or (id % 2 <> 0 AND id < 10);

-- Question 4
INSERT INTO User 
(FirstName, LastName, Birthplace, CreatedAt)
VALUES 
('Florence', 'Griffith-Joyner', 'Littlerock, California', CURRENT_TIMESTAMP),
('Tom', 'Brady', 'San Mateo, California', CURRENT_DATE),
('John', 'Chase', 'Ashville, North Carolina', CURRENT_DATE),
('Mary', 'Johnson', 'Boston, Maryland', CURRENT_DATE),
('Philip', 'Holland', 'Atlanta, Georgia', CURRENT_DATE),
('Harold', 'Anderson', 'Houston, Texas', CURRENT_DATE),
('Kofi', 'Antwi', 'Kumasi, Ghana', CURRENT_DATE),
('Jospeh', 'Baiden', 'Danville, Virginia', CURRENT_DATE),
('Miriam', 'Forson', 'Cape Coast, Ghana', CURRENT_DATE),
('Eric', 'Mensah', 'Accra, Ghana', CURRENT_DATE); 

-- Question 5
UPDATE User
SET FirstName = 'New',
	LastName = 'Name',
    UpdatedAt = CURRENT_TIMESTAMP
WHERE UserID = 10;

-- Question 6
BEGIN TRANSACTION; 
	DELETE FROM User; 
    SELECT * from User;
ROLLBACK;

-- Question 7
INSERT INTO Favorite 
(UserId, CreatedAt)

VALUES 
(1, CURRENT_TIMESTAMP), 
(2, CURRENT_TIMESTAMP), 
(3, CURRENT_TIMESTAMP), 
(4, CURRENT_TIMESTAMP);

Select * From Favorite; 

-- Question 8
BEGIN TRANSACTION;
   	DELETE FROM Favorite 
    WHERE (FavoriteID %2 <> 0) OR (FavoriteID%2 = 0 AND FavoriteID > 10);
	
    SELECT * FROM Favorite;
ROLLBACK;

-- Question 9
SELECT * FROM Favorite






