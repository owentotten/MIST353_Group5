use Group5;
GO
INSERT INTO AppUSER (UID, UFirstName, ULastName, UEmail, UPhone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-9012');
GO
INSERT INTO Officer (UID, OPosition) VALUES
(1, 'President'),
(2, 'Vice President');
GO
INSERT INTO Event (EID, EDateTime, EDescription, EExcuseCutoffTime, UID) VALUES
(1, '2024-07-01 18:00:00', 'Monthly Meeting', '2024-06-30 18:00:00', 1),
(2, '2024-07-15 18:00:00', 'Community Service', '2024-07-14 18:00:00', 2);
GO
INSERT INTO AttendanceExcuse (EID, UID, ExcuseDescription, ExcuseSubmissionTime, ExcuseApprovalStatus) VALUES
(1, 3, 'Family emergency', '2024-06-29 12:00:00', 1),
(2, 3, 'Work commitment', '2024-07-14 10:00:00', 0);
GO

