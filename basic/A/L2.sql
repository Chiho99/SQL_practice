-- 9
SELECT *
FROM 口座
WHERE 口座番号 = '0037651';

-- 10
SELECT *
FROM 口座
WHERE 残高 > 0;

-- 11
SELECT *
FROM 口座
WHERE 口座番号 < '1000000';

-- 12
SELECT *
FROM 口座
WHERE 更新日　< '2018-01-01'

-- 13
SELECT *
FROM 口座
WHERE 残高 >= 1000000;

-- 14
SELECT
CASE 種別 WHEN '1' THEN '普通'
        　WHEN '2' THEN '当選'
        　WHEN '3' THEN '別段'
END AS 普通, 当選, 別段
FROM 口座
WHERE 種別 <> '普通';

-- 15
SELECT *
FROM 口座
WHERE 更新日 IS NULL;

-- 16
SELECT *
FROM 口座
WHERE 名義 LIKE '% ハシ %';

-- 17
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2018-01-01' AND '2018-01-31';

-- 18
SELECT *
FROM 口座
WHERE 種別 IN('2', '3');

-- 19
SELECT *
FROM 口座
WHERE 名義 IN('サカタ　リョウヘイ', 'マツモト ミワコ', 'ハマダ サトシ');

-- 20
SELECT *
FROM 口座
WHERE 更新日 BETWEEN '2017-12-30' AND '2018-01-04';

-- 21
SELECT *
FROM 口座
WHERE 残高 < 10000 
AND 更新日 IS NOT NULL;

-- 22
SELECT *
FROM 口座
WHERE 口座番号 LIKE '2______'
OR 名義 LIKE 'エ__%コ';

-- 23
-- 口座：口座番号
-- 取引：取引番号
-- 取引事由：取引事由ID


