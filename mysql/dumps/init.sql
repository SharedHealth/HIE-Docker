CREATE DATABASE terminologies;
CREATE USER 'terminologies'@'%' IDENTIFIED BY 'password';
GRANT ALL ON terminologies.* TO 'terminologies'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

CREATE DATABASE datasense;
CREATE USER 'datasense'@'%' IDENTIFIED BY 'password';
GRANT ALL ON datasense.* TO 'datasense'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;