-- 1. Leads Table (Unqualified prospects)
CREATE TABLE Leads (
    LeadID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    Company VARCHAR(255),
    Status VARCHAR(50) DEFAULT 'New',
    Source VARCHAR(100)
);

-- 2. Accounts Table (The qualified companies)
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Industry VARCHAR(100),
    Website VARCHAR(255),
    Phone VARCHAR(20)
);

-- 3. Contacts Table (The people at the companies)
CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Title VARCHAR(100),
 
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Opportunities Table (The potential sales deals)
CREATE TABLE Opportunities (
    OpportunityID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT NOT NULL,
    PrimaryContactID INT,
    Name VARCHAR(255) NOT NULL,
    Amount DECIMAL(12, 2),
    Stage VARCHAR(50) NOT NULL,
    ExpectedCloseDate DATE,
 
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
 
    FOREIGN KEY (PrimaryContactID) REFERENCES Contacts(ContactID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);