create table class(
Id int primary key auto_increment,
className varchar(100) not null unique,
startDate datetime not null,
status bit(1) not null
);

create table student(
id int primary key auto_increment,
studentName varchar(100) not null,
address varchar(255) not null,
phone varchar(11) not null,
classId int not null,
foreign key (classId) references class(Id),
status bit(1) not null
);

create table subject(
id int primary key auto_increment,
subjectName varchar (100),
credit int not null,
status bit(1) not null
);

create table mark (
markId int auto_increment primary key ,
studentId int not null ,
subjectId int not null ,
mark double not null,
examTime datetime not null  
);

insert into class (className,startDate,status)
values ("bodoi",'2022-01-30',1),
("congan",'2024-02-21',1),
("canhsat",'2021-06-19',1);
insert into student (studentName,address,phone,classId,status)
values ("duong mom","ha noi","0123456789",1,1),
("sep minh","ha nam","0987123456",1,1),
("tho huynh","ha tinh","0987654321",2,1);
insert into subject (subjectName,credit,status)
values ("Toán",3,1),
("Văn",3,1),
("Anh",2,1);
insert into mark (studentId,subjectId,mark,examTime)
values (1,1,7,'2020-05-19'),
(1,1,7,'2022-03-30'),
(2,2,8,'2024-05-23'),
(2,3,9,'2020-03-24'),
(3,3,10,'2021-02-21');

select * from class
order by className desc ;

select * from student
where address = "Hà Nội" ;

select * from student
inner join class on student.classId = class.classId
where className = "HN-JV231103" ;

select * from subject
where credit > 2 ;

select * from student
where phone like '09%';
