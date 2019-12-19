USE DFNB2
GO

DROP VIEW IF EXISTS [dbo].[v_fees_per_account];
GO
CREATE VIEW v_fees_per_account
AS
(
    SELECT [acct_id], 
           CONVERT(DECIMAL(15, 3), SUM([transaction_amt])) AS total_of_transactions, 
           SUM([transaction_fee_amt]) AS total_of_fees, 
           CONVERT(DECIMAL(3, 2), (SUM([transaction_fee_amt]) / SUM([transaction_amt]) * 100)) AS percentual
    FROM [dbo].[t_transaction_fact]
    GROUP BY [acct_id]
);