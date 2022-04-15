CREATE TABLE products (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name CHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name CHAR(255) NOT NULL,
	PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO products
VALUES
	(null, 'prod0'),
	(null, 'prod1'),
	(null, 'prod2'),
	(null, 'prod3'),
	(null, 'prod4'),
	(null, 'prod5');
	
INSERT INTO categories
VALUES
	(null, 'cat0'),
	(null, 'cat1'),
	(null, 'cat2'),
	(null, 'cat3'),
	(null, 'cat4'),
	(null, 'cat5');
	
CREATE TABLE product_categories (
	id_prod INT UNSIGNED NOT NULL,
	id_cat INT UNSIGNED NOT NULL,
	PRIMARY KEY (id_prod, id_cat)
) ENGINE = InnoDB;

INSERT INTO product_categories
VALUES
	(5, 2),
	(3, 4),
	(6, 3),
	(5, 5),
	(6, 2),
	(1, 2),
	(3, 1),
	(2, 1),
	(3, 6),
	(1, 1);

SELECT p.name, c.name FROM products p
LEFT JOIN product_categories pc ON p.id = pc.id_prod
LEFT JOIN categories c ON pc.id_cat = c.id
ORDER BY p.name ASC;

/*
+-------+------+
| name  | name |
+-------+------+
| prod0 | cat0 |
| prod0 | cat1 |
| prod1 | cat0 |
| prod2 | cat0 |
| prod2 | cat3 |
| prod2 | cat5 |
| prod3 | NULL |
| prod4 | cat1 |
| prod4 | cat4 |
| prod5 | cat1 |
| prod5 | cat2 |
+-------+------+
11 rows in set (0.00 sec)
*/