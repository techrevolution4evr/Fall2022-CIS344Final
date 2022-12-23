create database teachers_portal;
use teachers_portal;

create table students (
studentId int not null unique auto_increment,
studentName varchar(45) not null,
enrolledInCourseID int default 1,
grade float null,
primary key (studentId)
);

create table if not exists courses (
courseId int not null unique auto_increment,
courseName varchar(45) not null,
primary key (courseId)
);

insert into students (studentName, enrolledInCourseID, grade)
values("Maria Jozef", 1, 98),
      ("Linda Jones", 2, 89),
      ("John McGrail", 1, 98),
      ("Patty Luna", 2, 78);
      
insert into courses (courseName)
values("Database Design"),
	  ("Calculus"),
      ("Physics I");
      
	
delimiter //
create procedure studentsWithGrade()
begin
select *
from students
left join courses
on students.enrolledInCourseID = courses.courseId;
end //
delimiter  ;

call studentsWithGrade();



