-- Percona
CREATE TABLE IF NOT EXISTS wallet (
    id INT NOT NULL AUTO_INCREMENT,
    balance INT,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO wallet (balance) VALUES (FLOOR(RAND() * 10000));
INSERT INTO wallet (balance) VALUES (FLOOR(RAND() * 10000));
INSERT INTO wallet (balance) VALUES (FLOOR(RAND() * 10000));
INSERT INTO wallet (balance) VALUES (FLOOR(RAND() * 10000));
INSERT INTO wallet (balance) VALUES (FLOOR(RAND() * 10000));
