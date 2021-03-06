USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    categories TEXT NOT NULL,
    is_deleted BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(50)  NOT NULL,
    UNIQUE (category),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS post_categories (
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

SELECT
    a.title,
    categories.category
FROM ads a
    JOIN post_categories pc
        ON a.id = pc.ad_id
    JOIN categories ON pc.category_id = categories.id;