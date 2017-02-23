-- Paige Brinks
-- cs 342
-- Homework 03_3
-- 02/22/2017
--
-- schema based in ERD stored in homework03_2.png

drop table PartOrder;
drop table Part;
drop table CustomerOrder;
drop table Employee;
drop table Customer;

-- create tables
create table Customer (
	id integer PRIMARY KEY,
	firstName varchar(20),
	lastName varchar(20),
	zip decimal(5)
);

create table Employee (
	id integer PRIMARY KEY,
	firstName varchar(20),
	lastName varchar(20),
	zip decimal(5)
);

create table CustomerOrder (
	id integer PRIMARY KEY,
	customerID integer,
	employeeID integer,
	receiptDate date,
	expectedShipDt date,
	actualShipDt date,
	FOREIGN KEY (customerID) REFERENCES Customer(id) ON DELETE CASCADE,
	FOREIGN KEY (employeeID) REFERENCES Employee(id) ON DELETE SET NULL
);

create table Part (
	id integer PRIMARY KEY,
	name varchar(20),
	price float,
	stock integer,
	CHECK (stock >= 0)
);

create table PartOrder (
	orderID integer,
	partID integer,
	quantity integer,
	PRIMARY KEY (orderID, partID),
	FOREIGN KEY (orderID) REFERENCES CustomerOrder(id) ON DELETE CASCADE,
	FOREIGN KEY (partID) REFERENCES Part(id) ON DELETE CASCADE,
	CHECK (quantity > 0)
);


-- insert test info
INSERT INTO Customer VALUES (1, 'Lydia', 'Cupery', '49503');
INSERT INTO Customer VALUES (2, 'Beka', 'Agava', '49546');
INSERT INTO Customer VALUES (3, 'Tammie', 'Thong', '49876');
INSERT INTO Customer VALUES (4, 'Joel', 'Smith', '49301');

INSERT INTO Employee VALUES (1, 'Paige', 'Brinks', '49437');
INSERT INTO Employee VALUES (2, 'Jennah', 'Maier', '49632');
INSERT INTO Employee VALUES (3, 'Samantha', 'Woldman', '49546');


INSERT INTO CustomerOrder VALUES (1, 1, 1, '01-FEB-2015', '08-FEB-2015', '08-FEB-2015');
INSERT INTO CustomerOrder VALUES (2, 1, 2, '27-MAR-2016', '03-APR-2016', '02-APR-2016');
INSERT INTO CustomerOrder VALUES (3, 2, 2, '30-NOV-2016', '07-DEC-2016', '05-DEC-2016');
INSERT INTO CustomerOrder VALUES (4, 3, 3, '10-DEC-2016', '17-DEC-2016', '19-DEC-2016');
INSERT INTO CustomerOrder VALUES (5, 4, 1, '07-JAN-2017', '14-JAN-2017', NULL);

INSERT INTO Part VALUES (1, 'Bicycle', 50.45, 120);
INSERT INTO Part VALUES (2, 'Helmet', 10.20, 156);
INSERT INTO Part VALUES (3, 'Seat Cover', 12.40, 200);
INSERT INTO Part VALUES (4, 'Tire', 20.50, 507);
INSERT INTO Part VALUES (5, 'Basket', 30.25, 51);
INSERT INTO Part VALUES (6, 'Bell', 5.30, 162);

INSERT INTO PartOrder VALUES (1, 1, 2);
INSERT INTO PartOrder VALUES (2, 4, 4);
INSERT INTO PartOrder VALUES (2, 2, 2);
INSERT INTO PartOrder VALUES (3, 5, 1);
INSERT INTO PartOrder VALUES (3, 6, 1);
INSERT INTO PartOrder VALUES (3, 3, 1);
INSERT INTO PartOrder VALUES (4, 2, 3);
INSERT INTO PartOrder VALUES (5, 5, 1);


