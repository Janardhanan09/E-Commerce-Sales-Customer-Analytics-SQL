CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50),
    Signup_Date DATE
);


CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Subcategory VARCHAR(50),
    Price DECIMAL(10,2)
);


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Status VARCHAR(30),
    Payment_Mode VARCHAR(30),

    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID)
);

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES Products(Product_ID)
);


CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Payment_Status VARCHAR(30),

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);


CREATE TABLE Returns (
    Return_ID INT PRIMARY KEY,
    Order_ID INT,
    Return_Date DATE,
    Reason VARCHAR(100),

    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
);






