DROP  TABLE IF EXISTS bank_details;

CREATE  TABLE bank_details(
    account_number INT,
    account_holder VARCHAR(225),
    transaction_date date ,
    transaction_type VARCHAR(225) ,
    transaction_amount INT
);



SELECT *FROM bank_details;


INSERT INTO bank_details (
    account_number,
    account_holder,
    transaction_date,
    transaction_type,
    transaction_amount
) VALUES
    (1001, 'Ravi Sharma', '2023-07-01', 'Deposit', 5000),
    (1001, 'Ravi Sharma', '2023-07-05', 'Withdrawal', 1000),
    (1001, 'Ravi Sharma', '2023-07-10', 'Deposit', 2000),
    (1002, 'Priya Gupta', '2023-07-02', 'Deposit', 3000),
    (1002, 'Priya Gupta', '2023-07-08', 'Withdrawal', 500),
    (1003, 'Vikram Patel', '2023-07-04', 'Deposit', 10000),
    (1003, 'Vikram Patel', '2023-07-09', 'Withdrawal', 2000);
    
SELECT 
    account_number,
    account_holder,
    sum(CASE WHEN transaction_type='Deposit' THEN transaction_amount 
            ELSE -transaction_amount
        END)
FROM bank_details

GROUP BY 
    account_number,
    account_holder;
    
