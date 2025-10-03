CREATE DATABASE IF NOT EXISTS `dev_atlas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'dev_atlas'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `dev_atlas`.* TO 'dev_atlas'@'localhost';
