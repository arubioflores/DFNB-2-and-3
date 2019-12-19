USE DFNB2
GO

DROP VIEW IF EXISTS [dbo].[v_transaction_type];
GO
CREATE VIEW v_transaction_type
AS
(
    SELECT ttd.[transaction_type_desc], 
           COUNT(tf.[transaction_date]) AS number_of_transactions, 
           SUM(convert(decimal(15,0),tf.[transaction_amt])) AS transactions_amt
    FROM [dbo].[t_transaction_fact] AS tf
         JOIN [dbo].[t_transaction_type_dim] AS ttd ON tf.transaction_type_id = ttd.transaction_type_id
    GROUP BY ttd.[transaction_type_desc]
);