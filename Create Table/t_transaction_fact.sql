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