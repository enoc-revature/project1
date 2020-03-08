DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    employeeId VARCHAR NOT NULL, --pk
    employeeFirstName VARCHAR NOT NULL,
    employeeLastName VARCHAR NOT NULL,
    employeeEmail VARCHAR NOT NULL,
    employeePassword VARCHAR NOT NULL,
    availableAmount NUMERIC(7,2), -- maxAmount - pendingAmount - awardedAmount
    maxAmount NUMERIC(7,2), -- 1000 max check
    pendingAmount NUMERIC(7,2), -- trigger to reset each year
    awardedAmount NUMERIC(7,2), -- trigger to reset each year
    reportsTo VARCHAR UNIQUE
);

DROP TABLE IF EXISTS benco;
CREATE TABLE benco(
    bencoId VARCHAR PRIMARY KEY,
    bencoFirstName VARCHAR NOT NULL,
    bencoLastName VARCHAR NOT NULL,
    bencoEmail VARCHAR NOT NULL,
    bencoType VARCHAR NOT NULL,
    bencoPassword VARCHAR NOT NULL 
);

-- Junction Table
DROP TABLE IF EXISTS reimburse_type_table
CREATE TABLE reimburse_type_table(
    requestId INTEGER,
    reimburseType VARCHAR,
    FOREIGN KEY requestId REFERENCES request(requestId) DELETE ON CASCADE,
    FOREIGN KEY reimburseType REFERENCES reimburse_enum(reimburseType) DELETE ON CASCADE,
    PRIMARY KEY (requestId, reimburseType)
);

--Enumeration Table
DROP TABLE IF EXISTS reimburse_enum;
CREATE TABLE reimburse_enum(
    reimburseType VARCHAR PRIMARY KEY, --FK: Univ=.8, Seminar=.6, CertClasses=.75; Cert=1, TechTraining=.9, Other=.3
    reimbursePercentage NUMERIC(3,2) NOT NULL
        CONSTRAINT reimburse_perc_bounds CHECK(reimbursePercentage BETWEEN 0.00 AND 1.00)
);


--Enumeration Table
DROP TABLE IF EXISTS grade_format;
CREATE TABLE grade_format(
    requestId INTEGER,
    standardGradeFarmat INTEGER,
    gradeFormat CHAR(2) NOT NULL, --of specific event, can be A,..,F or A+,A,---,D,D-,F. Also P/F for pass/fail
    FOREIGN KEY(requestId) REFERENCES request(requestId) DELETE ON CASCADE
);


--Enumeration Table
DROP TABLE IF EXISTS benco_type;
CREATE TABLE benco_type(
    bencoId VARCHAR,
    bencoType VARCHAR,
    FOREIGN KEY(bencoId) REFERENCES benco(bencoId)
);
