CREATE OR REPLACE TABLE `stately-arbor-455007-j5.dataset_muamalat.totalsales` AS
SELECT
  o.Date AS order_date,
  pc.CategoryName AS category_name,
  p.ProdName AS product_name,
  p.Price AS product_price,
  o.Quantity AS order_qty,
  (o.Quantity * p.Price) AS total_sales,
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city
FROM `stately-arbor-455007-j5.dataset_muamalat.Orders` o
LEFT JOIN `stately-arbor-455007-j5.dataset_muamalat.Customers` c
  ON o.CustomerID = c.CustomerID
LEFT JOIN `stately-arbor-455007-j5.dataset_muamalat.Products` p
  ON o.ProdNumber = p.ProdNumber
LEFT JOIN `stately-arbor-455007-j5.dataset_muamalat.ProductCategory` pc
  ON p.Category = pc.CategoryID
ORDER BY order_date ASC;

