create database Library_System_DB
use Library_System_DB

create table acType_Table(
acid int primary key identity,
account varchar(50)
)
*****************************************
create proc account_type
as
begin
select * from acType_Table
end

insert into acType_Table (account)values('User'),('Administrator')
select * from acType_Table
-------------------------------------------------------------------------------------

create table UserAccount_Table(
id int primary key identity,
name varchar(50),
email varchar(200),
username varchar(100),
password varchar(30),
accountType int
)

create proc add_User
@name varchar(50),
@email varchar(200),
@username varchar(100),
@password varchar(30),
@accountType int
as
begin
insert into UserAccount_Table (name,email,username,password,accountType) values 
(@name,@email,@username,@password,@accountType)
end

select * from UserAccount_Table
select * from UserAccount_Table join acType_Table on accountType=acid

update UserAccount_Table set accountType=2 where id=1

create proc login
@username varchar(20),
@password varchar(20)
as
begin
select * from UserAccount_Table where username=@username and password=@password
end




----------------------------------------------------------------------------------

create table Author_Table(
aid int primary key identity,
author varchar(50),
authorBio varchar(200),
authorImg varchar(100)
)
select * from Author_Table

create proc author_select
as
begin
select * from Author_Table
end

delete from Author_Table where aid=5

create proc author_insert
@author varchar(50),
@authorBio varchar(200),
@authorImg varchar(100)
as
begin
insert into Author_Table (author,authorBio,authorImg) values 
(@author,@authorBio,@authorImg)
end

create table Books_Table(
bid int primary key identity,
authorid int,
books varchar(50),
booksDes varchar(200),
booksImg varchar(100)
)
select * from Books_Table join Author_Table on authorid = aid where aid=3

create proc edit_Book
@id int
as
begin
select * from Books_Table join Author_Table on authorid = aid where bid=@id
end

create proc add_Book
@authorid int,
@books varchar(50),
@booksDes varchar(200),
@booksImg varchar(100)
as
begin
insert into Books_Table (authorid,books,booksDes,booksImg) 
values 
(@authorid,@books,@booksDes,@booksImg)
end
---------------------------------------------------
create proc update_Book
@id int,
@authorid int,
@books varchar(50),
@booksDes varchar(200),
@booksImg varchar(100)
as
begin
update Books_Table set authorid=@authorid,
books=@books,
booksDes=@booksDes,
booksImg=@booksImg 
where bid=@id
end

create proc books_list
as
begin
select * from Books_Table join Author_Table on authorid = aid
end

create proc books_delete
@id int
as
begin
delete from Books_Table where bid=@id
end


alter table Books_Table alter column booksDes varchar(500)
delete from Books_Table where bid=4


create table Library_System_Table(
id int primary key identity,
author varchar(50),
books varchar(100)


