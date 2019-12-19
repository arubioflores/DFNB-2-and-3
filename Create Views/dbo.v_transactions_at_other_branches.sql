USE DFNB2
GO

DROP VIEW IF EXISTS [dbo].[v_transactions_at_other_branches];
GO

CREATE VIEW v_transactions_at_other_branches
AS
(
    SELECT cd.[cust_id], 
           (cd.[cust_first_name] + ' ' + [cust_last_name]) AS customer_name,
           cd.[primary_branch_id] AS primary_branch,
           tf.[branch_id] AS trans_branch,
		   COUNT(tf.[transaction_date]) AS #_of_transactions,
		   case when cd.[primary_branch_id] = tf.[branch_id] then 'YES'
		   else 'NO'
		   END AS 'primary_branch_?'
    FROM [dbo].[t_customer_dim] AS cd
         JOIN [dbo].[t_customer_account_dim] AS cad ON cd.cust_id = cad.cust_id
         JOIN [dbo].[t_transaction_fact] AS tf ON tf.acct_id = cad.acct_id
    WHERE cd.[cust_id] <> '-1'
    GROUP BY cd.[cust_id], 
             (cd.[cust_first_name] + ' ' + [cust_last_name]),
             cd.[primary_branch_id],
             tf.[branch_id]
);