create database R_Cab;
use R_Cab;
select * from bookings;

# 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status = "Success";

# 2. Find the average ride distance for each vehicle type:
create view Ride_Distance_For_Each_Vehicle as
select Vehicle_Type, round(avg(Ride_Distance),2) as Avg_Distance
from bookings
group by Vehicle_Type;

# 3. Get the total number of cancelled rides by customers:
create view Canceled_Rides_By_Customers as
select count(*) from bookings
where Booking_Status = "Canceled by Customer";

# 4. List the top 5 customers who booked the highest number of rides:
create view Top_Five_Customers as 
select Customer_ID, count(Booking_ID) as Total_Rides
from bookings
group by Customer_ID
order by Total_Rides desc limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_Canceled_By_Drivers_P_C_Issues as 
select count(*) from bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Max_Min_Driver_Rating as 
select max(Driver_Ratings) as Max_Rating,
min(Driver_Ratings) as Min_Rating
from bookings 
where Vehicle_Type = "Prime Sedan";

# 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as 
select * from bookings 
where Payment_Method = "UPI";

# 8. Find the average customer rating per vehicle type:
create view Avg_Cust_Rating as 
select Vehicle_Type, round(avg(Customer_Rating),2) as Avg_Customer_Rating
from bookings
group by Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
create view Total_Successful_Ride_Value as
select sum(Booking_Value) as Total_Successful_Ride_Value
from bookings
where Booking_Status = "Success";

# 10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as 
select Booking_ID, Incomplete_Rides_Reason 
from bookings
where Incomplete_Rides = "Yes";

# created Views
-- 1. Retrieve all successful bookings:
select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
select * from Ride_Distance_For_Each_Vehicle;

-- 3. Get the total number of cancelled rides by customers:
select * from Canceled_Rides_By_Customers;

-- 4. List the top 5 customers who booked the highest number of rides:
select * from Top_Five_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from Rides_Canceled_By_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from Max_Min_Driver_Rating;

-- 7. Retrieve all rides where payment was made using UPI:
select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
select * from Avg_Cust_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
select * from Total_Successful_Ride_Value;

-- 10. List all incomplete rides along with the reason:
select * from Incomplete_Rides_Reason;

