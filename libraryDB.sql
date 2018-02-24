/*========================================
	DROP ALL TABLES AND DATABASE (TABLES MUST
	BE DROPPED IN ORDER SHOWN TO AVOID FOREIGN
	KEY CONFLICTS
==========================================*/


DROP TABLE book_authors;
DROP TABLE book_loans;
DROP TABLE borrower;
DROP TABLE book_copies;
DROP TABLE library_branch;
DROP TABLE book;
DROP TABLE publisher;
DROP DATABASE LIBRARY;

/*========================================
	END DROP ALL TABLES AND DATABASE
==========================================*/

/*========================================
		CREATE DATABASE "LIBRARY"
========================================*/

CREATE DATABASE LIBRARY;

CREATE TABLE publisher (
	name VARCHAR(250) PRIMARY KEY,
	address VARCHAR (500),
	phone BIGINT
);

CREATE TABLE book (
	bookId INT PRIMARY KEY IDENTITY (1,1),
	title VARCHAR(250),
	publisherName VARCHAR (250) FOREIGN KEY REFERENCES publisher(name)
);

CREATE TABLE book_authors (
	bookId INT FOREIGN KEY REFERENCES book(bookId) IDENTITY (1,1),
	authorName VARCHAR(250)
);

CREATE TABLE library_branch (
	branchId INT PRIMARY KEY IDENTITY (1,1),
	branchName VARCHAR (250),
	address VARCHAR (500)
);

CREATE TABLE book_copies (
	bookId INT FOREIGN KEY REFERENCES book(bookId),
	branchId INT FOREIGN KEY REFERENCES library_branch(branchId),
	no_of_copies INT
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY IDENTITY (1,1),
	name VARCHAR(250),
	address VARCHAR(500),
	phone BIGINT
);

CREATE TABLE book_loans (
	bookId INT FOREIGN KEY REFERENCES book(bookId),
	branchId INT FOREIGN KEY REFERENCES library_branch(branchId),
	cardNo INT FOREIGN KEY REFERENCES borrower(cardNo),
	dateOut DATE,
	dueDate DATE
);

/*=========================================
	END CREATE DATABASE "LIBRARY"
==========================================*/


/*===========================================
		POPULATE DATABASE "LIBRARY"
===========================================*/

INSERT INTO publisher (name, address, phone)
	VALUES
	('Harper Collins','123 Harris Street, Pittsburg, PA 23847',3746378473),
	('Penguin Books','345 Ratchet Way, Golden, CO 80838',3837483749),
	('Randomhouse Books','298 Anywhere Avenue, New York, NY 19283',8343837362),
	('Dover Publications','8364 Delaware Lane, Dover, DE  19876',32834749373),
	('Oxford Publishing House','9382 Queen Elizabeth Drive, Boston, MA 28347',9868573876),
	('Princeton Classics','9384 Ellington Way, Princeton, NJ  18394',8374938495)
;

INSERT INTO book (title,publisherName)
	VALUES
	('Don Quixote', 'Harper Collins'),
	('In Search of Lost Time','Penguin Books'),
	('Ulysses','Dover Publications'),
	('The Odyssey','Oxford Publishing House'),
	('War and Peace','Harper Collins'),
	('Moby Dick','Dover Publications'),
	('The Divine Comedy','Oxford Publishing House'),
	('Hamlet','Penguin Books'),
	('The Adventures of Huckleberry Finn','Randomhouse Books'),
	('The Great Gatsby','Harper Collins'),
	('The Iliad','Oxford Publishing House'),
	('One Hundred Years of Solitude','Penguin Books'),
	('Madame Bovary','Dover Publications'),
	('Crime and Punishment','Randomhouse Books'),
	('The Brothers Karamazov','Harper Collins'),
	('Pride and Prejudice','Dover Publications'),
	('Wuthering Heights','Princeton Classics'),
	('The Sound and the Fury','Harper Collins'),
	('Lolita','Penguin Books'),
	('Nineteen Eighty Four','Oxford Publishing House'),
	('Alice''s Adventures in Wonderland','Randomhouse Books'),
	('To the Lighthouse','Princeton Classics'),
	('Great Expectations','Harper Collins'),
	('Anna Karenina','Randomhouse Books'),
	('The Catcher in the Rye','Penguin Books'),
	('Middlemarch','Princeton Classics'),
	('Gulliver''s Travels','Dover Publications'),
	('The Aeneid','Princeton Classics'),
	('Heart of Darkness','Harper Collins'),
	('One Thousand and One Nights','Oxford Publishing House'),
	('The Canterbury Tales','Dover Publications'),
	('The Stranger','Penguin Books'),
	('The Stories of Anton Chekhov','Randomhouse Books'),
	('The Grapes of Wrath','Princeton Classics'),
	('Catch-22','Princeton Classics'),
	('The Red and the Black','Oxford Publishing House'),
	('The Trial','Penguin Books'),
	('Leaves of Grass','Randomhouse Books'),
	('Absalom, Absalom!','Dover Publications'),
	('Oedipus the King','Princeton Classics'),
	('Candide','Oxford Publishing House'),
	('David Copperfield','Princeton Classics'),
	('Invisible Man','Penguin Books'),
	('Mrs. Dalloway','Harper Collins'),
	('Beloved','Princeton Classics'),
	('Jane Eyre','Randomhouse Books'),
	('The Complete Tales and Poems of Edgar Allan Poe','Penguin Books'),
	('As I Lay Dying','Harper Collins'),
	('Faust','Penguin Books'),
	('The Complete Stories of Franz','Harper Collins'),
	('The Lost Tribe','Harper Collins'),
	('The Green Mile', 'Randomhouse Books'),
	('The Shining', 'Randomhouse Books')
;

INSERT INTO book_authors (authorName)
	VALUES
	('Miguel de Cervantes'),
	('Marcel Proust'),
	('James Joyce'),
	('Homer'),
	('Leo Tolstoy'),
	('Herman Melville'),
	('Dante Alighieri'),
	('William Shakespeare'),
	('Mark Twain'),
	('F. Scott Fitzgerald'),
	('Homer'),
	('Garcia Marquez'),
	('Gustave Flaubert'),
	('Fyodor Dostoyevsky'),
	('Fyodor Dostoyevsky'),
	('Jane Austen'),
	('Emily Bronte'),
	('William Faulkner'),
	('Vladimir Nabokov'),
	('George Orwell'),
	('Lewis Carroll'),
	('Virginia Woolf'),
	('Charles Dickens'),
	('Leo Tolstoy'),
	('J.D. Salinger'),
	('George Eliot'),
	('Jonathan Swift'),
	('Virgil'),
	('Joseph Conrad'),
	('India/Iran/Egypt'),
	('Geoffrey Chaucer'),
	('Albert Camus'),
	('Anton Chekhov'),
	('John Steinbeck'),
	('Joseph Heller'),
	('Stendhal'),
	('Franz Kafka'),
	('Walt Whitman'),
	('William Faulkner'),
	('Sophocles'),
	('Voltaire'),
	('Charles Dickens'),
	('Ralph Ellison'),
	('Virginia Woolf'),
	('Toni Morrison'),
	('Charlotte Bronte'),
	('Edgar Allan Poe'),
	('William Faulkner'),
	('Wolfgang von Goethe'),
	('Franz Kafka'),
	('Richard Mansfield'),
	('Stephen King'),
	('Stephen King')
;

INSERT INTO library_branch (branchName, address)
	VALUES
	('Sharpstown','246 Knickerbocker Court, Houston, TX  77384'),
	('Central','837 Leedermyer Way, Houston, TX 77495'),
	('Downtown','3847 N. Main Street, Houston, TX  77349'),
	('North','324 Harrison Lane, Spring, TX  79485'),
	('Southwest','6845 Lexington Blvd., Sugar Land, TX 77479')
;

INSERT INTO book_copies (bookId, branchId, no_of_copies)
	VALUES
	(1,1,2),
	(2,1,3),
	(3,1,5),
	(4,1,2),
	(5,5,4),
	(6,1,3),
	(7,1,5),
	(8,1,2),
	(9,1,3),
	(10,1,6),
	(11,2,4),
	(12,2,3),
	(13,2,2),
	(14,2,4),
	(15,2,3),
	(16,2,2),
	(17,2,5),
	(18,2,2),
	(19,3,4),
	(20,3,3),
	(21,3,6),
	(22,3,4),
	(23,3,3),
	(24,3,5),
	(25,3,3),
	(26,3,2),
	(27,3,2),
	(28,3,4),
	(29,4,3),
	(30,4,5),
	(31,4,2),
	(32,4,3),
	(33,4,4),
	(34,4,5),
	(35,4,6),
	(36,4,2),
	(37,4,3),
	(38,4,4),
	(39,5,5),
	(40,5,4),
	(41,5,3),
	(42,5,2),
	(43,5,4),
	(44,5,5),
	(45,5,6),
	(46,5,3),
	(47,5,4),
	(48,5,2),
	(49,5,3),
	(50,5,2),
	(51,1,3),
	(52,2,4),
	(53,2,2)
;

INSERT INTO borrower (name, address, phone)
	VALUES
	('BillyBob Thornton','265 Slingblade Street, Houston, TX 77668',2814656364),
	('Angelina Jolie','2723 Anywher Lane, Houston, TX  38574',384758373),
	('Harrison Ford','3847 Han Solo Street, Rosenberg, TX  77355',7885469765),
	('Mel Gibson','9478 Braveheart Blvd., Cypress, TX  83578',38484726472),
	('Meryl Streep','Post Street, Pasadena, TX  384745',3837492748),
	('Tom Hanks','2894 Cast Away Court, Brennan, TX  38479',394738923748),
	('Hillary Swank','Million Dollar Baby Blvd., Houston, TX  83847',9384736274),
	('Don Henley','9384 Eagles Avenue, Missouri City, TX  77459',3847274847),
	('Samuel L. Jackson','Pulp Fiction Way, Humble, TX  83847',83473947384),
	('Willy Wonka','Golden Ticket Lane, Chocotown, TX  59683',3847284746),
	('Walter White','3847 Blue Sky Lane, Albequerque, NM  38473',83736437684)
;

INSERT INTO book_loans (bookId, branchId,cardNo, dateOut, dueDate)
	VALUES
	(1,1,1,'2018/01/09', '2018/02/20'),
	(2,1,1,'2018/02/09','2018/03/20'),
	(3,1,1,'2017/12/09','2018/04/20'),
	(4,1,1,'2017/11/09','2018/05/20'),
	(5,5,1,'2016/02/27','2018/06/20'),
	(6,1,1,'2018/01/09','2018/05/20'),
	(7,1,2,'2017/06/25','2018/04/20'),
	(8,1,2,'2017/10/09','2018/03/20'),
	(9,1,2,'2018/01/09','2018/02/20'),
	(10,1,2,'2017/02/12','2018/03/20'),
	(11,2,2,'2017/08/09','2018/04/20'),
	(12,2,2,'2017/09/09','2018/05/20'),
	(13,2,2,'2018/01/09','2018/06/20'),
	(14,2,3,'2017/07/09','2018/07/20'),
	(15,2,4,'2017/06/09','2018/08/20'),
	(16,2,5,'2017/05/09','2018/07/20'),
	(17,2,6,'2018/01/09','2018/06/20'),
	(18,2,7,'2017/04/09','2018/05/20'),
	(19,3,8,'2017/03/09','2018/04/20'),
	(20,3,9,'2017/02/09','2018/03/20'),
	(21,3,10,'2017/01/09','2018/02/20'),
	(22,3,11,'2017/02/09','2018/03/20'),
	(23,3,10,'2017/03/09','2018/04/20'),
	(24,3,9,'2017/04/09','2018/05/20'),
	(25,3,8,'2017/05/09','2018/06/20'),
	(26,3,7,'2017/06/09','2018/05/20'),
	(27,3,6,'2017/07/09','2018/04/20'),
	(28,3,5,'2017/08/09','2018/03/20'),
	(29,4,4,'2018/01/09','2018/02/20'),
	(30,4,3,'2018/01/09','2018/03/20'),
	(31,4,4,'2017/09/09','2018/04/20'),
	(32,4,5,'2017/10/09','2018/05/20'),
	(33,4,6,'2018/01/09','2018/06/20'),
	(34,4,7,'2017/11/09','2018/05/20'),
	(35,4,8,'2017/12/09','2018/04/20'),
	(36,4,9,'2017/11/09','2018/03/20'),
	(37,4,10,'2017/10/09','2018/02/20'),
	(38,4,11,'2017/09/09','2018/04/20'),
	(39,5,10,'2017/08/09','2018/05/20'),
	(40,5,9,'2017/07/09','2018/06/20'),
	(41,5,8,'2017/06/09','2018/07/20'),
	(42,5,7,'2017/05/09','2018/08/20'),
	(43,5,6,'2017/04/09','2018/07/20'),
	(44,5,5,'2017/03/09','2018/06/20'),
	(45,5,4,'2017/02/09','2018/05/20'),
	(46,5,3,'2017/01/09','2018/04/20'),
	(47,5,4,'2017/02/09','2018/03/20'),
	(48,5,5,'2017/03/09','2018/02/20'),
	(49,5,6,'2017/04/09','2018/03/20'),
	(50,5,7,'2017/05/09','2018/04/20')
;
/*===========================================
		END POPULATE DATABASE "LIBRARY"
===========================================*/

/*===================================================
		STORED QUERIES AGAINST DATABASE "LIBRARY"
====================================================*/

----------------------------------------------------------------------------------------------------------------------------------------------------------
/* Procedure queries how many copies of a given title are located at a given branch */

GO
	CREATE PROC dbo.howManyCopies @title VARCHAR(250), @branch VARCHAR(250)				
		AS
			IF @branch!=''		/* If user supplies value for branch, information for the given book from the given branch is returned */
				BEGIN
					SELECT book.bookId, title, authorName, branchName, no_of_copies FROM book
					JOIN book_authors ON book.bookId=book_authors.bookId
					JOIN book_copies ON book.bookId=book_copies.bookId
					JOIN library_branch ON book_copies.branchId=library_branch.branchId
					WHERE (book.title LIKE @title + '%') AND (library_branch.branchName LIKE @branch + '%');
				END
			ELSE		/* Otherwise, if no value is entered for branch (user enters empty string for branch),
						 information for the given book, for all branches, is returned */
				BEGIN
					SELECT book.bookId, title, authorName, branchName, no_of_copies FROM book
					JOIN book_authors ON book.bookId=book_authors.bookId
					JOIN book_copies ON book.bookId=book_copies.bookId
					JOIN library_branch ON book_copies.branchId=library_branch.branchId
					WHERE book.title LIKE (@title + '%');
				END
GO
------------------------------------------------------------------------------------------------------------

GO
	CREATE PROC noBooksOut		/* Query checks LIBRARY to see which borrowers have no books checked out */
		AS
			SELECT name FROM borrowers
			WHERE CardNo NOT IN(SELECT CardNo FROM book_loans);
GO

-----------------------------------------------------------------------------------------------------------
/* Procedure queries for book title, borrower's name, and borrower's address for all books checked out from 
a given branch, with a given due date.  If due date supplied is empty, all books checked out from the given 
branch are returned. */

GO
	CREATE PROCEDURE booksOutBranchDueDate @branch VARCHAR(250), @dueDate VARCHAR(20)
		AS
			IF @dueDate=''     --if due date is left blank, check to see if branch is also blank
				BEGIN
					IF @branch=''	--if branch is also blank, throw an error message
						BEGIN
							PRINT 'PLEASE ENTER A LIBRARY BRANCH NAME, FOLLOWED BY A DUE DATE, IN ORDER TO SEARCH. Only one is permitted to be left blank!';
						END
					ELSE		--if branch is populated, query based on branch only, returning all books out from that branch, regardless of due date
						BEGIN
							SELECT title, name, borrower.address, dueDate FROM borrower
							JOIN book_loans ON borrower.CardNo=book_loans.cardNo
							JOIN library_branch ON book_loans.branchId=library_branch.branchId
							JOIN book_copies ON library_branch.branchId=book_copies.branchId
							JOIN book ON book_copies.bookId=book.bookId
							WHERE branchName LIKE @branch + '%';
						END
				END
			ELSE
				BEGIN
					IF @branch=''	/* if branch is left blank, but due date is populated, query based on due date only, returning all books due on that date, 
										regardless of branch from which they were checked out */
						BEGIN
							SELECT title, name, borrower.address, dueDate FROM borrower
							JOIN book_loans ON borrower.CardNo=book_loans.cardNo
							JOIN library_branch ON book_loans.branchId=library_branch.branchId
							JOIN book_copies ON library_branch.branchId=book_copies.branchId
							JOIN book ON book_copies.bookId=book.bookId
							WHERE dueDate LIKE @dueDate + '%';
						END
					ELSE		/* if here, then both input parameters are populated and query will return books from a given branch with the given due date. */
						BEGIN
							SELECT title, name, borrower.address, dueDate FROM borrower
							JOIN book_loans ON borrower.CardNo=book_loans.cardNo
							JOIN library_branch ON book_loans.branchId=library_branch.branchId
							JOIN book_copies ON library_branch.branchId=book_copies.branchId
							JOIN book ON book_copies.bookId=book.bookId
							WHERE branchName LIKE @branch + '%' AND dueDate LIKE @dueDate + '%';
						END
				END				
GO

-------------------------------------------------------------------------------------------------------------

/* Procedure retrieves the total number of books loaned out from a particular library branch */

GO
	CREATE PROCEDURE howManyBooksOutFromBranch @branch VARCHAR(20)
	AS
		SELECT COUNT (book_loans.bookId) AS Number_of_books_out_from_selected_branch FROM book_loans 
		JOIN library_branch ON book_loans.branchId=library_branch.branchId
		WHERE library_branch.branchName=@branch;
GO

-------------------------------------------------------------------------------------------------------------

/* Procedure retrieves names, addresses, and number of books checked out for all borrowers who have more than a given number of books checked out */

GO
	CREATE PROCEDURE WhoCheckedOutMoreThan @min INT
		AS
			SELECT borrower.CardNo, borrower.name "Name", borrower.address "Address", COUNT(book_loans.cardNo) "No. of Books Out"
				FROM book_loans 
				JOIN borrower ON book_loans.cardNo=borrower.CardNo
				GROUP BY borrower.CardNo, borrower.name, borrower.address
				HAVING COUNT(book_loans.cardNo) >@min;
GO

/*===================================================
	END STORED QUERIES AGAINST DATABASE "LIBRARY"
====================================================*/