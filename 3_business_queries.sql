-- Step 8: Update Data (Win a Deal)
-- We update the deal from "Prospecting" to "Closed-Won"
UPDATE Opportunities
SET Stage = 'Closed-Won', ExpectedCloseDate = '2025-11-03'
WHERE OpportunityID = 1;


-- Step 9: Run Business Insight Queries

-- Query 1: "What's in our sales pipeline?"
-- Show all *open* deals, sorted by the biggest value first.
SELECT 
    O.Name AS DealName,
    O.Amount,
    O.Stage,
    A.Name AS Company,
    C.FirstName,
    C.LastName
FROM 
    Opportunities AS O
JOIN 
    Accounts AS A ON O.AccountID = A.AccountID
JOIN 
    Contacts AS C ON O.PrimaryContactID = C.ContactID
WHERE 
    O.Stage != 'Closed-Won' AND O.Stage != 'Closed-Lost'
ORDER BY 
    O.Amount DESC;


-- Query 2: "What's our total sales so far?"
-- Show the total amount of money we have earned from deals we've *won*.
SELECT 
    SUM(Amount) AS TotalRevenue
FROM 
    Opportunities
WHERE 
    Stage = 'Closed-Won';


-- Query 3: "Show me a 360-degree view of 'WebCo Inc.'"
-- Show every contact and every sales deal associated with "WebCo Inc." (AccountID = 1)
SELECT
    'Contact' AS RecordType,
    C.FirstName,
    C.LastName,
    C.Title,
    NULL AS Amount,
    NULL AS Stage
FROM 
    Contacts AS C
WHERE 
    C.AccountID = 1

UNION ALL

SELECT 
    'Opportunity' AS RecordType,
    O.Name,
    NULL AS LastName,
    NULL AS Title,
    O.Amount,
    O.Stage
FROM 
    Opportunities AS O
WHERE 
    O.AccountID = 1;