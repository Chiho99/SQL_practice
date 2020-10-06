-- メールアドレス CHAR(30)
-- 国名 VARCHAR(20)
-- 性別 CHAR(1)
-- 年齢 INTGER

-- 1
UPDATE 回答者
SET 国名 = CASE SUBSTRING(TRIM(メールアドレス), LENGTH(TRIM(メールアドレス))-1, 2)
CASE  WHEN メールアドレス LIKE '%jp' THEN '日本'
      WHEN メールアドレス LIKE '%uk' THEN 'イギリス'
      WHEN メールアドレス LIKE '%cn' THEN '中国'
      WHEN メールアドレス LIKE '%fr' THEN 'フランス'
      WHEN メールアドレス LIKE '%vn' THEN 'ベトナム'
END

-- 2

SELECT  TRIM (メールアドレス) AS メールアドレス, 
CASE  WHEN 年齢 >= 20 AND 年齢 < 3O THEN '20代'
      WHEN 年齢 >= 30 AND 年齢 < 4O THEN '30代'
      WHEN 年齢 >= 40 AND 年齢 < 5O THEN '40代'
      WHEN 年齢 >= 50 AND 年齢 < 6O THEN '50代'
END
|| ':' ||
CASE 性別 WHEN 'M' THEN '男性'
          WHEN 'F' THEN '女性' END AS 属性

FROM 回答者

