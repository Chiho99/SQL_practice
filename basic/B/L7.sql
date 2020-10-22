-- 61
SELECT O.注文番号, O.注目枝番, O.商品コード, G.商品名, O.数量
FROM 注文 AS O
JOIN 商品 AS G
ON O.商品コード = G.商品コード
WHERE O.注文番号 = '201801130115'
ORDER BY O.注文番号, O.注文枝番;

-- 62
SELECT O.注文日, O.注文番号, O.注文枝番, O.数量, (G.単価*D.数量) AS 注文金額
FROM 注文 AS O
JOIN 廃番商品 AS D
ON O.商品コード = D.商品コード
WHERE O.商品コード = 'A0009'
  AND  O.注文日 > D.廃番日;

-- 63
SELECT G.商品コード, G.商品名, G.単価, O.注文日, O.注文番号, O.数量, (G.単価*O.数量) AS 売上金額
FROM 商品 AS G
JOIN 注文 AS O
ON G.商品コード = O.商品コード
WHERE G.商品コード = 'S0604'
ORDER BY O.注文番号 ASC;

-- 64
SELECT O.商品コード, G.商品名
FROM 商品コード AS O
JOIN 注文 AS G
ON O.商品コード = G.商品コード
WHERE O.注文日 >= '2016-08-01' AND O.注文日 <= '2016-08-31';

-- 65
SELECT O.商品コード, COALESCE(G.商品名, '廃番') AS 商品名
FROM 注文 AS O
LEFT JOIN 商品 AS G
ON O.商品コード = G.商品コード
WHERE O.注文日 >= '2016-08-01' AND O.注文日 <= '2016-08-31';

-- 66
SELECT O.注文日, G.商品コード || ':' || G.商品名 AS 商品, COALESCE(O.数量,0) AS 数量
FROM 注文 AS O
JOIN 商品 AS G
ON O.商品コード = G.商品コード
WHERE G.商品コード = '3';

-- 67
SELECT O.注文日, COALESCE(G.商品コード || ':' || G.商品名, G.商品コード || ':' || G.商品名, '(廃番済み)') AS 商品, COALESCE(O.数量,0) AS 数量
FROM 注文 AS O
FULL JOIN 商品 AS G
ON O.商品コード = G.商品コード
WHERE G.商品コード = '3';

-- 68
SELECT O.注文日, O.注文番号, O.注文枝番, O.商品コード, COALESCE(G.商品名, D.商品名) AS 商品名, COALESCE(G.単価, D.単価) AS 単価, 
       COALESCE(G.単価, D.単価) AS 単価, O.数量 AS 数量, COALESCE(G.単価, D.単価)*O.数量 - COALESCE(O.クーポン割引料, 0) AS 注文金額
FROM 注文 AS O
LEFT JOIN 商品 AS G
ON O.商品コード = G.商品コード
LEFT JOIN 廃番商品 AS D
ON T.商品コード = D.商品コード
WHERE O.注文番号 = '2-170430010'

-- 69
SELECT G.商品コード, G.商品名, G.単価, COALESCE(O.数量, 0) AS 売上送料, G.単価*COALESCE(O.数量, 0) AS 総販売金額
FROM 商品 AS G
LEFT JOIN (SELECT 商品コード, SUM(数量) AS 数量 
           FROM 注文 
           WHERE 商品コード LIKE 'B%' 
           GROUP BY 商品コード) AS O
ON G.商品コード = O.商品コード
WHERE G.商品コード LIKE 'B%'
ORDER BY G.商品コード


-- 70
SELECT G1.商品コード, G1.商品名, G2.商品コード AS 関連商品コード, G2.商品名 AS 関連商品名
FROM 商品 AS G1
JOIN 商品 AS G2
ON G1.商品コード = G2.商品コード 
       
