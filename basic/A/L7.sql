-- 65
SELECT T.口座番号, T.日付, J.取引事由名, COALESCE(T.入金額, T.出金額) AS 取引金額
FROM 取引 AS T
JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID
WHERE T.口座番号
IN('0311240, 1234161, 2750902')
ORDER BY T.口座番号, T.取引番号

-- 66
SELECT A.口座番号, A.名義, A.残高, T.日付, T.出金額, T.入金額
FROM 口座 AS A
JOIN 取引 AS T
ON A.口座番号 = T.口座番号
WHERE A.口座番号 = '0887132'
ORDER BY T.取引番号 ASC;

-- 67
SELECT T.口座番号, A.名義, A.残高
FROM 取引 AS T
JOIN 口座 AS A
ON T.口座番号 = A.口座番号
WHERE T.日付 = '2016-03-01'

-- 68
SELECT T.口座番号, COALESCE(A.名義, '解約済み') AS 名義, COALESCE(A.残高, 0) AS 残高
FROM 取引 AS T
LEFT JOIN 口座 AS A
ON T.口座番号 = A.口座番号
WHERE T.日付 = '2016-03-01'

-- 69
SELECT T.取引番号, CAST(J.取引事由ID AS VARCHAR)|| ':' || J.取引事由名 AS 取引事由,
        T.日付, T.口座番号, T.入金額, T.出金額
FROM 取引 AS T
RIGHT JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID

-- 70
SELECT DISTINCT T.取引事由ID, J.取引事由名
FROM 取引 AS T
FULL JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID;

-- 別解
-- SELECT DISTINCT T.取引事由, J.取引事由名
-- FROM 取引 AS T
-- LEFT JOIN 取引事由 AS J
-- ON T.取引事由ID = J.取引事由ID
-- UNION SELECT DISTINCT J.取引事由ID, J.取引事由名
-- FROM 取引 AS T
-- RIGHT JOIN 取引事由 AS J
-- ON T.取引事由ID = J.取引事由ID;

-- 71
SELECT A.口座番号, A.名義, A.残高, T.日付, J.取引事由名, T.出金額, T.入金額
FROM 口座 AS A
JOIN 取引 AS T
ON A.口座番号 = T.口座番号
JOIN 取引事由 AS J
ON T.取引事由ID = J.取引事由ID
WHERE A.口座番号 = '0887132'
ORDER BY T.取引番号 ASC;


-- 72
SELECT A.口座番号, A.名義, A.残高, T.日付 AS 取引日付, T.取引事由ID, T.入金額, T.出金額
FROM 口座 AS A
JOIN 取引 AS T
ON A.口座番号 = T.口座番号
WHERE A.残高 >= 5000000
    AND T.日付 >= '2018-01-01'
    AND (T.入金額 >= 1000000 OR T.出金額 >= 1000000);

-- 73
SELECT A.口座番号, A.名義, A.残高, T.日付, T.取引事由ID, T.入金額, T.出金額
FROM 口座 AS A
JOIN  (SELECT T.口座番号, T.日付, T.取引事由ID, T.入金額, T.出金額 
    FROM 取引
    WHERE (T.入金額 >= 1000000 OR T.出金額 >= 1000000)
    AND 日付 >= '2018-01-01') AS T
ON A.口座番号 = T.口座番号
WHERE A.残高 >= 5000000;

-- 74
SELECT A.名義, A.口座番号, T.回数
FROM 口座 AS A
JOIN (SELECT 口座番号, COUNT(*) AS 回数
        FROM 取引
        GROUP BY 口座番号, 日付 HAVING COUNT(*) >= 3) AS T
ON A.口座番号 = T.口座番号;

-- 75
SELECT  A1.名義, A1.口座番号, A1.種別, A1.残高, A1.更新日
FROM 口座 AS A1
JOIN 口座 AS A2
ON A1.名義 = A2.名義
WHERE A1.口座番号 <> A2.口座番号
ORDER BY A1.名義 ASC, A1.口座番号 ASC;

