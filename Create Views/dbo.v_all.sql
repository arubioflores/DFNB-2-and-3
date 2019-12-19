/*****************************************************************************************************************
NAME:    dbo.v_all.sql
PURPOSE: Create the dbo.v_all view

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

DROP VIEW IF EXISTS [dbo].[v_all];
GO
CREATE VIEW v_all
AS
(
    SELECT tf.transaction_date, 
           tf.transaction_time, 
           bd.branch_code, 
           bd.branch_description, 
    (
        SELECT [latitude]
        FROM [dbo].[t_address_dim]
        WHERE [address_id] = bd.address_id
    ) AS branch_latitude, 
    (
        SELECT [longitude]
        FROM [dbo].[t_address_dim]
        WHERE [address_id] = bd.address_id
    ) AS branch_longitude, 
           bd.area_id, 
           bd.region_id, 
           tf.acct_id, 
           bd1.branch_code AS primary_branch_code, 
           bd1.branch_description AS primary_branch_description, 
           concat(
    (
        SELECT cust_first_name
        FROM [dbo].[t_customer_dim]
        WHERE cust_id = ad.primary_cust_id
    ), ' ',
    (
        SELECT cust_last_name
        FROM [dbo].[t_customer_dim]
        WHERE [cust_id] = ad.primary_cust_id
    )) AS cust_name, 
           DATEPART(year,
    (
        SELECT cust_birth_date
        FROM [dbo].[t_customer_dim]
        WHERE cust_id = ad.primary_cust_id
    )) AS birth_year, 
    (
        SELECT cust_gender
        FROM [dbo].[t_customer_dim]
        WHERE cust_id = ad.primary_cust_id
    ) cust_gender, 
           ttd.transaction_type_desc, 
           tf.transaction_amt, 
           tf.transaction_fee_amt, 
           ttd.transaction_fee_prct
    FROM [dbo].[t_transaction_fact] AS tf
         LEFT JOIN [dbo].[t_transaction_type_dim] AS ttd ON tf.transaction_type_id = ttd.transaction_type_id
         LEFT JOIN [dbo].[t_branch_dim] AS bd ON tf.branch_id = bd.branch_id
         LEFT JOIN [dbo].[t_account_dim] AS ad ON tf.acct_id = ad.acct_id
         INNER JOIN [dbo].[t_customer_dim] AS cd ON ad.primary_cust_id = cd.cust_id
         INNER JOIN [dbo].[t_branch_dim] AS bd1 ON cd.primary_branch_id = bd1.branch_id
);
