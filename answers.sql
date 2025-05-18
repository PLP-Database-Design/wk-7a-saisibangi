/*Question 1: Transforming ProductDetail into 1NF
To achieve (1NF), we must ensure that each column contains atomic values. This means splitting the Products column into separate rows for each product 
hence we create a new structured table:*/
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);
/*Insert the transformed data*/
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

/*Question 2: Transforming OrderDetails into 2NF*/
/*To achieve (2NF), we must remove partial dependencies (where CustomerName depends only on OrderID but not on the full primary key {OrderID, Product}). 
To resolve this, we separate the customer details into a separate Customers table.*/
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);
/*Step 2: Insert customer data*/
INSERT INTO Customers (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');
/*Step 3: Create a revised OrderDetails_2NF table*/
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);
/*Step 4: Insert product-order data*/
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
