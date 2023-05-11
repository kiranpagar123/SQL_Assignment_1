CREATE TABLE sales.SalesPeople (
  Snum INT PRIMARY KEY,
  Sname VARCHAR(255) UNIQUE,
  City VARCHAR(255),
  Comm FLOAT
);

-- Create Customers table
CREATE TABLE sales.Customers (
  Cnum INT PRIMARY KEY,
  Cname VARCHAR(255),
  City VARCHAR(255) NOT NULL,
  Snum INT,
  FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

-- Create Orders table
CREATE TABLE sales.Orders (
  Onum INT PRIMARY KEY,
  Amt FLOAT,
  Odate DATE,
  Cnum INT,
  Snum INT,
  FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
  FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);






-- Insert records into SalesPeople table
INSERT INTO sales.SalesPeople (Snum, Sname, City, Comm)
VALUES (1001, 'Peel', 'London', 0.12),
       (1002, 'Serres', 'Sanjose', 0.13),
       (1004, 'Motika', 'London', 0.11),
       (1007, 'Rifkin', 'Barcelona', 0.15),
       (1003, 'Axelrod', 'Newyork', 0.10);

-- Insert records into Customers table
INSERT INTO sales.Customers (Cnum, Cname, City, Snum)
VALUES (2001, 'Hoffman', 'London', 1001),
       (2002, 'Giovanni', 'Rome', 1003),
       (2003, 'Liu', 'Sanjose', 1002),
       (2004, 'Grass', 'Berlin', 1002),
       (2006, 'Clemens', 'London', 1001),
       (2008, 'Cisneros', 'Sanjose', 1007),
       (2007, 'Pereira', 'Rome', 1004);

-- Insert records into Orders table
INSERT INTO sales.Orders (Onum, Amt, Odate, Cnum, Snum)
VALUES (3001, 18.69, '1990-10-03', 2008, 1007),
       (3003, 767.19, '1990-10-03', 2001, 1001),
       (3002, 1900.10, '1990-10-03', 2007, 1004),
       (3005, 5160.45, '1990-10-03', 2003, 1002),
       (3006, 1098.16, '1990-10-03', 2008, 1007),
       (3009, 1713.23, '1990-10-04', 2002, 1003),
       (3007, 75.75, '1990-10-04', 2004, 1002),
       (3008, 4273.00, '1990-10-05', 2006, 1001),
       (3010, 1309.95, '1990-10-06', 2004, 1002),
       (3011, 9891.88, '1990-10-06', 2006, 1001);




SELECT COUNT(*) AS count_salespeople
FROM sales.SalesPeople
WHERE UPPER(Sname) LIKE 'A%';


SELECT S.Snum, S.Sname
FROM sales.SalesPeople AS S
INNER JOIN sales.Orders AS O ON S.Snum = O.Snum
GROUP BY S.Snum, S.Sname
HAVING SUM(O.Amt) > 2000;


SELECT COUNT(*) AS count_salespeople_newyork
FROM sales.SalesPeople
WHERE City = 'Newyork';

SELECT City, COUNT(*) AS count_salespeople
FROM sales.SalesPeople
WHERE City IN ('London', 'Paris')
GROUP BY City;

SELECT O.Snum, S.Sname, COUNT(*) AS order_count, O.Odate
FROM sales.SalesPeople AS S
INNER JOIN sales.Orders AS O ON S.Snum = O.Snum
GROUP BY O.Snum, S.Sname, O.Odate;

