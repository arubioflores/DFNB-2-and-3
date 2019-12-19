USE DFNB2
GO

DROP VIEW IF EXISTS [dbo].[v_fees_per_branch];
GO
CREATE VIEW v_fees_per_branch
AS
(
    SELECT bd.branch_description, 
           CONVERT(DECIMAL(15, 3), SUM(tf.[transaction_amt])) AS total_of_transactions, 
           SUM(tf.[transaction_fee_amt]) AS total_of_fees, 
           CONVERT(DECIMAL(3, 2), (SUM(tf.[transaction_fee_amt]) / SUM(tf.[transaction_amt]) * 100)) AS percentual
    FROM [dbo].[t_transaction_fact] AS tf
	JOIN [dbo].[t_branch_dim] AS bd ON tf.branch_id = bd.branch_id
    GROUP BY bd.branch_description
);