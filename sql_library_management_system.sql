create database lms;
use lms;

create table publisher(
publisher_name varchar(50) primary key ,
publisher_address varchar(255),
publisher_phone   varchar(50));


create table borrower(
borrower_cardno varchar(50) primary key,
borrower_name varchar(50),
borrower_address varchar(255),
borrower_phone varchar(50));
alter table borrower 
modify column borrower_cardno int auto_increment;

create table library_branch(
branch_id int primary key auto_increment,
branch_name varchar(100),
braanch_address varchar(255));




create table book(
book_id int primary key ,
book_title varchar(255),
publisher_name varchar(255) ,
foreign key (publisher_name ) references publisher(publisher_name)
on delete cascade on update cascade
);


create table book_author(
author_id int primary key auto_increment,
book_id int,
author_name varchar(255),
foreign key (book_id) references book(book_id)
on delete cascade on update cascade);


create table book_copies(
copies_id int primary key auto_increment,
copies_bookid int ,
copies_branchid int,
copies_no_of_copies int,
foreign key (copies_bookid) references book(book_id)
on delete cascade on update cascade,
foreign key ( copies_branchid) references library_branch(branch_id)
on delete cascade on update cascade); 


create table book_loans(
loansid int primary key auto_increment,
loan_book_id int ,
loan_branch_id int ,
loan_cardno int ,
loan_dateout date,
loan_duedate date,
foreign key (loan_book_id) references book(book_id)
on delete cascade on update cascade,
foreign key (loan_branch_id) references library_branch(branch_id)
on delete cascade on update cascade,
foreign key (loan_cardno) references borrower(borrower_cardno)
on delete cascade on update cascade);

-- 1.How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

select sum(copies_no_of_copies),b.book_title from book_copies as bc
join library_branch as lb
on lb.branch_id = bc.copies_branchid
join book as b
on b.book_id = bc.copies_bookid
where b.book_title = "The Lost Tribe"  and lb.branch_name = "Sharpstown"
group by b.book_title;



-- 2.How many copies of the book titled "The Lost Tribe" are owned by each library branch?
select sum(copies_no_of_copies),lb.branch_name from book_copies as bc
join library_branch as lb
on lb.branch_id = bc.copies_branchid
join book as b
on b.book_id = bc.copies_bookid
where b.book_title = "The Lost Tribe"  
group by lb.branch_name;



-- 3.Retrieve the names of all borrowers who do not have any books checked out.

select bo.borrower_name,bo.borrower_cardno from borrower as bo
left join book_loans as bl
on bo.borrower_cardno = bl.loan_cardno
where bl.loan_dateout is null;





-- 4.For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address. 

select b.book_title ,bo.borrower_name,bo.borrower_address from book_loans as bl 
join book as b
on b.book_id = bl.loan_book_id
join borrower as bo
on bo.borrower_cardno = bl.loan_cardno
join library_branch as lb
on lb.branch_id = bl.loan_branch_id
where lb.branch_name = "Sharpstown" and bl.loan_duedate = "2018-02-03";


-- 5.For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

select lb.branch_name ,count(loansid) as total_copies  from library_branch as lb
join book_copies as bc
on lb.branch_id = bc.copies_branchid
join book_loans as bl
on bl.loan_branch_id = lb.branch_id
group by lb.branch_name;





-- 6.Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.

select bo.borrower_name , bo.borrower_address ,count(loansid) from borrower as bo
left join book_loans as bl
on bo.borrower_cardno =  bl.loan_cardno
group by bo.borrower_name , bo.borrower_address
having count(loansid)>5;






-- 7.For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

select b.book_title, sum(bc.copies_no_of_copies) from book_copies as bc
join library_branch as lb
on bc.copies_branchid = lb.branch_id
join book as b
on bc.copies_bookid = b.book_id
join book_author as ba
on ba.book_id = b.book_id
where lb.branch_name = "Central" and ba.author_name = "Stephen King"
group by b.book_title , lb.branch_name , ba.author_name;
