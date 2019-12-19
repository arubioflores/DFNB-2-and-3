USE DFNB2
GO

DROP VIEW IF EXISTS [dbo].[v_all_loans];
GO
CREATE VIEW v_all_loans
AS
(
    SELECT ad.[primary_cust_id], 
           (cd.cust_first_name + ' ' + cd.cust_last_name) AS cust_name, 
           cd.cust_since_date, 
           cd.address_id AS cust_address_id, 
           ad1.latitude AS cust_add_latitude, 
           ad1.longitude AS cust_add_longitude, 
           ad.[acct_id], 
           ad.[acct_open_date], 
           ad.[loan_amt], 
           ad.[product_id], 
           ad.[branch_id], 
           bd.branch_code, 
           bd.branch_description, 
           bd.address_id AS branch_address_id, 
           ad2.latitude AS branch_add_latitude, 
           ad2.longitude AS branch_add_longitude, 
           bd.region_id, 
           bd.area_id
    FROM [dbo].[t_account_dim] AS ad
         JOIN [dbo].[t_customer_dim] AS cd ON ad.primary_cust_id = cd.cust_id
         JOIN [dbo].[t_branch_dim] AS bd ON ad.branch_id = bd.branch_id
         JOIN [dbo].[t_address_dim] AS ad1 ON cd.address_id = ad1.address_id
         JOIN [dbo].[t_address_dim] AS ad2 ON bd.address_id = ad2.address_id
);