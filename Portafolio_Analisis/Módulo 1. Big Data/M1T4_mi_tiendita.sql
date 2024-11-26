DROP DATABASE IF EXISTS mi_tiendita;

CREATE DATABASE mi_tiendita;

USE mi_tiendita;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
id INT NOT NULL,
firstname VARCHAR(20),
lastname VARCHAR(20),
password VARCHAR(20),
email VARCHAR(50),
PRIMARY KEY (id)
);

INSERT INTO users VALUES (1,  'Roberto', 'Fernández', 'rob_05%Rt', 'roberto@gmail.com'),
						 (2, 'Fernanda', 'Torres', 'fer_09_Up#1', 'torres.f@gmail.com'),
                         (3, 'Martha', 'Esquivel', 'm_854_QlB%5', 'esq.martha@hotmail.com'),
                         (4, 'Daniel', 'Olivares', 'Y_lK//7&6', 'oliv.dan@gmail.com'),
                         (5, 'Pablo', 'Estrada', '9Ty-04#2_E', 'estrada.pab@outlook.com');

DROP TABLE IF EXISTS addresses;

CREATE TABLE addresses (
user_id INT NOT NULL,
id INT NOT NULL,
country VARCHAR(25),
state VARCHAR(30),
city VARCHAR(40),
address VARCHAR(100),
zip VARCHAR(45),
PRIMARY KEY(user_id, id),
CONSTRAINT FK_USER FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO addresses VALUES (1, 1, 'US', 'Nevada', 'Las Vegas', 'Flowers Street #417, Col. Blue Gardens', '073Bt#7'),
                             (1, 2, 'MX', 'Michoacán', 'Morelia', 'Avenida de los tulipanes # 15, col. Linda Vista', '0r_%8wQ'),
                             (4, 2, 'MX', 'Baja California Norte', 'Mexicali', 'Avenida Campestre # 4, Col. La GaviaIII', 'hGm_&$i8'),
                             (3, 1, 'MX', 'Quitana Roo', 'Cancún', 'Avenida de los Cuervos # 116, Col. Independencia', '94Rf/4%1'),
                             (5, 3, 'MX', 'Sinaloa', 'Culiacán', 'Avenida primavera # 37, Col. Campo Azul', 'EwY_p54Q');

DROP TABLE IF EXISTS payment_methods;

CREATE TABLE payment_methods(
id INT NOT NULL,
name VARCHAR(20),
PRIMARY KEY (id)
);

INSERT INTO payment_methods VALUES (1, 'Cash'),
                                   (2, 'Credit/Debit Card'),
                                   (3, 'PayPal'),
                                   (4, 'Bitcoin'), 
                                   (5, 'SPEI');

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
id INT NOT NULL,
user_id INT NOT NULL, 
payment_method_id INT NOT NULL,
timestamp DATETIME,
PRIMARY KEY (id),
CONSTRAINT FK_PAYMENT_METHOD_ID FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id)
);

INSERT INTO orders VALUES (500, 3, 4, '2023-11-04 08:15:04'), 
                          (322, 1, 5, '2023-12-23 15:08:57'),
                          (479, 5, 2, '2024-02-14 7:12:33'),
                          (117, 1, 1, '2024-03-26 16:03:11'),
                          (603, 2, 4, '2024-06-13 20:17:26');

DROP TABLE IF EXISTS categories;

CREATE TABLE categories(
id INT NOT NULL,
PRIMARY KEY (id),
name VARCHAR(30)
);

INSERT INTO categories VALUES (1, 'Fruits and vegetables'),
							  (2, 'Meats'), 
                              (3, 'Dairy products'),
                              (4, 'Garden products'),
                              (5, 'Kitchen products');

DROP TABLE IF EXISTS products;

CREATE TABLE products(
id INT NOT NULL, 
PRIMARY KEY (id),
name VARCHAR(30),
description VARCHAR(60),
price FLOAT,
stock INT,
category_id INT NOT NULL,
CONSTRAINT FK_CATEGORY_ID FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO products VALUES (4, 'Apples', 'red and juicy apples', 45.50, 23, 1),
                            (9, 'Rib Eye', 'Delicious Rib Eye for cooking in grills', 155.80, 12, 2),
                            (2, 'Lawnmower', 'lawnmower for cutting the garden´s tall grass', 1500.25, 4, 4),
                            (6, 'Knife', 'Large knife for cutting meat quickly', 60.75, 29, 5), 
                            (7, 'Spoons', 'short spoons for eating small meals', 32.99, 33, 5);

DROP TABLE IF EXISTS product_details;

CREATE TABLE product_details(
order_id INT AUTO_INCREMENT,
product_id INT NOT NULL,
count INT,
CONSTRAINT FK_ORDER_ID FOREIGN KEY (order_id) REFERENCES orders(id),
CONSTRAINT FK_PRODUCT_ID FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO product_details VALUES(322, 6, 7),
								  (322, 4, 10),
                                  (322, 7, 5),
                                  (500, 2, 1),
                                  (479, 9, 2);
