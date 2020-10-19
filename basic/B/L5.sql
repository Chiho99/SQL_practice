-- 46
SELECT SUM(数量) AS 合計
FROM 注文;

-- 47
SELECT SUM(数量) AS 合計
FROM 注文
GROUP BY 注文日
ORDER BY 注文日;

-- 48
SELECT 商品区分, MIN(単価) AS 最小, MAX(単価) AS 最大
FROM 商品
GROUP BY 商品区分
ORDER BY 商品区分;

-- 49
SELECT 商品コード, SUM(数量) AS 合計
FROM 注文
GROUP BY 商品コード
ORDER BY 商品コード;

-- 50
SELECT 商品コード, SUM(数量) AS 合計
FROM 注文
ORDER BY 合計 DESC, 商品コード ASC
OFFSET 0 FETCH FIRST 10 ROWS ONLY;


-- 51
SELECT 商品コード, SUM(数量) AS 合計
FROM 注文
GROUP BY 商品コード
HAVING SUM(数量) < 5

-- 52
SELECT COUNT(クーポン割引料) AS 割引回数, SUM(クーポン割引料) AS 割引額合計
FROM 注文;

-- 53
SELECT SUBSTRING(注文番号, 1, 6) AS 年月, COUNT(*) AS 注文件数
FROM 注文
WHERE 注文枝番 = 1
GROUP BY  SUBSTRING(注文番号, 1, 6)
ORDER BY SUBSTRING(注文番号, 1, 6)

-- 54
SELECT 商品コード
FROM 注文
WHERE 商品コード LIKE 'Z%'
GROUP BY 商品コード
HAVING SUM(数量) >= 100;
