CREATE TABLE transaction(
    trs_id INT PRIMARY KEY,
    trs_date date NOT NULL,
    amount FLOAT NOT NULL,
    vendor varchar(30)
);

CREATE TABLE category(
    cat_id INT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    type VARCHAR(10) NOT NULL
);

CREATE TABLE in_category(
    trs_id INT,
    cat_id INT,
    PRIMARY KEY (trs_id, cat_id),
    FOREIGN KEY (trs_id)
        REFERENCES transaction (trs_id),
    FOREIGN KEY (cat_id)
        REFERENCES category (cat_id)
);
