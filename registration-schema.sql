drop database if exists registration;
create database registration;
use registration;

create table student (
                       student_id int primary key,
                       name varchar(256),
                       gpa double(3,2)
  );

create table dept(
                   dept_id char(8) primary key,
                   name varchar(32) not null unique,
                   dean varchar(256) not null,
                   building varchar(32),
                   room varchar(16)
);

create table course(
                     dept_id char(8),
                     course_id int,
                     name varchar(32) not null,
                     hours int not null,

                     primary key (dept_id, course_id),
                     foreign key (dept_id) references dept(dept_id)
                       on update cascade
                       on delete cascade
);

create table enrolled(
                       dept_id char(8),
                       course_id int,
                       student_id int,

                       primary key (dept_id, course_id, student_id),
                       foreign key (dept_id, course_id) references course(dept_id, course_id)
                         on update cascade
                         on delete cascade,
                       foreign key (student_id) references student(student_id)
                         on update cascade
                         on delete cascade
);

insert into student values (11,'Bush',3.0);
insert into student values (12,'Cruz',3.2);
insert into student values (13,'Clinton',3.9);
insert into student values (22,'Sanders',3.0);
insert into student values (33,'Trump',3.8);

insert into dept values ('CS','Computer Science','Rubio','Ajax',100);
insert into dept values ('Math','Mathemagics','Carson','Acme',300);
insert into dept values ('EE','Electrical Engineering','Kasich','Ajax',200);
insert into dept values ('IE','Industrial Engineering','Cruz','West',200);
insert into dept values ('Music','Musicology','Costello','North',100);

insert into course values ('CS',101,'Programming',4);
insert into course values ('CS',201,'Algorithms',3);
insert into course values ('CS',202,'Systems',3);
insert into course values ('Math',101,'Algebra',3);
insert into course values ('Math',201,'Calculus',4);
insert into course values ('Math',301,'Analysis',4);
insert into course values ('Music',104,'Jazz',3);
insert into course values ('EE',102,'Circuits',3);
insert into course values ('IE',101,'Proabability',3);
insert into course values ('IE',102,'Statistics',3);

insert into enrolled values ('CS',101,11);
insert into enrolled values ('Math',101,11);
insert into enrolled values ('CS',101,12);
insert into enrolled values ('CS',201,22);
insert into enrolled values ('Math',201,33);
insert into enrolled values ('EE',102,33);
insert into enrolled values ('Math',301,22);

