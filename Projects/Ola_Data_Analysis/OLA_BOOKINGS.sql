-- OLA Data Analyst Project - SQL Queries

CREATE DATABASE Ola;
USE Ola;

-- Retrieve all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT *
FROM OLA_BOOKINGS
WHERE Booking_Status = 'Success';

-- Retrieve data
SELECT * FROM Successful_Bookings;

-- Find the average ride distance for each vehicle type
CREATE VIEW Ride_Distance_For_Each_Vehicle AS
SELECT 
    Vehicle_Type,
    AVG(Ride_Distance) AS Avg_Distance
FROM OLA_BOOKINGS
GROUP BY Vehicle_Type;

SELECT * FROM Ride_Distance_For_Each_Vehicle;

-- Get the total number of cancelled rides by customers
CREATE VIEW Cancelled_Rides_By_Customers AS
SELECT 
    COUNT(*) AS Total_Cancelled_By_Customers
FROM OLA_BOOKINGS
WHERE Booking_Status = 'Cancelled by Customer';

SELECT * FROM Cancelled_Rides_By_Customers;

-- List the top 5 customers who booked the highest number of rides
CREATE VIEW Top_5_Customers AS
SELECT 
    Customer_ID,
    COUNT(Booking_ID) AS Total_Rides
FROM OLA_BOOKINGS
GROUP BY Customer_ID
ORDER BY Total_Rides DESC
LIMIT 5;

SELECT * FROM Top_5_Customers;

-- Get the number of rides cancelled by drivers due to personal and car-related issues
CREATE VIEW Rides_Cancelled_By_Drivers_P_C_Issues AS
SELECT 
    COUNT(*) AS Total_Rides_Cancelled_By_Driver
FROM OLA_BOOKINGS
WHERE Canceled_Rides_By_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_Cancelled_By_Drivers_P_C_Issues;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings
CREATE VIEW Max_Min_Driver_Rating AS
SELECT 
    MAX(Driver_Ratings) AS Max_Rating,
    MIN(Driver_Ratings) AS Min_Rating
FROM OLA_BOOKINGS
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;

-- Retrieve all rides where payment was made using UPI
6CREATE VIEW UPI_Payment AS
SELECT *
FROM OLA_BOOKINGS
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payment;

-- Find the average customer rating per vehicle type
CREATE VIEW AVG_Cust_Rating AS
SELECT 
    Vehicle_Type,
    AVG(Customer_Rating) AS Avg_Customer_Rating
FROM OLA_BOOKINGS
GROUP BY Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;

-- Calculate the total booking value of rides completed successfully
CREATE VIEW Total_Successful_Ride_Value AS
SELECT 
    SUM(Booking_Value) AS Total_Successful_Ride_Value
FROM OLA_BOOKINGS
WHERE Booking_Status = 'Success';

SELECT * FROM Total_Successful_Ride_Value;

-- List all incomplete rides along with the reason
CREATE VIEW Incomplete_Rides_Reason AS
SELECT 
    Booking_ID,
    Incomplete_Rides_Reason
FROM OLA_BOOKINGS
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;
