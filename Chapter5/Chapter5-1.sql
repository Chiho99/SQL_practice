-- 1
UPDATE 試験結果
SET 午後1 AS 'A' = 80*4 - (86 + 68 + 91)
WHERE 受験者ID = 'SW1046';

UPDATE 試験結果
SET 論述 AS 'B' = 68*4 - ( 65+ 53 + 70)
WHERE 受験者ID = 'SW1350'

UPDATE 試験結果
SET 午前 AS 'A' = 56*4 - (59 + 56 + 36)
WHERE 受験者ID = 'SW1877'

-- 2
SELECT 受験者ID AS '合格者ID'
FROM 試験結果
WHERE 午前 >= 60 
AND 午前1 + 午後2 >= 120 
AND 論述 >= 平均点*4*0.3