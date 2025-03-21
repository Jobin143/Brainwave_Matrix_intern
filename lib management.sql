create database lib_mgmnt;
use lib_mgmnt;

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    CopiesAvailable INT DEFAULT 1
);
desc books;

CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);

CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    IssueDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books (Title, Author, ISBN, CopiesAvailable) VALUES
('Harry Potter', 'J.K. Rowling', '978-0439708180', 5),
('1984', 'George Orwell', '978-0451524935', 3);

INSERT INTO Members (Name, Email, Phone) VALUES
('Dharmesh kushwaha', 'dk.sample@email.com', '1234567890'),
('chris james', 'james.sample@email.com', '0987654321');

INSERT INTO Loans (MemberID, BookID, DueDate) 
VALUES (1, 1, DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 14 DAY));
select * from loans;

-- View All Books:

SELECT * FROM Books;

-- View All Members:

SELECT * FROM Members;

-- View Borrowed Books:

SELECT Members.Name, Books.Title, Loans.IssueDate, Loans.DueDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;

-- Return a Book:
ALTER TABLE Loans MODIFY ReturnDate TIMESTAMP NULL DEFAULT NULL;
UPDATE Loans SET ReturnDate = NOW() WHERE LoanID = 1;

-- Delete a Member:

DELETE FROM Members WHERE MemberID = 2;







