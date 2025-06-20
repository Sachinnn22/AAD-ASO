CREATE DATABASE IF NOT EXISTS systems;
USE systems;

CREATE TABLE user (
                      uid INT AUTO_INCREMENT PRIMARY KEY,
                      uname VARCHAR(100) NOT NULL UNIQUE,
                      upassword VARCHAR(255) NOT NULL,
                      urole ENUM('admin', 'user') NOT NULL
);

INSERT INTO user (uname, upassword, urole)
VALUES
    ('user1', 'user123', 'user'),
    ('user2', 'user2123', 'user'),
    ('admin', 'admin123', 'admin');

CREATE TABLE complaint (
                           cid INT AUTO_INCREMENT PRIMARY KEY,
                           uname VARCHAR(100) NOT NULL,
                           description TEXT NOT NULL,
                           date DATE NOT NULL,
                           status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending'
);
