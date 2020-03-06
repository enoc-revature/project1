DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    employeeId VARCHAR NOT NULL, --pk
    employeeFirstName VARCHAR NOT NULL,
    employeeLastName VARCHAR NOT NULL,
    employeeEmail VARCHAR NOT NULL,
    availableAmount NUMERIC(7,2), -- maxAmount - pendingAmount - awardedAmount
    maxAmount NUMERIC(7,2), -- 1000 max check
    pendingAmount NUMERIC(7,2), -- trigger to reset each year
    awardedAmount NUMERIC(7,2), -- trigger to reset each year
);

DROP TABLE IF EXISTS benco;
CREATE TABLE employee(
    bencoId VARCHAR,
    bencoFirstName VARCHAR,
    bencoLastName VARCHAR,
    bencoEmail VARCHAR,
    reportsTo VARCHAR,
    bencoType VARCHAR 
);

-- Junction Table
DROP TABLE IF EXISTS reimburse_type_table
CREATE TABLE employee(
    requestId INTEGER,
    reimburseType VARCHAR,
    reimbursePercentage
);

--Enumeration Table
DROP TABLE IF EXISTS reimburse_enum;
CREATE TABLE employee(
    requestId INTEGER,
    reimburseType VARCHAR,
    reimbursePercentage VARCHAR

);


DROP TABLE IF EXISTS benco_type;
CREATE TABLE reimburse_enum(
    reimburseType VARCHAR NOT NULL, --FK: Univ=.8, Seminar=.6, CertClasses=.75; Cert=1, TechTraining=.9, Other=.3
    reimbursePercentage NUMERIC(3,2) NOT NULL
        CONSTRAINT reimburse_perc_bounds CHECK(reimbursePercentage BETWEEN 0.00 AND 1.00),
    FOREIGN KEY(requestId) REFERENCES request(requestId)
)


DROP TABLE IF EXISTS grade_format;
CREATE TABLE grade_format(
    requestId INTEGER,
    standardGradeFarmat INTEGER,
    gradeFormat CHAR(2) NOT NULL, --of specific event, can be A,..,F or A+,A,---,D,D-,F. Also P/F for pass/fail
    FOREIGN KEY(requestId) REFERENCES request(requestId)
);


DROP TABLE IF EXISTS benco_type;
CREATE TABLE benco_type(
    bencoId VARCHAR,
    bencoType VARCHAR,
    FOREIGN KEY(bencoId) REFERENCES benco(bencoId)
);