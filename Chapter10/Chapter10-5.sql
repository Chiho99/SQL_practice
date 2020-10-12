-- 原子性を確保するため、トランザクションを使用すること
-- 外部キー制約違反を防ぐため、[学生の所属変更]⇒[学部の削除]の順番で処理

BEGIN;
UPDATE 学生 SET 学部ID = 'K'
    WHERE 学部ID = 'R';
DELETE FROM 学部
    WHERE ID = 'R';
COMMIT;