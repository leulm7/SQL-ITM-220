-- Create the account table
CREATE TABLE account (
    account_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    avail_balance DOUBLE NOT NULL,
    last_activity_date DATETIME NOT NULL
);

-- Create the transaction table
CREATE TABLE transaction (
    txn_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    txn_date DATETIME,
    account_id INT UNSIGNED,
    txn_type_cd VARCHAR(1) NOT NULL,
    amount DOUBLE
);

-- Insert initial data into account table
INSERT INTO account (account_id, avail_balance, last_activity_date) 
VALUES 
(123, 500, '2019-07-10 20:53:27'),
(789, 75, '2019-06-22 15:18:35');

-- Insert initial transactions (deposits) that created the initial balances
INSERT INTO transaction (txn_id, txn_date, account_id, txn_type_cd, amount) 
VALUES 
(1001, '2019-05-15 00:00:00', 123, 'C', 500),
(1002, '2019-06-01 00:00:00', 789, 'C', 75);

-- Start transaction to transfer $50 from account 123 to account 789
START TRANSACTION;

-- Insert debit transaction for account 123
INSERT INTO transaction (txn_id, txn_date, account_id, txn_type_cd, amount) 
VALUES (1003, '2020-11-29 15:02:35', 123, 'D', 50);

-- Update balance for account 123
UPDATE account 
SET avail_balance = avail_balance - 50, last_activity_date = '2020-11-29 15:13:29'
WHERE account_id = 123;

-- Insert credit transaction for account 789
INSERT INTO transaction (txn_id, txn_date, account_id, txn_type_cd, amount) 
VALUES (1004, '2020-11-29 15:03:04', 789, 'C', 50);

-- Update balance for account 789
UPDATE account 
SET avail_balance = avail_balance + 50, last_activity_date = '2020-11-29 15:16:13'
WHERE account_id = 789;

-- Commit the transaction
COMMIT;

-- Validate the transaction results
SELECT account_id, 
       SUM(
         CASE
           WHEN txn_type_cd = 'C' THEN amount
           WHEN txn_type_cd = 'D' THEN amount * -1
         END) AS account_balance
FROM transaction
WHERE account_id IN (123,789)
GROUP BY account_id;