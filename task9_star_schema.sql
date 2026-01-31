-- 1. Create the Store Dimension
CREATE TABLE Dim_Store (
    Store INTEGER PRIMARY KEY,
    Type TEXT,
    Size INTEGER
);

-- 2. Create the Date Dimension
CREATE TABLE Dim_Date (
    Date TEXT PRIMARY KEY,
    IsHoliday TEXT,
    Month TEXT,
    Year TEXT
);

CREATE TABLE Sales_Fact (
    Sales_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Date TEXT,
    Store INTEGER,
    Weekly_Sales REAL,
    CPI REAL,
    Unemployment REAL,
    FOREIGN KEY (Date) REFERENCES Dim_Date(Date),
    FOREIGN KEY (Store) REFERENCES Dim_Store(Store)
);

DELETE FROM Dim_Store;
DELETE FROM Dim_Date;
DELETE FROM Sales_Fact;

-- Fill Store Dimension (Ensures one row per unique Store ID)
INSERT INTO Dim_Store (Store, Type, Size)
SELECT DISTINCT Store, Type, Size 
FROM cleaned_data 
WHERE Store IS NOT NULL;

-- Fill Date Dimension (Ensures one row per unique Date)
INSERT INTO Dim_Date (Date, IsHoliday)
SELECT DISTINCT Date, IsHoliday 
FROM cleaned_data 
WHERE Date IS NOT NULL;

-- Fill the Fact Table (Links transactions to dimensions)
INSERT INTO Sales_Fact (Date, Store, Weekly_Sales, CPI, Unemployment)
SELECT Date, Store, Weekly_Sales, CPI, Unemployment 
FROM cleaned_data;

SELECT f.Date, s.Type, f.Weekly_Sales
FROM Sales_Fact f
JOIN Dim_Store s ON f.Store = s.Store
LIMIT 100;