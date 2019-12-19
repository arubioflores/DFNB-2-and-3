USE DFNB2
GO


DROP VIEW IF EXISTS [dbo].[v_transactions_volume];
GO
CREATE VIEW v_transactions_volume
AS
(
    SELECT bd.[branch_code], 
           ttd.[transaction_type_desc], 
           COUNT(tf.[transaction_date]) AS number_of_transactions
    FROM [dbo].[t_transaction_fact] AS tf
         LEFT JOIN [dbo].[t_branch_dim] AS bd ON tf.branch_id = bd.branch_id
         JOIN [dbo].[t_transaction_type_dim] AS ttd ON tf.transaction_type_id = ttd.transaction_type_id
	WHERE DATEPART(year, tf.[transaction_date]) = 2019
    GROUP BY bd.[branch_code], 
             ttd.[transaction_type_desc], 
             DATEPART(year, tf.[transaction_date])
);