-- 24
SELECT 口座番号, 名義, 種別, 残高, 更新日
FROM 口座
ORDER BY 口座番号 ASC;

-- 25
SELECT DISTINCT 名義
FROM 口座
ORDER BY 名義 ASC;

-- 26
SELECT 口座番号, 名義, 種別, 残高, 更新日
FROM 口座
ORDER BY 4 DESC, 1 ASC;

-- 27
SELECT 更新日
  FROM 口座
 WHERE 更新日 IS NOT NULL
 ORDER BY 更新日
        OFFSET 0
 FETCH FIRST 10 ROWS ONLY;

--  28
SELECT 更新日, 残高
FROM 口座
WHERE 残高 > 0
AND 更新日 IS NOT NULL
ORDER BY 残高, 更新日 DESC OFFSET 10
FETCH FIRST 10 ROWS ONLY;
