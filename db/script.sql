CREATE DATABASE IF NOT EXISTS cms;
USE cms;

CREATE TABLE complaint (
                           cid         VARCHAR(40)  NOT NULL PRIMARY KEY,
                           uname       VARCHAR(100) NOT NULL,
                           subject     VARCHAR(255),
                           description TEXT,
                           date        VARCHAR(30)
);

CREATE TABLE user (
                      uid       INT AUTO_INCREMENT PRIMARY KEY,
                      uname     VARCHAR(100) NOT NULL,
                      upassword VARCHAR(20)  NOT NULL,
                      urole     VARCHAR(50) DEFAULT 'user' NOT NULL
);

INSERT INTO user (uname, upassword, urole)
VALUES
    ('testuser', 'password123', 'user'),
    ('admin', 'adminpass', 'admin');
