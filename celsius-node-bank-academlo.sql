
----- 1
 SELECT
	cli."id",
	CONCAT_WS(', ', cli.first_name , cli.last_name) as full_name,
		cli.email,
	acc.account_no AS cuenta,
	acc.balance AS saldo
FROM
	clients AS cli
	left JOIN accounts AS acc ON cli."id" = acc.client_id
ORDER BY cli."id" ASC;

---- 2 
SELECT
	acc.account_no,
	CONCAT_WS ( ', ', cli.first_name, cli.last_name ) AS full_name,
	act."name" 
FROM
	accounts AS acc
	LEFT JOIN account_types AS act ON acc."type" = act."id"
	LEFT JOIN clients AS cli ON acc.client_id = cli."id"
	ORDER BY acc.account_no ASC;

---- 3
SELECT
	tra."id" AS TRANSACTION,
	trt."name" AS tyoe_transacction,
	tra.amount AS amounnt 
FROM
	transactions AS tra
	INNER JOIN transactions_types AS trt ON tra.transaction_type = trt."id" 
ORDER BY
	tra."id" ASC;

----- 4 
 SELECT
	trt."id" as transaction ,
	trt."name",
	trt.description,
	tra.amount,
	tra.trans_date 
FROM
	transactions_types AS trt
	LEFT JOIN transactions AS tra ON trt."id" = tra.transaction_type
	ORDER BY trt."id";


-- Handle Error View 
DROP VIEW IF EXISTS v_clients_accounts         ;
DROP VIEW IF EXISTS v_accounts_types           ;
DROP VIEW IF EXISTS v_transactions_detail      ;
DROP VIEW IF EXISTS v_transations_types_detail ; 


----- 1
create or replace view  v_clients_accounts as SELECT
	cli."id",
	CONCAT_WS(', ', cli.first_name , cli.last_name) as full_name,
		cli.email,
	acc.account_no AS cuenta,
	acc.balance AS saldo
FROM
	clients AS cli
	left JOIN accounts AS acc ON cli."id" = acc.client_id
ORDER BY cli."id" ASC;

---- 2 
create or replace view v_accounts_types as SELECT
	acc.account_no,
	CONCAT_WS ( ', ', cli.first_name, cli.last_name ) AS full_name,
	act."name" 
FROM
	accounts AS acc
	LEFT JOIN account_types AS act ON acc."type" = act."id"
	LEFT JOIN clients AS cli ON acc.client_id = cli."id"
	ORDER BY acc.account_no ASC;

---- 3
create or replace view v_transactions_detail as SELECT
	tra."id" AS TRANSACTION,
	trt."name" AS tyoe_transacction,
	tra.amount AS amounnt 
FROM
	transactions AS tra
	INNER JOIN transactions_types AS trt ON tra.transaction_type = trt."id" 
ORDER BY
	tra."id" ASC;

----- 4 
create or replace view v_transations_types_detail as SELECT
	trt."id" as transaction ,
	trt."name",
	trt.description,
	tra.amount,
	tra.trans_date 
FROM
	transactions_types AS trt
	LEFT JOIN transactions AS tra ON trt."id" = tra.transaction_type
	ORDER BY trt."id";

o 
