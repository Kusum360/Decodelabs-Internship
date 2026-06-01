CREATE TABLE Orders (
    OrderID TEXT PRIMARY KEY,
    OrderDate TEXT,
    CustomerID TEXT,
    Product TEXT,
    Quantity INTEGER,
    Price REAL,
    ShippingAddress TEXT,
    PaymentMethod TEXT,
    OrderStatus TEXT,
    TrackingID TEXT,
    QuantityInStock INTEGER,
    CouponCode TEXT,
    MarketingChannel TEXT,
    TotalPrice REAL
);

INSERT INTO Orders VALUES ('ORD001','2024-01-15','CUST01','Laptop',1,45000,'Delhi','UPI','Delivered','TRK001',10,'','Direct',45000);
INSERT INTO Orders VALUES ('ORD002','2024-01-16','CUST02','Mobile',2,16000,'Mumbai','Card','Delivered','TRK002',50,'SAVE15','Social',32000);
INSERT INTO Orders VALUES ('ORD003','2024-01-17','CUST03','Headphone',1,2000,'Bangalore','COD','Delivered','TRK003',100,'WELCOME10','Email',2000);
INSERT INTO Orders VALUES ('ORD004','2024-01-18','CUST04','Tablet',1,55000,'Delhi','UPI','Cancelled','TRK004',5,'','Direct',55000);
INSERT INTO Orders VALUES ('ORD005','2024-01-19','CUST05','Keyboard',3,8500,'Pune','Card','Delivered','TRK005',30,'NEW20','Social',25500);

-- Query 1: PaymentMethod wise Revenue
SELECT PaymentMethod, COUNT(*) AS TotalOrders, SUM(TotalPrice) AS Revenue
FROM Orders
GROUP BY PaymentMethod;

-- Query 2: Coupon Usage
SELECT CouponCode, COUNT(*) AS TimesUsed
FROM Orders
WHERE CouponCode != ''
GROUP BY CouponCode;

-- Query 3: Cancelled orders ka loss
SELECT COUNT(*) AS CancelledOrders, SUM(TotalPrice) AS LostRevenue
FROM Orders
WHERE OrderStatus = 'Cancelled';

-- Query 4: Total Revenue
SELECT SUM(TotalPrice) AS TotalRevenue
FROM Orders;
