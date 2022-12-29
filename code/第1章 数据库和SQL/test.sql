CREATE TABLE Addressbook
(
    regist_no INTEGER NOT NULL,
    name VARCHAR(128) NOT NULL,
    address VARCHAR(128) NOT NULL,
    tel_no CHAR(10) ,
    mail_address CHAR(20),
    PRIMARY KEY (regist_no)
);

SELECT * FROM Addressbook;

ALTER TABLE Addressbook ADD postal_code CHAR(8) NOT NULL;

DROP TABLE Addressbook;