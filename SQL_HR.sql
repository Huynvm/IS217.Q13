
-- 1. Bảng Dim_Location: Chứa thông tin vị trí địa lý
CREATE TABLE [Dim_Location] (
    LocationID   INT IDENTITY(1,1) PRIMARY KEY,
    City         NVARCHAR(150) NOT NULL,
    Country      NVARCHAR(150) NOT NULL
);


select * from [Dim_Location];

-- 2. Bảng Dim_Employee: Chứa thông tin nhân viên
CREATE TABLE [Dim_Employee] (
    EmployeeID   NVARCHAR(50)   NOT NULL PRIMARY KEY,
    FullName     NVARCHAR(255)  NOT NULL
);

select * from [Dim_Employee];

-- 3. Bảng Dim_Department: Chứa thông tin các phòng ban
CREATE TABLE [Dim_Department] (
    DepartmentID     INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName   NVARCHAR(255)  NOT NULL UNIQUE
);

select * from Dim_Department;

-- 4. Bảng Dim_JobTitle: Chứa thông tin các chức danh công việc
CREATE TABLE [Dim_JobTitle] (
    JobTitleID     INT IDENTITY(1,1) PRIMARY KEY,
    JobTitleName   NVARCHAR(100) NOT NULL UNIQUE
);

select * from Dim_JobTitle;


-- 5. Bảng Dim_Status: Chứa thông tin trạng thái làm việc
CREATE TABLE [Dim_Status] (
    StatusID     INT IDENTITY(1,1) PRIMARY KEY,
    StatusName   NVARCHAR(50) NOT NULL UNIQUE
);

select * from Dim_Status;

-- 6. Bảng Dim_WorkMode: Chứa thông tin chế độ làm việc
CREATE TABLE [Dim_WorkMode] (
    WorkModeID     INT IDENTITY(1,1) PRIMARY KEY,
    WorkModeName   NVARCHAR(50) NOT NULL UNIQUE
);

select * from Dim_WorkMode;

-- 7. Bảng Dim_Date: Chứa thông tin chi tiết về ngày tháng
CREATE TABLE [Dim_Date] (
    DateID     INT IDENTITY(1,1) PRIMARY KEY,
    FullDate   DATE NOT NULL UNIQUE,
    Day        INT  NOT NULL,
    Month      INT  NOT NULL,
    Quarter    INT  NOT NULL,
    Year       INT  NOT NULL
);

select * from Dim_Date;

-- =============================================
-- TẠO BẢNG SỰ KIỆN (FACT)
-- =============================================

CREATE TABLE [Fact_HR] (
    -- Foreign Keys
    EmployeeID     NVARCHAR(50) NOT NULL,
    DepartmentID   INT NOT NULL,
    JobTitleID     INT NOT NULL,
    LocationID     INT NOT NULL,
    StatusID       INT NOT NULL,
    WorkModeID     INT NOT NULL,
    HireDateID     INT NOT NULL,

    -- Measures
    PerformanceRating   DECIMAL(3,1),
    ExperienceYears     DECIMAL(5,2),
    SalaryINR           DECIMAL(18,2),

    -- Foreign Key Constraints
    CONSTRAINT FK_Fact_HR_Dim_Employee
        FOREIGN KEY (EmployeeID) REFERENCES Dim_Employee(EmployeeID),
    CONSTRAINT FK_Fact_HR_Dim_Department
        FOREIGN KEY (DepartmentID) REFERENCES Dim_Department(DepartmentID),
    CONSTRAINT FK_Fact_HR_Dim_JobTitle
        FOREIGN KEY (JobTitleID) REFERENCES Dim_JobTitle(JobTitleID),
    CONSTRAINT FK_Fact_HR_Dim_Location
        FOREIGN KEY (LocationID) REFERENCES Dim_Location(LocationID),
    CONSTRAINT FK_Fact_HR_Dim_Status
        FOREIGN KEY (StatusID) REFERENCES Dim_Status(StatusID),
    CONSTRAINT FK_Fact_HR_Dim_WorkMode
        FOREIGN KEY (WorkModeID) REFERENCES Dim_WorkMode(WorkModeID),
    CONSTRAINT FK_Fact_HR_Dim_Date
        FOREIGN KEY (HireDateID) REFERENCES Dim_Date(DateID)
);

select * from Fact_HR;


Truncate table Fact_HR;
Truncate table Dim_Date;
Truncate table Dim_WorkMode;
Truncate table Dim_Status;
Truncate table Dim_JobTitle;
Truncate table Dim_Department;
Truncate table Dim_Employee;
Truncate table Dim_Location;




