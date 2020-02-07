DROP TABLE products;
DROP TABLE supplies;
DROP TABLE stocks;

CREATE TABLE supplies (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  contact_details TEXT
);

CREATE TABLE stocks (
  id SERIAL PRIMARY KEY,
  quantity INT
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  author VARCHAR(255),
  description TEXT,
  supplier_id INT REFERENCES supplies(id),
  stock_id INT REFERENCES stocks(id),
  buying_cost INT,
  retail_price INT
);
