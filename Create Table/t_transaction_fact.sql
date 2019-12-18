/*****************************************************************************************************************
NAME:    t_transaction_fact.sql
PURPOSE: Create the t_account_dim table

SUPPORT: Alex Rubio 
         rubioalejandro1114@gmail.com
         aar43@ldsbc.edu

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/18/2019   ARUBIO      1. Built this table



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

DROP TABLE IF EXISTS t_transaction_fact;

CREATE TABLE t_transaction_fact ( 
             transaction_date    DATE NOT NULL , 
             transaction_time    TIME(7) NOT NULL , 
             branch_id           INT NOT NULL , 
             acct_id             INT NOT NULL , 
             transaction_type_id INT NOT NULL , 
             transaction_amt     INT NOT NULL , 
             transaction_fee_amt DECIMAL(15 , 3) NOT NULL
                                );
