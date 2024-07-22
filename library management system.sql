CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL,
	);
    create database library;
    use library;
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
    publisher_PublisherAddress VARCHAR(200) NOT NULL,
    publisher_PublisherPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_Title VARCHAR(100) NOT NULL,
    book_PublisherName VARCHAR(100) NOT NULL,
    CONSTRAINT fk_publisher_name1 FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the tbl_library_branch table
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT AUTO_INCREMENT PRIMARY KEY,
    library_branch_BranchName VARCHAR(100) NOT NULL,
    library_branch_BranchAddress VARCHAR(200) NOT NULL
);

CREATE TABLE tbl_borrower (
    borrower_CardNo INT AUTO_INCREMENT PRIMARY KEY,
    borrower_BorrowerName VARCHAR(100) NOT NULL,
    borrower_BorrowerAddress VARCHAR(200) NOT NULL,
    borrower_BorrowerPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT AUTO_INCREMENT PRIMARY KEY,
    book_loans_BookID INT NOT NULL,
    book_loans_BranchID INT NOT NULL,
    book_loans_CardNo INT NOT NULL,
    book_loans_DateOut DATE NOT NULL,
    book_loans_DueDate DATE NOT NULL,
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT AUTO_INCREMENT PRIMARY KEY,
    book_copies_BookID INT NOT NULL,
    book_copies_BranchID INT NOT NULL,
    book_copies_No_Of_Copies INT NOT NULL,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    book_authors_BookID INT NOT NULL,
    book_authors_AuthorName VARCHAR(50) NOT NULL,
    FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    book_authors_BookID INT NOT NULL,
    book_authors_AuthorName VARCHAR(50) NOT NULL,
    FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    book_authors_BookID INT NOT NULL,
    book_authors_AuthorName VARCHAR(50) NOT NULL,
    FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
);SELECT * FROM tbl_borrower
SELECT * FROM tbl_book_loans
SELECT * FROM tbl_library_branch
SELECT * FROM tbl_book_copies
SELECT * FROM tbl_book_authors

-- Insert data into tbl_publisher
INSERT INTO tbl_publisher
    (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
VALUES
    ('DAW Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Viking', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Signet Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Chilton Books', 'Not Available', 'Not Available'),
    ('George Allen & Unwin', '83 Alexander Ln, Crows Nest NSW 2065, Australia', '+61-2-8425-0100'),
    ('Alfred A. Knopf', 'The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019', '212-940-7390'),
    ('Bloomsbury', 'Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018', '212-419-5300'),
    ('Shinchosa', 'Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan', '+81-3-5577-6507'),
    ('Harper and Row', 'HarperCollins Publishers, 195 Broadway, New York, NY 10007', '212-207-7000'),
    ('Pan Books', '175 Fifth Avenue, New York, NY 10010', '646-307-5745'),
    ('Chalto & Windus', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Harcourt Brace Jovanovich', '3 Park Ave, New York, NY 10016', '212-420-5800'),
    ('W.W. Norton', 'W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110', '212-354-5500'),
    ('Scholastic', '557 Broadway, New York, NY 10012', '800-724-6527'),
    ('Bantam', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Picador USA', '175 Fifth Avenue, New York, NY 10010', '646-307-5745');

-- Verify data in tbl_publisher
SELECT * FROM tbl_publisher;

-- Insert data into tbl_book
INSERT INTO tbl_book
    (book_Title, book_PublisherName)
VALUES 
    ('The Name of the Wind', 'DAW Books'),
    ('It', 'Viking'),
    ('The Green Mile', 'Signet Books'),
    ('Dune', 'Chilton Books'),
    ('The Hobbit', 'George Allen & Unwin'),
    ('Eragon', 'Alfred A. Knopf'),
    ('A Wise Mans Fear', 'DAW Books'),
    ('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
    ('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
    ('The Giving Tree', 'Harper and Row'),
    ('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
    ('Brave New World', 'Chalto & Windus'),
    ('The Princess Bride', 'Harcourt Brace Jovanovich'),
    ('Fight Club', 'W.W. Norton'),
    ('Holes', 'Scholastic'),
    ('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
    ('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
    ('The Fellowship of the Ring', 'George Allen & Unwin'),
    ('A Game of Thrones', 'Bantam'),
    ('The Lost Tribe', 'Picador USA');

-- Verify data in tbl_book
SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin';

-- Insert data into tbl_library_branch
INSERT INTO tbl_library_branch
    (library_branch_BranchName, library_branch_BranchAddress)
VALUES
    ('Sharpstown', '32 Corner Road, New York, NY 10012'),
    ('Central', '491 3rd Street, New York, NY 10014'),
    ('Saline', '40 State Street, Saline, MI 48176'),
    ('Ann Arbor', '101 South University, Ann Arbor, MI 48104');

-- Verify data in tbl_library_branch
SELECT * FROM tbl_library_branch;

-- Insert data into tbl_borrower
INSERT INTO tbl_borrower
    (borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
VALUES
    ('Joe Smith', '1321 4th Street, New York, NY 10014', '212-312-1234'),
    ('Jane Smith', '1321 4th Street, New York, NY 10014', '212-931-4124'),
    ('Tom Li', '981 Main Street, Ann Arbor, MI 48104', '734-902-7455'),
    ('Angela Thompson', '2212 Green Avenue, Ann Arbor, MI 48104', '313-591-2122'),
    ('Harry Emnace', '121 Park Drive, Ann Arbor, MI 48104', '412-512-5522'),
    ('Tom Haverford', '23 75th Street, New York, NY 10014', '212-631-3418'),
    ('Haley Jackson', '231 52nd Avenue New York, NY 10014', '212-419-9935'),
    ('Michael Horford', '653 Glen Avenue, Ann Arbor, MI 48104', '734-998-1513');

-- Verify data in tbl_borrower
SELECT * FROM tbl_borrower;

-- Insert data into tbl_book_loans with correct date format



SELECT book_PublisherName, COUNT(*) AS NumberOfBooks
FROM tbl_book
GROUP BY book_PublisherName;
ALTER TABLE tbl_book
ADD CONSTRAINT fk_publisher_name2
FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName);
CREATE INDEX idx_book_title ON tbl_book(book_Title);


