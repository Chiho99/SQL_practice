-- 62
SELECT X.ルート番号, X.イベント番号, E.イベント名称 AS イベント名称, X.クリア結果
FROM 経験イベント AS X
JOIN イベント AS E
ON X.イベント番号 = E.イベント番号
WHERE X.クリア区分 = '1'
ORDER BY E.ルート番号;

-- 63
SELECT E.イベント番号, E.イベント名称, X.クリア区分 AS パーティのクリア区分
FROM イベント AS E
JOIN 経験イベント AS X
ON E.イベント番号 = X.イベント番号
WHERE E.タイプ = '1';

-- 64
SELECT E.イベント番号, E.イベント名称, COALESCE(X.クリア区分, '未クリア') AS クリア区分
FROM イベント AS E
LEFT JOIN 経験イベント AS X
ON E.イベント番号 = X.イベント番号
WHERE E.タイプ = '1';

-- 65
SELECT P.ID, P.名称 AS なまえ, C1.コード名称 AS 職業,  C2.コード名称 AS 状態
FROM パーティ AS P
JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = 1) AS C1
ON P.状態コード = C1.コード値
JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = 2) AS C2
ON P.状態コード = C2.コード値
ORDER BY ID;

-- 66
SELECT P.ID, COALESCE(P.名称, '仲間になっていない!') AS なまえ, C.コード名称 AS 職業
FROM パーティ AS P
RIGHT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = 1) AS C
ON P.状態コード = C.コード値;

-- 67
SELECT X.イベント番号, X.クリア区分, C.コード値 || ':' || C.コード名称 AS クリア結果
FROM 経験イベント AS X
FULL JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = 4) AS C
ON X.クリア結果 = C.コード値;

-- FULL JOINと同じ右テーブルと左テーブルの全て
-- SELECT X.イベント番号, X.クリア区分, X.クリア結果|| ':' || C.コード名称 AS クリア結果
-- FROM 経験イベント AS X
-- LEFT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = 4) AS C
-- ON X.クリア結果 = C.コード値
-- UNION 
-- SELECT X.イベント番号, X.クリア区分, C.コード値 || ':' || C.コード名称 AS クリア結果
-- FROM 経験イベント X
-- RIGHT JOIN (SELECT コード値, コード名称 FROM コード WHERE コード種別 = 4) AS C
-- ON X.クリア結果 = C.コード値

-- 68
SELECT E1.イベント番号, E1.イベント名称, E1.前提イベント番号, E2.イベント名称 AS 前提イベント名称
FROM イベント AS E1
JOIN イベント AS E2
ON E1.前提イベント番号 = E2.イベント番号
WHERE E1.前提イベント番号 IS NOT NULL;

-- 69
SELECT E1.イベント番号, E1.イベント名称, E1.前提イベント番号, E2.イベント名称 AS 前提イベント名称, E1.後続イベント番号, E3.イベント名称 AS 後続イベント名称
FROM イベント AS E1
LEFT JOIN イベント AS E2
ON E1.前提イベント番号 = E2.イベント番号
LEFT JOIN イベント AS E3
ON E1.前提イベント番号 = E3.前提イベント番号
WHERE E1.前提イベント番号 IS NOT NULL OR E1.後続イベント番号 IS NOT NULL;

-- 70
SELECT E1.イベント番号, E1.イベント名称, E2.前提イベント数
FROM イベント AS E1
JOIN (SELECT 前提イベント番号, COUNT(前提イベント番号) AS 前提イベント数 FROM イベント
    WHERE 前提イベント番号 IS NOT NULL GROUP BY 前提イベント番号) AS E2
ON E1.イベント番号 = E2.前提イベント番号
ORDER BY E.イベント番号;