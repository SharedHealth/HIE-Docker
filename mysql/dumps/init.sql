CREATE DATABASE terminologies;
CREATE USER 'terminologies'@'%' IDENTIFIED BY 'password';
GRANT ALL ON terminologies.* TO 'terminologies'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;