-- Step 5: Insert Your First Data (New Leads)
INSERT INTO Leads 
    (FirstName, LastName, Email, Company, Status, Source)
VALUES
    ('Alice', 'Smith', 'alice.smith@webco.com', 'WebCo Inc.', 'New', 'Website'),
    ('Bob', 'Johnson', 'b.johnson@datalytics.io', 'DataLytics', 'New', 'Referral'),
    ('Charlie', 'Brown', 'charlie@quickprint.org', 'QuickPrint', 'New', 'Website');

-- Step 6: Convert a Lead (Alice Smith, LeadID = 1)

-- 1. Create the Account
INSERT INTO Accounts (Name, Industry, Website, Phone)
VALUES ('WebCo Inc.', 'Technology', 'www.webco.com', (SELECT Phone FROM Leads WHERE LeadID = 1));

-- 2. Create the Contact (AccountID=1)
INSERT INTO Contacts (AccountID, FirstName, LastName, Email, Phone, Title)
VALUES (1, 'Alice', 'Smith', 'alice.smith@webco.com', (SELECT Phone FROM Leads WHERE LeadID = 1), 'Project Manager');

-- 3. Create the Opportunity (AccountID=1, ContactID=1)
INSERT INTO Opportunities (AccountID, PrimaryContactID, Name, Amount, Stage)
VALUES (1, 1, 'WebCo Initial Website Deal', 25000, 'Prospecting');

-- 4. Update the Original Lead
UPDATE Leads
SET Status = 'Qualified'
WHERE LeadID = 1;


-- Step 7: Populate More Data

-- Part A: Convert Bob Johnson (LeadID = 2)
-- 1. Create the Account for "DataLytics" (AccountID=2)
INSERT INTO Accounts (Name, Industry, Website, Phone)
VALUES ('DataLytics', 'Data Science', 'www.datalytics.io', (SELECT Phone FROM Leads WHERE LeadID = 2));

-- 2. Create the Contact for "Bob Johnson" (AccountID=2, ContactID=2)
INSERT INTO Contacts (AccountID, FirstName, LastName, Email, Phone, Title)
VALUES (2, 'Bob', 'Johnson', 'b.johnson@datalytics.io', (SELECT Phone FROM Leads WHERE LeadID = 2), 'Data Analyst');

-- 3. Create the Opportunity (AccountID=2, ContactID=2)
INSERT INTO Opportunities (AccountID, PrimaryContactID, Name, Amount, Stage)
VALUES (2, 2, 'DataLytics Analytics Package', 42000, 'Negotiation');

-- 4. Update Bob's lead status
UPDATE Leads
SET Status = 'Qualified'
WHERE LeadID = 2;

-- Part B: Add a Second Contact to WebCo Inc. (AccountID = 1)
INSERT INTO Contacts (AccountID, FirstName, LastName, Email, Phone, Title)
VALUES (1, 'David', 'Lee', 'david.lee@webco.com', '555-1235', 'Engineering Manager');