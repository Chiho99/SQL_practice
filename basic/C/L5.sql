-- 45
SELECT MAX(HP) AS 最大HP, MIN(HP) AS 最初HP, AVG(HP) AS 平均HP, 
        MAX(MP) AS 最大MP, MIN(MP) AS 最大MP, AVG(MP) AS 平均MP
FROM パーティー;

-- 46
SELECT 
COUNT(CASE タイプ WHEN 1 THEN '強制'
           WHEN 2 THEN 'フリー'
           WHEN 3 THEN '特殊'
END)
FROM イベント
GROUP BY タイプ;

-- 47
SELECT COUNT(クリア結果)
FROM 経験イベント
WHERE クリア結果 IS NOT NULL
ORDER BY クリア結果;

-- 48
SELECT 
CASE WHEN sum(MP) < 500 THEN '「敵は見とれている！」'
     WHEN sum(MP) >= 500 AND sum(MP) < 1000 THEN '「敵は呆然としている!」'
     WHEN sum(MP) >= 1000 THEN '「敵はひれ伏している!」'
END AS 小さな奇跡
FROM パーティー;

-- 49
SELECT 
CASE WHEN クリア区分 = '0' THEN 'クリアした'
     WHEN クリア区分 = '1' THEN '参加したがクリアしていない'
END AS 区分, COUNT(イベント番号) AS イベント数
FROM 経験イベント
GROUP BY クリア区分

-- 50
SELECT SUBTRING(職業コード, 1, 1) AS 職業タイプ, MAX(HP) AS 最大HP, MIN(HP) AS 最初HP, AVG(HP) AS 平均HP, 
        MAX(MP) AS 最大MP, MIN(MP) AS 最大MP, AVG(MP) AS 平均MP
FROM パーティー
GROUP BY SUBTRING(職業コード, 1, 1);

-- 51
SELECT SUBSTRING(ID, 1, 1) AS IDによる分類, AVG(HP) AS HPの平均, AVG(MP) AS MPの平均
FROM パーティー
GROUP BY SUBSTRING(ID, 1, 1)
HAVING AVG(HP) > 100;

-- 52
SELECT SUM
(CASE WHEN HP < 100 THEN 1
     WHEN HP >= 100 AND HP < 150 THEN 2
     WHEN HP >= 150 AND HP < 200 THEN 3
     WHEN HP >= 200 THEN 5
END) AS 開けられる扉の数
FROM パーティー;




