/*****************************************************************************************************************
NAME:    Data_Output.sql
PURPOSE: Display data to create reports from

SUPPORT: Alex Rubio 
         rubioalejandro1114@gmail.com
         aar43@ldsbc.edu

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/18/2019   ARUBIO      1. Built query to display data



RUNTIME: 
1 min

NOTES: 
(...)

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/
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
