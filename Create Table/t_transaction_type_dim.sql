Use DFNB2
GO


DROP TABLE IF EXISTS t_transaction_type_dim;

CREATE TABLE t_transaction_type_dim ( 
             transaction_type_id     INT NOT NULL , 
             transaction_type_code   VARCHAR(3) NOT NULL , 
             transaction_type_desc   VARCHAR(100) NOT NULL , 
             transaction_fee_prct    DECIMAL(4 , 3) NOT NULL , 
             cur_cust_req_ind VARCHAR(1) NOT NULL CONSTRAINT PK_t_transaction_type_dim PRIMARY KEY CLUSTERED(transaction_type_id ASC)
                                    );