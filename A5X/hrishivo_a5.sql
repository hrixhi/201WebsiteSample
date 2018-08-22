DROP DATABASE IF EXISTS hrishivo_201_site;
CREATE DATABASE hrishivo_201_site;

USE hrishivo_201_site;

# complete yes Populated  Retrieved
CREATE TABLE Course (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    year VARCHAR(100) NOT NULL,
    units VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    term VARCHAR(100) NOT NULL,
    
	syllabus VARCHAR(100) NOT NULL,	
    staffMembers VARCHAR(100) NOT NULL,	
    meetings VARCHAR(100) NOT NULL,	
    assignments VARCHAR(100) NOT NULL,
    exams VARCHAR(100) NOT NULL, 
    schedule VARCHAR(100) NOT NULL 
    
);

# complete yes Populated Retrieved
CREATE TABLE Department (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    longName VARCHAR(100) NOT NULL,
    prefix VARCHAR(100) NOT NULL,
    courses VARCHAR(100) NOT NULL,
    
    coursesID INT(11),
    
    FOREIGN KEY fk1(coursesID) REFERENCES Course(ID)
    
);


# complete yes Populated Retrieved
CREATE TABLE School (

    ID int(11) NOT NULL PRIMARY KEY auto_increment,	
    name VARCHAR(100) NOT NULL,
    image VARCHAR(100) NOT NULL,
    departments VARCHAR(100) NOT NULL,
    departmentsID INT(11),
    
    FOREIGN KEY fk2(departmentsID) REFERENCES Department(ID)
    
);


# complete yes Populated  Retrieved
CREATE TABLE Syllabus (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    url VARCHAR(100) NOT NULL
    
);

# complete yes Populated Retrieved
CREATE TABLE OfficeHours (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    day VARCHAR(100) NOT NULL,
    
	time VARCHAR(100) NOT NULL
     
);


# complete yes Populated Retrieved
CREATE TABLE StaffMembers (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    type VARCHAR(100) NOT NULL,
    idx VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    image VARCHAR(100) NOT NULL,
    phone VARCHAR(100),
    office VARCHAR(100),
    
	name VARCHAR(100) NOT NULL,
	officeHours VARCHAR(100), 
    
     officeHoursID INT(11),
    
    FOREIGN KEY fk3(officeHoursID) REFERENCES OfficeHours(ID)
    
);

# complete yes Populated Retrieved
CREATE TABLE Meetings (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
	type VARCHAR(100) NOT NULL,
    room VARCHAR(100) NOT NULL,
    section VARCHAR(100) NOT NULL,
    
	meetingPeriods VARCHAR(100) NOT NULL, 	
	assistants VARCHAR(100),
    
	meetingsID INT(11),
    
    FOREIGN KEY fk4(meetingsID) REFERENCES OfficeHours(ID)
    
);

# complete yes populated Retrieved
CREATE TABLE Assignments (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
	number VARCHAR(100) NOT NULL,
    title VARCHAR(100) ,
    assignedDate VARCHAR(100),
    dueDate VARCHAR(100) ,
    url VARCHAR(100),
    gradePercentage VARCHAR(100),
    
	files VARCHAR(100),	
    deliverables VARCHAR(100)  

);

# complete yes populated Retrived
CREATE TABLE Exams (
	ID int(11) NOT NULL PRIMARY KEY auto_increment,
	semester VARCHAR(100) NOT NULL,
    year VARCHAR(100) NOT NULL,
    
	tests VARCHAR(100) NOT NULL	
    
);

# complete yes populated
CREATE TABLE Schedule (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    
    textbooks VARCHAR(100) NOT NULL, 
    weeks VARCHAR(100) NOT NULL 
    
);

# complete yes Populated Retrieved
CREATE TABLE Names (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    fname VARCHAR(100) NOT NULL, 
    lname VARCHAR(100) NOT NULL
    
);

# complete yes Populated Retrieved
CREATE TABLE Time (

	ID int(11) NOT NULL PRIMARY KEY auto_increment, 
    start VARCHAR(100) NOT NULL, 
    end VARCHAR(100) NOT NULL
    
);

# complete yes Populated Retrieved
CREATE TABLE Assistants (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
	staffMemberID VARCHAR(100) NOT NULL
    
);

# complete yes populated Retrived
CREATE TABLE Files (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
    
);

# complete yes populated Retrieved
CREATE TABLE DelivFiles (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
    
);

# complete yes populated Retrieved
CREATE TABLE TestFiles (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
    
);

# complete yes populated Retrived
CREATE TABLE Deliverables (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL, 
    gradePercentage VARCHAR(100) NOT NULL,
    dueDate VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
	delivFiles VARCHAR(100), 
    
    fileID INT(11),
    FOREIGN KEY fk5(fileID) REFERENCES DelivFiles(ID)
    
);

# complete yes populated Retrieved
CREATE TABLE Tests (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    title VARCHAR(100) NOT NULL,
	testFiles VARCHAR(100) NOT NULL, 
    
    fileID INT(11),
    
    FOREIGN KEY fk6(fileID) REFERENCES TestFiles(ID)
    
);

# complete yes populated Retrived
CREATE TABLE Textbook (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
	number VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    publisher VARCHAR(100) NOT NULL,
    year VARCHAR(100) NOT NULL,
    isbn VARCHAR(100) NOT NULL
    
);

# complete yes populated
CREATE TABLE Weeks (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
	week VARCHAR(100) NOT NULL,
	
    labs VARCHAR(100) NOT NULL,	
	lectures VARCHAR(100) NOT NULL 
    
);

# complete yes populated
CREATE TABLE LabFiles (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
    
);

# complete yes populated
CREATE TABLE Labs (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL,
    
	labFiles VARCHAR(100), 
    
	fileID INT(11),
    
    FOREIGN KEY fk7(fileID) REFERENCES LabFiles(ID)
    
);


# complete yes populated
CREATE TABLE Lectures (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    day VARCHAR(100) NOT NULL,
    date VARCHAR(100) NOT NULL,
    
	topics VARCHAR(100) NOT NULL 
    
);

# complete yes populated
CREATE TABLE Topics (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    url VARCHAR(100),
    number VARCHAR(100) NOT NULL,
    chapter VARCHAR(100),
    title VARCHAR(100) NOT NULL,
    
	programs VARCHAR(100)  
    
);

# complete yes populated
CREATE TABLE ProgramFiles (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,
    number VARCHAR(100) NOT NULL,
    url VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
    
);

# complete yes populated
CREATE TABLE Programs (

	ID int(11) NOT NULL PRIMARY KEY auto_increment,

	programFiles VARCHAR(100), 
    
    fileID INT(11),
    
    FOREIGN KEY fk8(fileID) REFERENCES ProgramFiles(ID)
    
);

SHOW TABLES;