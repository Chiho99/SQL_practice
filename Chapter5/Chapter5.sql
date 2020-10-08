-- 計算式
INSERT INTO テーブル名(列名)
    VALUES(計算式);

UPDATE テーブル名
    SET 列名 = 計算式;

-- CASE演算子
-- 1
CASE 評価する列や式 WHEN 値1 THEN 値１のときに返す値
                   WHEN 値2 THEN 値2のときに返す値
                   ELSE デフォルト値
END;

-- 2
CASE WHEN 条件1 THEN 条件1のときに返す値
     WHEN 条件2 THEN 条件2のときに返す値
     ELSE デフォルト値
END;

-- LENGTH関数
-- 長さの指定
SELECT 列名, LENGTH(列名) AS 列名の長さ
FROM テーブル名;

SELECT 列名, LENGTH(列名) AS 列名の長さ
FROM テーブル名
WHERE LENGTH(列名) <= 文字数(バイト数);

-- TRIM / LTRIM / RTRIM
-- 空白除去
SELECT 列名, TRIM(列名) AS 空白除去した列名
FROM テーブル名;

-- REPLACE関数
-- 文字列を置換する関数
UPDATE テーブル名
SET 列名 = REPLACE(置換対象の文字列, 置換前の文字列, 置換後の文字列);

-- SUBSTRING / SUBSTR
-- 一部を抽出する
SELECT 列名 
FROM テーブル名
SUBSTRING(文字列を表す列, 抽出を開始する位置, 抽出する文字の数)


-- CONCAT関数
-- 文字列を連結する
SELECT CONCAT(列名, ':' || 列名)
FROM テーブル名;

-- ROUND関数
-- 指定桁で四捨五入
SELECT 列名, ROUND(数値を表す列名, 有効とする桁数)
FROM テーブル名


-- TRUNC関数
-- 指定桁数で切り捨てる
SELECT 列名, TRUNC(数値を表す列名, 有効とする桁数)
FROM テーブル名


-- POWER関数
-- べき乗を計算する関数
POWER(数値を表す列名, 何乗するかを指定する数値)
FROM テーブル名;


-- CURRENT_DATE
-- 現在の日付を得る
INSERT INTO テーブル名
VALUES(CURRENT_DATE, '列名1', '列名2', '列名3');

-- CAST関数
-- データ型を変換する関数
CAST(変換する値 AS 変換する型);


-- COALESCE関数
-- 最初に登場するNULLでない値を返す
SELECT COALESCE('A', 'B', 'C');     /* 結果は 'A' */
SELECT COALESCE(NULL, 'B', 'C');     /*結果は 'B'*/
SELECT COALESCE(NULL, 'B', NULL);     /*結果は 'B'*/
SELECT COALESCE(NULL, NULL, 'C');     /*結果は'C'*/
SELECT COALESCE(数値型の列, 0);     /*結果は 数値型の列 */


