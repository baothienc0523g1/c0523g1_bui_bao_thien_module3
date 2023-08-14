CREATE DATABASE ss04_thuc_hanh_1;
USE ss04_thuc_hanh_1;
CREATE TABLE Classs
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Students
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Classs (ClassID)
);
CREATE TABLE Subjects
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subjects (SubId),
    FOREIGN KEY (StudentId) REFERENCES Students (StudentId)
);

select Address, count(StudentID) as "So luong hoc vien"
from Students
group by Address;

select s.StudentID, s.StudentName, AVC(Mark)
from Student as s 
join Mark as m 
on s.StudentID = m.StudentID
group by s.StudentID, S.StudentName
having avr(Mark) > 15;

select s.StudentID, s.StudentName, AVC(Mark)
from Student as s 
join Mark as m 
on s.StudentID = m.StudentID
group by s.StudentID, s.StudentName
having avg(Mark) >= all (select avg(Mark) from Mark group by Mark.StudentID);
