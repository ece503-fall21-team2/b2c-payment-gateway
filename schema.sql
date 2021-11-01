CREATE TABLE card_information (
name_on_card VARCHAR(100) NOT NULL,
card_type VARCHAR(100) NOT NULL,
card_number INT NOT NULL,
expiration_date DATE
);

CREATE TABLE customer data (
full_name VARCHAR(100) NOT NULL,
email_address VARCHAR(100) NOT NULL,
phone_number INT,
customer_password VARCHAR(15),
customer_uuid uuid NOT NULL
);

CREATE TABLE merchant_details (
merchant_name VARCHAR(100),
merchant_type VARCHAR(100),
merchant_bank_name VARCHAR(100),
merchant_bank_account_number INT,
merchant_uuid uuid NOT NULL
);

CREATE transaction_history_table(
transaction_type VARCHAR(100),
transaction_vendor VARCHAR(100),
transaction_status VARCHAR(100),
transaction_category VARCHAR(100),
transaction_timestamp TIME,
transaction_category_uuid uuid NOT NULL
);
