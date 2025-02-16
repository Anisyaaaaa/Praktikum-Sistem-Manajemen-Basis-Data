CREATE DATABASE OutSourcingCompany;

USE OutSourcingCompany;

CREATE TABLE Projects (
	Project_ID INT NOT NULL PRIMARY KEY,
    Project_Name VARCHAR(100),
    Client_Company VARCHAR(100),
    Start_Date DATE,
    End_Date DATE
);

INSERT INTO Projects (Project_ID, Project_Name, Client_Company, Start_Date, End_Date) VALUES
(1, 'Proyek Alpha', 'Tech Innovators Inc.', '2024-01-10', '2024-01-20'),
(2, 'Proyek Beta', 'Green Energy Solutions', '2024-02-01', '2024-02-27'),
(3, 'Proyek Gamma', 'Healthcare Dynamics', '2024-03-05', '2024-03-21'),
(4, 'Proyek Delta', 'EduTech Global', '2024-04-10', '2024-04-15'),
(5, 'Proyek Epsilon', 'FinanceSecure Ltd.', '2024-05-15', '2024-05-30'),
(6, 'Proyek Zeta', 'AutoDrive Corp.', '2024-06-20', '2024-12-31'),
(7, 'Proyek Eta', 'FoodTech Enterprises', '2024-07-25', '2024-09-30'),
(8, 'Proyek Theta', 'SmartHomes Inc.', '2024-08-10', '2024-12-15'),
(9, 'Proyek Iota', 'TravelPlus Ltd.', '2024-09-05', '2024-12-10'),
(10, 'Proyek Kappa', 'Retail Innovations', '2024-10-10', '2024-12-20');


CREATE TABLE Employees (
	Employee_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary FLOAT,
    Date_Hired DATE,
    Project_ID INT,
    FOREIGN KEY (Project_ID) REFERENCES Projects (Project_ID)
);

INSERT INTO Employees (Employee_ID, Name, Position, Salary, Date_Hired, Project_ID) VALUES
(1, 'Alice Johnson', 'Manajer Proyek', 75000, '2023-01-15', 1),
(2, 'Bob Smith', 'Insinyur Perangkat Lunak', 68000, '2023-02-10', 2),
(3, 'Charlie Brown', 'Analis Data', 60000, '2023-03-20', 3),
(4, 'David Wilson', 'Desainer UX', 55000, '2023-04-25', 4),
(5, 'Eva Adams', 'Spesialis Pemasaran', 52000, '2023-05-30', 5),
(6, 'Frank White', 'Insinyur QA', 57000, '2023-06-05', 6),
(7, 'Grace Lee', 'Analis Bisnis', 62000, '2023-07-10', 7),
(8, 'Henry King', 'Insinyur DevOps', 64000, '2023-08-15', 8),
(9, 'Ivy Scott', 'Manajer HR', 58000, '2023-09-20', 9),
(10, 'Jack Miller', 'Akuntan', 56000, '2023-10-25', 10);


CREATE TABLE Certificates (
	Certificate_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Employee_ID INT,
    Certificate_Name VARCHAR(100),
    Issue_Date DATE,
    Expiry_Date DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employees (Employee_ID)
);

INSERT INTO Certificates (Certificate_ID, Employee_ID, Certificate_Name, Issue_Date, Expiry_Date) VALUES
(1, 1, 'Project Management Professional (PMP)', '2023-02-01', '2024-02-23'),
(2, 2, 'Certified Scrum Master (CSM)', '2023-03-15', '2026-03-15'),
(3, 3, 'Certified Data Analyst (CDA)', '2023-04-20', '2026-04-20'),
(4, 4, 'Sertifikasi Desain UX', '2023-05-10', '2026-05-10'),
(5, 5, 'Sertifikasi Pemasaran Digital', '2023-06-05', '2025-06-05'),
(6, 6, 'Certified Software Quality Analyst (CSQA)', '2023-07-01', '2025-07-01'),
(7, 7, 'Certified Business Analysis Professional (CBAP)', '2023-08-12', '2026-08-12'),
(8, 8, 'AWS Certified DevOps Engineer', '2023-09-20', '2025-09-20'),
(9, 9, 'Professional in Human Resources (PHR)', '2023-10-05', '2026-10-05'),
(10, 10, 'Certified Public Accountant (CPA)', '2023-11-15', '2026-11-15');


CREATE TABLE Trainings (
	Training_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Certificate_Name VARCHAR(100),
    Duration_In_Months INT
);

INSERT INTO Trainings (Training_ID, Certificate_Name, Duration_In_Months) VALUES
(1, 'Project Management Professional (PMP)', 6),
(2, 'Certified Scrum Master (CSM)', 2),
(3, 'Certified Data Analyst (CDA)', 4),
(4, 'Sertifikasi Desain UX', 5),
(5, 'Sertifikasi Pemasaran Digital', 3),
(6, 'Certified Software Quality Analyst (CSQA)', 4),
(7, 'Certified Business Analysis Professional (CBAP)', 6),
(8, 'AWS Certified DevOps Engineer', 5),
(9, 'Professional in Human Resources (PHR)', 3),
(10, 'Certified Public Accountant (CPA)', 6);


CREATE TABLE Notifications (
	Notification_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Message TEXT,
    Date DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employees (Employee_ID)
);

INSERT INTO Notifications (Notification_ID, Employee_ID, Message, Date) VALUES
(1, 1, 'Pengingat: Sertifikasi PMP Anda akan segera berakhir. Harap perbarui sebelum tanggal kedaluwarsa.', '2024-01-15'),
(2, 2, 'Selamat telah menyelesaikan pelatihan Certified Scrum Master (CSM)!', '2024-02-16'),
(3, 3, 'Sertifikasi Certified Data Analyst (CDA) Anda telah diterbitkan.', '2024-03-21'),
(4, 4, 'Pengingat: Ujian Sertifikasi Desain UX dijadwalkan minggu depan.', '2024-04-03'),
(5, 5, 'Sertifikasi Pemasaran Digital Anda akan kedaluwarsa dalam enam bulan. Harap perbarui.', '2024-05-05'),
(6, 6, 'Selamat telah meraih sertifikasi Certified Software Quality Analyst (CSQA)!', '2024-01-02'),
(7, 7, 'Sertifikasi CBAP Anda telah berhasil diperbarui.', '2024-02-13'),
(8, 8, 'Sesi pelatihan AWS Certified DevOps Engineer dimulai bulan depan.', '2024-03-20'),
(9, 9, 'Pengingat: Sertifikasi Professional in Human Resources (PHR) Anda akan segera berakhir.', '2024-04-30'),
(10, 10, 'Anda telah berhasil lulus ujian Certified Public Accountant (CPA).', '2023-05-16');


CREATE TABLE Companies (
	Company_ID INT NOT NULL PRIMARY KEY,
    Company_Name VARCHAR(100),
    Address TEXT
);

INSERT INTO Companies (Company_ID, Company_Name, Address) VALUES
(1, 'Tech Innovators Inc.', '123 Tech Street, Silicon Valley, CA'),
(2, 'Green Energy Solutions', '456 Renewable Avenue, New York, NY'),
(3, 'Healthcare Dynamics', '789 Medical Center Drive, Chicago, IL'),
(4, 'EduTech Global', '101 Education Boulevard, Boston, MA'),
(5, 'FinanceSecure Ltd.', '202 Financial District, London, UK'),
(6, 'AutoDrive Corp.', '303 Autonomous Road, Tokyo, Japan'),
(7, 'FoodTech Enterprises', '404 Food Plaza, Paris, France'),
(8, 'SmartHomes Inc.', '505 Smart Street, Sydney, Australia'),
(9, 'TravelPlus Ltd.', '606 Travel Avenue, Dubai, UAE'),
(10, 'Retail Innovations', '707 Retail Road, Toronto, Canada');


-- Nomor 1
DELIMITER //
CREATE PROCEDURE TambahanBonus()
BEGIN
    DECLARE tglSekarang DATE;
    SET tglSekarang = CURDATE();

    UPDATE Employees
    SET Salary = Salary * 1.10
    WHERE DATEDIFF(tglSekarang, Date_Hired) > 365;
    SELECT Employees.Name, Salary, Date_Hired FROM Employees WHERE DATEDIFF(tglSekarang, Date_Hired) > 365;
END //
DELIMITER ;

CALL TambahanBonus();


-- Nomor 2
DELIMITER //
CREATE PROCEDURE ProyekDiperpanjang()
BEGIN
	DECLARE HariIni DATE;
    SET HariIni = CURDATE();
    
    SELECT 
        Project_ID AS 'ID Project', 
        Project_Name AS 'Nama Project', 
        End_Date AS 'Tanggal Project Berakhir',
        DATE_ADD(End_Date, INTERVAL 3 MONTH) AS 'Tanggal Project Diperpanjang'
    FROM Projects
    WHERE DATEDIFF(End_Date, HariIni) < 30;
    
    UPDATE Projects
    SET End_Date = DATE_ADD(End_Date, INTERVAL 3 MONTH)
    WHERE DATEDIFF(End_Date, HariIni) < 30;
    
    SELECT * FROM Projects;

END //
DELIMITER ;

CALL ProyekDiperpanjang();
DROP PROCEDURE ProyekDiperpanjang;


-- Nomor 3
DELIMITER //
CREATE PROCEDURE UpdateSertifikat(
	IN EmployeeID INT)
BEGIN
    DECLARE BanyakSertifikat INT;
    DECLARE HariIni DATE;
    DECLARE IDSertifikatBaru INT;
    DECLARE IDTrainingBaru INT;
    
    SELECT COUNT(*) INTO BanyakSertifikat FROM Certificates WHERE Employee_ID = EmployeeID;
    SET HariIni = CURDATE();

    IF BanyakSertifikat > 0 THEN
        UPDATE Certificates 
        SET Expiry_Date = ADDDATE(Expiry_Date, INTERVAL 1 YEAR)
        WHERE Employee_ID = EmployeeID AND Expiry_Date < HariIni;

        IF ROW_COUNT() > 0 THEN
            SELECT CONCAT('Sertifikat karyawan ', EmployeeID, ' sudah diupdate.') AS Message;

            INSERT INTO Trainings (Training_ID, Certificate_Name, Duration_In_Months) VALUES
            (IDTrainingBaru, 'Sertifikat Pengembangan Website Menggunakan Laravel', 5);
            
        ELSE
            SELECT CONCAT('Sertifikat karyawan ', EmployeeID, ' tidak ada yang perlu diperbarui.') AS Message;
        END IF;
    ELSE
        SELECT CONCAT('Karyawan ', EmployeeID, ' tidak mempunyai sertifikat.') AS Message;
    END IF;

    INSERT INTO Certificates (Certificate_ID, Employee_ID, Certificate_Name, Issue_Date, Expiry_Date) VALUES
    (IDSertifikatBaru, EmployeeID, 'Pengembangan Website Menggunakan Laravel', CURDATE(), ADDDATE(CURDATE(), INTERVAL 1 YEAR));

    SELECT * FROM Trainings;
    SELECT * FROM Certificates;
END //
DELIMITER ;

CALL UpdateSertifikat(1);
DROP PROCEDURE UpdateSertifikat;

-- Nomor 4
DELIMITER //
CREATE PROCEDURE KirimNotifikasi()
BEGIN
    DECLARE HariIni DATE;
    DECLARE IdEmployee INT DEFAULT 0;
    DECLARE SimpanID INT;

    SET HariIni = CURDATE();
    SELECT MAX(Employee_ID) INTO SimpanID FROM Employees;

    REPEAT
        SET IdEmployee = IdEmployee + 1;

        IF EXISTS (SELECT * FROM Employees WHERE Employee_ID = IdEmployee) THEN
            INSERT INTO Notifications (Employee_ID, Message, Date)
            SELECT IdEmployee, 'Coming Soon! Pelatihan Pengembangan Aplikasi Web Menggunakan JavaScript dan React', HariIni;
        END IF;
    UNTIL IdEmployee >= SimpanID END REPEAT;
    
    SELECT * FROM Notifications;
END //
DELIMITER ;

CALL KirimNotifikasi();


SELECT * FROM Trainings;
SELECT * FROM Companies;
SELECT * FROM Employees;
SELECT * FROM Notifications;
SELECT * FROM Projects;
SELECT * FROM Certificates;