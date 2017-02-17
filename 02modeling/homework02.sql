-- Paige Brinks
-- cs 342
-- Homework 02
-- 02/15/2017
--
-- Database schema for a company which takes orders from customers and ships them

-- Drop current database
DROP TABLE Shipment;
DROP TABLE Warehouse;
DROP TABLE Order_Item;
DROP TABLE Item;
DROP TABLE Customer_Order;
DROP TABLE Customer;

-- Create database schema

-- Customer who orders Items
CREATE TABLE Customer (
	id integer,
	firstName varchar(40),
	lastName varchar(40),
	city varchar(40),
	PRIMARY KEY (id)
);
	
-- An order placed by a Customer
-- I used on delete cascade because if the customer no longer exists
-- then we should not fulfill their order
-- checking that the ord_date is greater than the year 2000, 
-- assuming that is when the company was founded
CREATE TABLE Customer_Order (
	id integer,
	ord_date date,	-- date order was placed
	customerID integer,
	ord_amt float,	-- total dollar amount of an order
	PRIMARY KEY (id),
	FOREIGN KEY (customerID) REFERENCES Customer(id) ON DELETE CASCADE,
	CHECK (ord_date > '01-JAN-2000')
);

-- An item which can be ordered
-- I checked that the unit_price is greater than zero because
-- Item should never be free (or less than zero)
CREATE TABLE Item (
	id integer,
	name varchar(40),
	unit_price float,
	PRIMARY KEY (id),
	CHECK (unit_price > 0)
);
	
-- Specifies number of Item ordered for a Customer_Order
-- I chose on delete cascade because both the foreign keys make up the primary key
-- and you cannot have a null primary key. 
-- also if the Customer_Order gets deleted then we should no longer prepare items for that orderID
-- because that order will no longer be fulfilled
-- likewise if we no longer supply that Item we cannot fulfill an order with that Item
CREATE TABLE Order_Item (
	orderID integer,
	itemID integer,
	quantity integer,
	PRIMARY KEY (orderID, itemID),
	FOREIGN KEY (orderID) REFERENCES Customer_Order(id) ON DELETE CASCADE,
	FOREIGN KEY (itemID) REFERENCES Item(id) ON DELETE CASCADE
);

-- Warehouses where the Items are shipped from
CREATE TABLE Warehouse (
	id integer,
	city varchar(40),
	PRIMARY KEY (id)
);
	
-- Shipment of a Customer_Order
-- on delete cascade because the Customer_Order ID and the Warehouse ID are both 
-- part of the primary key which cannot be null
-- also, if a order is deleted, the shipment should therefore be cancelled (aka deleted)
-- and if a warehouse no longer exists, then we can no longer ship whatever was stored
-- there meaning the shipment should be deleted if either of those keys were to be deleted
-- I added the check date greater 2000 assuming the company was founded in 2000
CREATE TABLE Shipment (
	orderID integer,
	warehouseID integer,
	ship_date date,	-- date order is shipped from warehouse
	PRIMARY KEY (orderID, warehouseID),
	FOREIGN KEY (orderID) REFERENCES Customer_Order(id) ON DELETE CASCADE,
	FOREIGN KEY (warehouseID) REFERENCES Warehouse(id) ON DELETE CASCADE,
	CHECK (ship_date > '01-JAN-2000')
);	


-- Load sample data
INSERT INTO Customer VALUES (1, 'Lydia', 'Cupery', 'Istanbul');
INSERT INTO Customer VALUES (2, 'Beka', 'Agava', 'New York');
INSERT INTO Customer VALUES (3, 'Tammie', 'Thong', 'Shanghai');
INSERT INTO Customer VALUES (4, 'Joel', 'Smith', 'Grand Rapids');

INSERT INTO Customer_Order VALUES (1, '01-FEB-2015', 1, 100.90);
INSERT INTO Customer_Order VALUES (2, '27-MAR-2016', 2, 102.40);
INSERT INTO Customer_Order VALUES (3, '30-NOV-2016', 3, 47.95);
INSERT INTO Customer_Order VALUES (4, '10-DEC-2016', 1, 30.60);
INSERT INTO Customer_Order VALUES (5, '07-JAN-2017', 1, 30.25);

INSERT INTO Item VALUES (1, 'Bicycle', 50.45);
INSERT INTO Item VALUES (2, 'Helmet', 10.20);
INSERT INTO Item VALUES (3, 'Seat Cover', 12.40);
INSERT INTO Item VALUES (4, 'Tire', 20.50);
INSERT INTO Item VALUES (5, 'Basket', 30.25);
INSERT INTO Item VALUES (6, 'Bell', 5.30);

INSERT INTO Order_Item VALUES (1, 1, 2);
INSERT INTO Order_Item VALUES (2, 4, 4);
INSERT INTO Order_Item VALUES (2, 2, 2);
INSERT INTO Order_Item VALUES (3, 5, 1);
INSERT INTO Order_Item VALUES (3, 6, 1);
INSERT INTO Order_Item VALUES (3, 3, 1);
INSERT INTO Order_Item VALUES (4, 2, 3);
INSERT INTO Order_Item VALUES (5, 5, 1);

INSERT INTO Warehouse VALUES (1, 'Beijing');
INSERT INTO Warehouse VALUES (2, 'New York');
INSERT INTO Warehouse VALUES (3, 'Berlin');

INSERT INTO Shipment VALUES (1, 3, '08-FEB-2015');
INSERT INTO Shipment VALUES (2, 2, '03-APR-2016');
INSERT INTO Shipment VALUES (3, 1, '07-DEC-2016');
INSERT INTO Shipment VALUES (4, 3, '17-DEC-2016');
INSERT INTO Shipment VALUES (5, 3, '14-JAN-2017');

--2. Exercise 5.20
-- I would say surrogate keys are acceptable (and should be used), because it is almost 
-- impossible to come up with a natural key that would be unique for each student. You should
-- not assume for example that every student would have a unique full name or their name and 
-- combined with their birthdate, etc. would be unique. However, with a surrogate key you are
-- gaurenteed that your key will always be unique.

-- 3. Queries
--a.
SELECT Customer_Order.ord_date, Customer_Order.ord_amt FROM Customer_Order, Customer
WHERE Customer.firstName = 'Lydia'
AND Customer.lastName = 'Cupery'
AND Customer.id = Customer_Order.customerID
ORDER BY ord_date;

-- b. 
SELECT DISTINCT(Customer.id) FROM Customer, Customer_Order
WHERE Customer.id = Customer_Order.customerID;

-- c.
SELECT Customer.id, Customer.firstName, Customer.lastName FROM Customer, Customer_Order, Item, Order_Item
WHERE Item.name = 'Basket'
AND  Order_Item.itemID = Item.id
AND Customer_Order.id = Order_Item.orderID
AND Customer.id = Customer_Order.customerID;
