/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

/*SELECT * FROM Products
LEFT JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE Categories.Name = 'Computers';*/

SELECT P.Name, C.Name
FROM Products AS P
INNER JOIN Categories AS C
ON C.CategoryID = P.CategoryID
WHERE C.Name = 'Computers';

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

/*SELECT P.Name, P.Price, R.Rating FROM Products AS P
INNER JOIN Reviews AS R ON R.ProductID = P.ProductID
WHERE R.Rating = 5;*/

/*SELECT Products.Name AS 'Product Names', Products.Price AS 'Product Prices', Reviews.Rating AS 'Product Rating Of 5' FROM Products
INNER JOIN Reviews ON Reviews.ProductID = Products.ProductID
WHERE Reviews.Rating = 5;*/

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT SUM(Sales.Quantity) AS 'TotalSales', Sales.EmployeeID, Employees.FirstName, Employees.LastName FROM Sales
INNER JOIN Employees ON Sales.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY TotalSales Desc
LIMIT 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */


select D.Name AS 'Department Name', C.Name AS 'Category Name' FROM Departments AS D
INNER JOIN Categories AS C ON D.departmentID = C.departmentID
WHERE C.Name = 'Appliances' OR C.Name = 'Games';



/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT P.Name AS 'Product Name', Sum(S.Quantity) AS 'Total # Sold', Sum(S.PricePerUnit * S.Quantity) AS 'Total Price Sold' 
 FROM Products AS P
 INNER JOIN Sales AS S ON P.ProductID = S.ProductID
 WHERE P.ProductID = 97;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT P.Name AS 'Product Name', R.Reviewer AS 'Reviewer Name', R.Rating AS 'Worst Rating', R.Comment AS 'Comment' FROM Products AS P
INNER JOIN REVIEWS AS R ON P.ProductID = R.ProductID 
WHERE P.Name = 'Visio TV' AND R.Rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT E.EmployeeID AS 'Employee ID', E.FirstName AS 'Employee First Name', E.LastName AS 'Employee Last Name', P.name AS 'Product Name',
 SUM(S.Quantity) AS 'Number of Products Sold'
FROM Sales AS S
 INNER JOIN Employees AS E ON E.EmployeeID = S.EmployeeID
 INNER JOIN Products AS P on P.ProductID = S.ProductID
 Group By E.EmployeeID, P.ProductID
 ORDER BY SUM(S.Quantity) desc;