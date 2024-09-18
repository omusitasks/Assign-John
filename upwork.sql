-- create database schema named: upwork

create database upwork;

use upwork;

-- create tables and their relationships
-- Table: Client
CREATE TABLE Client_SindhujaG (
    ClientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Location VARCHAR(100)
);

-- Table: Freelancer
CREATE TABLE Freelancer_SindhujaG (
    FreelancerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Location VARCHAR(100),
    Skills TEXT,
    HourlyRate DECIMAL(10, 2),
    TotalEarnings DECIMAL(15, 2) DEFAULT 0,
    SuccessRate DECIMAL(5, 2)
);

-- Table: Project
CREATE TABLE Project_SindhujaG (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Budget DECIMAL(15, 2),
    PostDate DATE,
    Status ENUM('Open', 'In Progress', 'Completed') DEFAULT 'Open',
    ClientID INT,
    FOREIGN KEY (ClientID) REFERENCES Client_SindhujaG(ClientID) ON DELETE CASCADE
);

-- Table: Bid
CREATE TABLE Bid_SindhujaG (
    BidID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(15, 2) NOT NULL,
    EstimatedStartDate DATE,
    EstimatedEndDate DATE,
    ProjectID INT,
    FreelancerID INT,
    FOREIGN KEY (ProjectID) REFERENCES Project_SindhujaG(ProjectID) ON DELETE CASCADE,
    FOREIGN KEY (FreelancerID) REFERENCES Freelancer_SindhujaG(FreelancerID) ON DELETE CASCADE
);

-- Table: Review
CREATE TABLE Review_SindhujaG (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    Date DATE,
    ClientID INT,
    FreelancerID INT,
    FOREIGN KEY (ClientID) REFERENCES Client_SindhujaG(ClientID) ON DELETE CASCADE,
    FOREIGN KEY (FreelancerID) REFERENCES Freelancer_SindhujaG(FreelancerID) ON DELETE CASCADE
);



-- insert 5 records in each of the above created tables for upwork database
-- Inserting data into the tables
-- Insert Clients
INSERT INTO Client_SindhujaG (Name, Email, Location) VALUES
('John Doe', 'john@example.com', 'New York, USA'),
('Jane Smith', 'jane@example.com', 'San Francisco, USA'),
('Mark Brown', 'mark@example.com', 'Dallas, USA'),
('Lucy Green', 'lucy@example.com', 'Chicago, USA'),
('Michael Davis', 'michael@example.com', 'Austin, USA');

-- Insert Freelancers
INSERT INTO Freelancer_SindhujaG (Name, Email, Location, Skills, HourlyRate, SuccessRate) VALUES
('Alice Johnson', 'alice@example.com', 'Chicago, USA', 'Web Development, PHP, WordPress', 50.00, 95.00),
('Bob Williams', 'bob@example.com', 'Los Angeles, USA', 'UI/UX Design, Photoshop', 40.00, 98.50),
('Eve Adams', 'eve@example.com', 'Boston, USA', 'Graphic Design, Illustration', 45.00, 94.00),
('Tom Harris', 'tom@example.com', 'Miami, USA', 'Mobile App Development, React Native', 60.00, 97.50),
('Sara White', 'sara@example.com', 'Seattle, USA', 'JavaScript, Node.js, Angular', 55.00, 96.00);

-- Insert Projects
INSERT INTO Project_SindhujaG (Title, Description, Budget, PostDate, ClientID) VALUES
('New Ecommerce Website', 'Looking for a WordPress expert to develop a new ecommerce site.', 3000.00, '2024-09-15', 1),
('WordPress Plugin Development', 'Need a developer to create custom plugins for my WordPress site.', 1500.00, '2024-09-12', 2),
('Mobile App UI Redesign', 'Need to redesign the UI for a mobile app.', 2500.00, '2024-09-10', 3),
('Website Revamp', 'Revamp and modernize an existing corporate website.', 3500.00, '2024-09-08', 4),
('Graphic Design for Marketing', 'Create marketing materials for an upcoming event.', 1200.00, '2024-09-20', 5);

-- Insert Bids
INSERT INTO Bid_SindhujaG (Amount, EstimatedStartDate, EstimatedEndDate, ProjectID, FreelancerID) VALUES
(2500.00, '2024-09-18', '2024-10-01', 1, 1),
(1400.00, '2024-09-20', '2024-09-30', 2, 2),
(2300.00, '2024-09-22', '2024-10-05', 3, 3),
(3400.00, '2024-09-23', '2024-10-15', 4, 4),
(1100.00, '2024-09-25', '2024-10-02', 5, 5);

-- Insert Reviews
INSERT INTO Review_SindhujaG (Rating, Comment, Date, ClientID, FreelancerID) VALUES
(5, 'Excellent work! Very satisfied with the results.', '2024-09-30', 1, 1),
(4, 'Good job but a bit delayed.', '2024-09-28', 2, 2),
(5, 'Great communication and high-quality work!', '2024-10-01', 3, 3),
(3, 'Project was okay, but could have been better.', '2024-09-27', 4, 4),
(5, 'Very professional and delivered ahead of schedule.', '2024-09-29', 5, 5);