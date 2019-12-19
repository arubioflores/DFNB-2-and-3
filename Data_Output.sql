USE DFNB2
GO


SELECT *
FROM [dbo].[v_all_transactions];

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_fees_per_account]
ORDER BY 3 DESC, 
         4 DESC, 
         1;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_fees_per_branch]
ORDER BY 3 DESC, 
         4 DESC, 
         1;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_transaction_type];

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_transactions_at_other_branches]
ORDER BY 1, 
         2;

/*******************************************************************************************/

USE [DFNB2];
SELECT *
FROM [dbo].[v_transactions_volume]
ORDER BY 3, 
         2, 
         1;