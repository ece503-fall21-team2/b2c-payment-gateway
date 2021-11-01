CREATE
DATABASE b2c_payment_gateay;
CREATE
EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE customer_data
(
    name          VARCHAR(100) NOT NULL,
    email_address VARCHAR(200) NOT NULL UNIQUE,
    phone_number  VARCHAR(20),
    password      VARCHAR(20),
    customer_uuid uuid DEFAULT uuid_generate_v4() PRIMARY KEY
);

CREATE TABLE card_information
(
    card_uuid        uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    name_on_card     VARCHAR(100) NOT NULL,
    card_type        VARCHAR(20)  NOT NULL,
    card_number      VARCHAR(16)  NOT NULL,
    expiration_month INT,
    expiration_year  INT,
    customer_uuid    uuid references customer_data (customer_uuid)
);
CREATE TABLE merchant_details
(
    merchant_name                VARCHAR(100),
    merchant_type                VARCHAR(100),
    merchant_bank_name           VARCHAR(100),
    merchant_bank_account_number VARCHAR(20),
    merchant_uuid                uuid DEFAULT uuid_generate_v4() PRIMARY KEY
);

CREATE TABLE transaction_category
(
    category_uuid uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    category_name VARCHAR(10)
);

CREATE TABLE
    transaction_history
(
    transaction_type  VARCHAR(100),
    status            VARCHAR(100),
    created_timestamp TIMESTAMP,
    category_uuid     uuid references transaction_category (category_uuid),
    customer_uuid     uuid references customer_data (customer_uuid),
    merchant_details  uuid references merchant_details (merchant_uuid),
    card_uuid         uuid references card_information (card_uuid)
);

