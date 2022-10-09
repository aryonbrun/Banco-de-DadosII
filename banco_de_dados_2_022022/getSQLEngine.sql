-- Descobre a ENGINE usando no banco de dados

SELECT table_name, engine FROM information_schema.TABLES WHERE TABLE_SCHEMA = "transaction_rollback";

--//

show table status /g;