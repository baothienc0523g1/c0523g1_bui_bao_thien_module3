CREATE DATABASE ss01;
USE ss01;
CREATE TABLE teacher(
id int primary key auto_increment,
`name` varchar(55),
age int,
country varchar(55)
);

CREATE TABLE class(
id int primary key auto_increment,
`name` varchar(55)
);

INSERT INTO teacher(`name`, age, country)
VALUES 
("Nguyen Van A", 18, "VN"),
("Nguyen Van B", 19, "Laos"),
("Nguyen Van C", 20, "China"),
("Nguyen Van D", 21, "Thais"),
("Nguyen Van E", 22, "Malay");

SELECT * FROM teacher;

INSERT INTO class(`name`)
VALUES
("C0523G1"),
("C0623G1"),
("C0723G1");

SELECT * FROM class;

ALTER TABLE class RENAME class_room;
