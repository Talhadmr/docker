CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'tdemir'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'tdemir'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';
