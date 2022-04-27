CREATE USER 'joao_pedro'@'localhost' IDENTIFIED BY 'juca12345';
CREATE DATABASE uvv CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON uvv.* to 'joao_pedro'@'localhost'; 
SYSTEM mysql -u joao_pedro -p
