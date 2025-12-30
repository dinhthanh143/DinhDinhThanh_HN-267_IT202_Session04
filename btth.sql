create database if not exists btth_mini_4;
use btth_mini_4;


create table student (
    studentId int auto_increment primary key,
    fullName varchar(50) not null,
    dateOfBirth date not null,
    email varchar(50) not null unique
);


create table teacher (
    teacherId int auto_increment primary key,
    fullName varchar(50) not null,
    email varchar(50) not null unique
);

create table course (
    courseId int auto_increment primary key,
    courseName varchar(50) not null,
    description varchar(255),
    totalLessons int not null,
    credits int default 1,
    teacherId int not null,
    foreign key (teacherId) references teacher(teacherId)
);


create table enrollment (
    studentId int not null,
    courseId int not null,
    enrollDate date not null default (current_date),
    primary key (studentId, courseId),
    foreign key (studentId) references student(studentId),
    foreign key (courseId) references course(courseId)
);


create table score (
    studentId int not null,
    courseId int not null,
    progressScore decimal(4,2) not null default 0,
    finalScore decimal(4,2) not null default 0,
    primary key (studentId, courseId),
    foreign key (studentId) references student(studentId),
    foreign key (courseId) references course(courseId),
    check (progressScore between 0 and 10),
    check (finalScore between 0 and 10)
);
