/* 第２章 */

SELECT
  Address
FROM
  Customers
;

SELECT
  ProductName
FROM
  Products
;

SELECT
  Price
FROM
  Products
;

SELECT
  EmployeeName
FROM
  Employees
;

SELECT
  Email
FROM
  Employees
;


SELECT
  CustomerName
, Address
FROM
  Customers
;

SELECT
  ProductID
, ProductName
, Price
FROM
  Products
;

SELECT
  EmployeeName
, Email
, Height
FROM
  Employees
;

SELECT
  CustomerCode
, CustomerName
, CustomerCode
FROM
  Customers
;

SELECT
  ProductCode
, Price
, ProductName
, ProductCode
FROM
  Products
;

SELECT
  EmployeeName AS 社員名
FROM
  Employees
;

SELECT
  CustomerCode AS 顧客コード
, CustomerName AS 顧客名
FROM
  Customers
;

SELECT
  ProductCode AS 商品コード
, ProductName AS 商品名
, Price AS 価格
FROM
  Products
;

SELECT
  CustomerName AS 顧客名
, CustomerName AS 得意先名
FROM
  Customers
;

SELECT
  EmployeeName AS 社員名
, Email AS メールアドレス
, Email AS 連絡先
FROM
  Employees
;


SELECT
  Amount * 0.15 AS 給与の15％
FROM
  Salary
;

SELECT
  Height / 2 AS 身長の半分
FROM
  Employees
;

SELECT
  Weight * 3 - 50 AS 体重の3倍引く50
FROM
  Employees
;

SELECT
  (Price + 100) * 0.3 AS （価格 ＋ 100）の30％
FROM
  Products
;

SELECT
  (Quantity + 200) / 3 AS （数量 ＋ 200）÷3
FROM
  Sales
;


SELECT
  Height * 3 - Weight * 2.5 AS 結果
FROM
  Employees
;

SELECT
  HireFiscalYear * Weight + Height AS 結果
FROM
  Employees
;

SELECT
  Quantity + CustomerID * ProductID * EmployeeID AS 結果
FROM
  Sales
;

SELECT
  Price - ProductCode * CategoryID AS 結果
FROM
  Products
;

SELECT
  CustomerID + CustomerID ^ 3 AS 結果
FROM
  Customers
;


SELECT
  EmployeeName || 'さん' AS 社員名
FROM
  Employees
;

SELECT
  'E-MAIL:' || Email AS メールアドレス
FROM
  Employees
;

SELECT
  EmployeeName || 'さんの' || 'E-mail:' || Email AS 連絡先
FROM
  Employees
;

SELECT
  CustomerName || '様のお住いは' || Address AS お得意様連絡先
FROM
  Customers
;

SELECT
  '社員' || EmployeeName || 'さんの血液型は' || BloodType || '型' AS 社員血液型
FROM
  Employees
;


SELECT
  COUNT(Customer) AS お得意様数
FROM
  Customers
;

SELECT
  SUM(Weight) AS 社員体重合計
FROM
  Employees
;

SELECT
  MAX(Price) AS 最高額価格
FROM
  Products
;

SELECT
  MIN(Weight) AS 最軽量体重
FROM
  Employees
;

SELECT
  AVG(Height) AS 平均身長
, AVG(Weight) AS 平均体重
FROM
  Employees
;


SELECT
  ProductName
FROM
  Products
WHERE
  Price >= 2500
;

SELECT
  EmployeeName
, Weight
FROM
  Employees
WHERE
  Weight >= 70
;

SELECT
FROM
  Employees
WHERE
  Height
  BETWEEN
  160
  AND
  180
;

SELECT
  SaleID
FROM
  Sales
WHERE
  SalesDate > 2007-06-01

SELECT
  EmployeeName
, Height
, Weight
FROM
  Employees
WHERE
  Height >= 170
  AND
  Weight >= 60
;


SELECT
  CustomerName
FROM
  Customers AS 会社名
WHERE
  CustomerName
  LIKE
  '%株式会社%'
;

SELECT
  AVG(Height) AS 平均身長
FROM
  Employees
WHERE
  EmployeeName
  LIKE
  '%-%'
;

SELECT
  CustomerName AS 顧客数
FROM
  Customers
WHERE
  CustomerName
  NOT LIKE
  '%株式会社%'
;

SELECT
  EmployeeName
, Height
FROM
  Employees
WHERE
  EmployeeName
  LIKE
  '%リ%'
  AND
  Height <= 160
;

SELECT
  *
FROM
  Customers
WHERE
  CustomerName
  NOT LIKE
  '%株式会社%'
  AND
  Address
  LIKE
  '%江戸川区%'
;

SELECT
  EmployeeName AS 社員名
, CASE
    WHEN Height < 160 THEN 'A'
    WHEN Height < 170 THEN 'B'
    WHEN Height < 180 THEN 'C'
    ELSE 'D'
  END AS 'ランク'
FROM
  Employees
;

SELECT
  SalaryID AS 給与 ID
, CASE
    WHEN Amount < 150000 THEN 'D'
    WHEN Amount < 300000 THEN 'C'
    WHEN Amount < 500000 THEN 'B'
    ELSE  'A'
  END AS ランク
FROM
  Salary
;

SELECT
  EmployeeName AS 社員名
, CASE
    WHEN Weight < 60 THEN 'A'
    WHEN Weight < 70 THEN 'B'
    WHEN Weight < 80 THEN 'C'
    ELSE 'D'
  END AS ランク
FROM
  Employees
;

SELECT
  SaleID AS 販売ID
, CASE
    WHEN Quantity > 10 THEN 'A'
    ELSE 'B'
  END AS ランク
FROM
  Sales
;

SELECT
  EmployeeName AS 社員名
, Height AS 身長
, CASE
    WHEN Height < 160 THEN 'A'
    WHEN Height < 170 THEN 'B'
    WHEN Height < 180 THEN 'C'
    ELSE 'D'
  END AS ランク
FROM
  Employees
;


SELECT
  CustomerID AS 顧客ID
, COUNT(*) AS 件数
FROM
  Sales
GROUP BY
  CustomerID
;

SELECT
  EmployeeID AS 社員ID
, SUM(*) AS 合計
FROM
  Salary
GROUP BY
  EmployeeID
;

SELECT
  CustomerID AS 顧客ID
, ProductID AS 商品ID
, SUM(*) AS 数量
FROM
  Sales
GROUP BY
  CustomerID
, ProductID
;

SELECT
  BloodType AS 血液型
, AVG(Height) AS 平均身長
, AVG(Weight) AS 平均体重
FROM
  Employees
GROUP BY
  BloodType 
;

SELECT
  EmployeeID AS 社員ID
, AVG(Amount) AS 平均支給額
, Count(*) AS 支給回数
FROM
  Salary
GROUP BY
  EmployeeID
;


SELECT
  EmployeeID AS 社員ID
, Count(*) AS 支給回数
FROM
  Salary
GROUP BY
  EmployeeID
HAVING
  Count(*) < 12
;

SELECT
  PrefecturalID AS 県ID
, Count(*) AS 顧客数
FROM
  Customers
GROUP BY
  PrefecturalID
HAVING
  Count(*) > 1
;

SELECT
  ProductID AS 商品ID
, Count(*) AS 売り上げレコード数
FROM
  Sales
GROUP BY
  ProductID
HAVING
  Count(*) >= 10 AND Count(*) <= 50
;

SELECT
  BloodType AS 血液型
, Count(*) AS データ件数
FROM
  Employees
GROUP BY
  BloodType
HAVING
  Count(*) >= 10
;

SELECT
  ProductID AS 商品ID
, SUM(Quantity) AS 数量合計
FROM
  Sales
GROUP BY
  ProductID
HAVING
  SUM(Quantity) >= 100 AND SUM(Quantity) <= 200
;


SELECT
  PrefecturalID AS 県ID
, Count(*) AS 顧客数
FROM
  Customers
WHERE
  PrefecturalID >= 10
GROUP BY
  PrefecturalID
HAVING
  Count(*) > 1
;

SELECT
  EmployeeID AS 社員ID
, Count(*) AS 支給回数
FROM
  Salary
WHERE
  EmployeeID >= 20
GROUP BY
  EmployeeID
HAVING
  Count(*) >= 12
;

SELECT
  ProductID AS 商品ID
, Count(*) AS 売り上げレコード数
FROM
  Sales
WHERE
  ProductID >= 20 AND ProductID <= 30
GROUP BY
  ProductID
HAVING
  Count(*) >= 30
;

SELECT
  BloodType AS 血液型
, Count(*) AS データ件数
FROM
  Employees
WHERE
  Height >= 165
GROUP BY
  BloodType
HAVING
  Count(*) >= 5
;

SELECT
  ProductID AS 商品ID
, Count(*) AS 数量合計
FROM
  Sales
WHERE
  SaleDate > 2007-06-01
GROUP BY
  ProductID
HAVING
  Count(*) >= 200
;


SELECT
  HireFiscalYear AS 入社年度
, SUM(
    CASE
      WHEN Height <= 160 THEN 1
      ELSE 0
    END
  ) AS "160cm以下"
, SUM(
    CASE
      WHEN Height <= 170 THEN 1
      ELSE 0
    END
  ) AS "170cm以下"
, SUM(
    CASE
      WHEN Height <= 180 THEN 1
      ELSE 0
    END
  ) AS "180cm以下"
, SUM(
    CASE
      WHEN Height > 180 THEN 1
      ELSE 0
    END
  ) AS "180cm超"
FROM
  Employees
GROUP BY
  HireFiscalYear
;

SELECT
  CategoryID AS 商品カテゴリID
, SUM(
    CASE
      WHEN Price < 100 THEN 1
      ELSE 0
    END
  ) AS "100円未満"
, SUM(
    CASE
      WHEN Price < 400 THEN 1
      ELSE 0
    END
  ) AS "400円未満"
, SUM(
    CASE
      WHEN Price < 1000 THEN 1
      ELSE 0
    END
  ) AS "1000円未満"
, SUM(
    CASE
      WHEN Price >= 1000 THEN 1
      ELSE 0
    END
  ) AS "100円以上"
FROM
  Products
GROUP BY
  CategoryID
;

SELECT
  EmployeeID
, EmployeeName
, BirthDay
FROM
  Employees
ORDER BY
  BirthDay
;

SELECT
  SaleID
, Quantity
, CustomerID
, ProductID
, SaleDate
FROM
  Sales
ORDER BY
  CustomerID
, ProductID
, SaleDate DESC
;

SELECT
  CategoryID
, Count(*) AS 商品数
FROM
  Products
WHERE
  Price <= 1000
GROUP BY
  CategoryID
HAVING
  Count(*) < 5
ORDER BY
  CategoryID
;

SELECT
  EmployeeID AS 社員ID
, SUM(Amount) AS 給与合計
FROM
  Salary
GROUP BY
  EmployeeID
ORDER BY
  SUM(Amount) DESC
;

SELECT
  DepartmentID
, Count(Employee)
FROM
  BelongTo
WHERE
  EndDate = Null
ORDER BY
  Count(Employee) DESC
;


SELECT DISTINCT
  HireFiscalYear
FROM
  Employees
;

SELECT DISTINCT
  CustomerID
, ProductID
FROM
  Sales
;

SELECT DISTINCT
  CustomerClassID
, PrefecturelID
FROM
  Customers
;

SELECT DISTINCT
  CustomerID
, ProductID
, EmployeeID
FROM
  Sales
;

SELECT DISTINCT
  Price
, CategoryID
FROM
  Products
;



/* 第3章 */


SELECT
  EmployeeID
, EmployeeName
FROM
  Employees
WHERE
  EmployeeID IN
  (
    SELECT
      EmployeeID
    FROM
      Salary
    GROUP BY
      EmployeeID
    HAVING
      MAX(Amount) >= 300000
  )
;

SELECT
FROM
  Sales
WHERE
  Quantity >= 100
;

SELECT
  ProductID
, ProductName
FROM
  Products
WHERE
  ProductID IN
  (
    SELECT
      ProductID
    FROM
      Sales
    WHERE
      SUM(Quantity) >= 100
  )
;


SELECT
  EmployeeName
, PayDate
, Amount
FROM
  Salary AS A
  JOIN
  Employees AS B
  ON Salary.EmployeeID = Employees.EmployeeID
ORDER BY
  EmployeeID
;

SELECT
  ProductID
, ProductName
, SUM(Quantity) AS 数量限定
FROM
  Sales AS A
  JOIN
  Products AS B
  ON Sales.ProductID = Products.ProductID
GROUP BY
  ProductID
, ProductName
HAVING
  SUM(Quantity) >= 300
;
