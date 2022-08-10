--Oracle, DB2
--DDL��������
CREATE TABLE Skills 
(skill VARCHAR(32),
 PRIMARY KEY(skill));

CREATE TABLE EmpSkills 
(emp   VARCHAR(32), 
 skill VARCHAR(32),
 PRIMARY KEY(emp, skill));

--DML����������

INSERT INTO Skills VALUES('Oracle');
INSERT INTO Skills VALUES('UNIX');
INSERT INTO Skills VALUES('Java');

INSERT INTO EmpSkills VALUES('����', 'Oracle');
INSERT INTO EmpSkills VALUES('����', 'UNIX');
INSERT INTO EmpSkills VALUES('����', 'Java');
INSERT INTO EmpSkills VALUES('����', 'C#');
INSERT INTO EmpSkills VALUES('����', 'Oracle');
INSERT INTO EmpSkills VALUES('����', 'UNIX');
INSERT INTO EmpSkills VALUES('����', 'Java');
INSERT INTO EmpSkills VALUES('ƽ��', 'UNIX');
INSERT INTO EmpSkills VALUES('ƽ��', 'Oracle');
INSERT INTO EmpSkills VALUES('ƽ��', 'PHP');
INSERT INTO EmpSkills VALUES('ƽ��', 'Perl');
INSERT INTO EmpSkills VALUES('ƽ��', 'C++');
INSERT INTO EmpSkills VALUES('���ﲿ', 'Perl');
INSERT INTO EmpSkills VALUES('����', 'Oracle');

COMMIT;