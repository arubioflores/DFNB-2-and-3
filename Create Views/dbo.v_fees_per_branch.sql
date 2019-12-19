/*****************************************************************************************************************
NAME:    dbo.v_fees_per_branch.sql
PURPOSE: Create the dbo.v_fees_per_branch view

SUPPORT: Alex Rubio 
         rubioalejandro1114@gmail.com
         aar43@ldsbc.edu

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/18/2019   ARUBIO      1. Built this view
1.1       12/18/2019   ARUBIO      2. Added correct formatting



RUNTIME: 
1 min

NOTES: 
(...)

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

********************************************************************************************/
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
