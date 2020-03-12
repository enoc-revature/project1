DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    employeeId VARCHAR PRIMARY KEY, --pk
    employeeFirstName VARCHAR NOT NULL,
    employeeLastName VARCHAR NOT NULL,
    employeeEmail VARCHAR NOT NULL,
    employeePassword VARCHAR NOT NULL,
    availableAmount NUMERIC(7,2), -- maxAmount - pendingAmount - awardedAmount
    maxAmount NUMERIC(7,2), -- 1000 max check
    pendingAmount NUMERIC(7,2), -- trigger to reset each year
    awardedAmount NUMERIC(7,2), -- trigger to reset each year
    reportsTo VARCHAR
);

DROP TABLE IF EXISTS benco;
CREATE TABLE benco(
    bencoId VARCHAR PRIMARY KEY,
    bencoFirstName VARCHAR NOT NULL,
    bencoLastName VARCHAR NOT NULL,
    bencoPassword VARCHAR NOT NULL,
    bencoEmail VARCHAR NOT NULL
);


DROP TABLE IF EXISTS request;
CREATE TABLE request(
    requestId SERIAL PRIMARY KEY, -- auto-increment and confirmation number. Start at 2948302.

    -- Required in Form
    employeeId VARCHAR NOT NULL, --fk, for employee info
    reimburseType VARCHAR NOT NULL, --FK: Univ=.8, Seminar=.6, CertClasses=.75; Cert=1, TechTraining=.9, Other=.3
    eventDate VARCHAR NOT NULL, -- start of event (date)
    eventTime VARCHAR NOT NULL, -- when submitted (datetime)
    eventAddress VARCHAR NOT NULL,
    eventDescription TEXT NOT NULL, -- Could include when the course will be taking place
    eventCost NUMERIC(7,2) NOT NULL,
    gradeFormat VARCHAR NOT NULL, --of specific event
    justification TEXT NOT NULL,

    -- Optional in Form
    attachments VARCHAR, --file location: pdf,png,txt,or doc
    attachmentsOfApproval VARCHAR, --file location: .msg file
    timeMissedFromWork NUMERIC(8,2),

    -- Variables
    bencoId VARCHAR, --fk
    supervisorId VARCHAR, --fk
    deptHeadId VARCHAR, --fk
    denialReason TEXT,
    pending BOOLEAN,
    grade CHAR(1),
    gradeCutoff CHAR(1), --Has default
    passed BOOLEAN,
    urgent BOOLEAN, --less than 2 weeks left to approve reimbursement
    preApproved BOOLEAN,
    preApprovalEmail VARCHAR,
	approved BOOLEAN, --leave as null, false = request denied. null=not decided.
    awarded BOOLEAN,
    canceled BOOLEAN,
    escalation BOOLEAN, --Needs trigger
    elevatedAward BOOLEAN, --exceeds maxAmount
    elevatedReason BOOLEAN, --exceeds maxAmount
    elevated BOOLEAN, --exceeds maxAmount
    presentation BOOLEAN,
    presentationUpload VARCHAR, --file location
    projectedApproval NUMERIC(7,2),  --displayed as read-only field along with confirmation number (requestId pk)
    approvalType VARCHAR -- supervisor, departmenthead, is related specifically to the email attachment .msg, is bencoType
);

-- Junction Table
DROP TABLE IF EXISTS reimburse_type_table;
CREATE TABLE reimburse_type_table(
    requestId INTEGER,
    reimburseType VARCHAR,
    FOREIGN KEY(requestId) REFERENCES request(requestId), -- DELETE ON CASCADE,
    FOREIGN KEY(reimburseType) REFERENCES reimburse_enum(reimburseType), -- DELETE ON CASCADE,
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
    standardGrading VARCHAR PRIMARY KEY,
    requestId INTEGER,
    FOREIGN KEY(requestId) REFERENCES request(requestId)
);

--Enumeration Table
-- DELETE TABLE grade_format;
-- CREATE TABLE grade_format(
--     requestId INTEGER,
--     standardGradeFarmat INTEGER,
--     gradeFormat CHAR(2) NOT NULL, --of specific event, StandardGrading, FinerGrading, PassFail
--     FOREIGN KEY(requestId) REFERENCES request(requestId)
-- );


--Enumeration Table
-- DELETE TABLE benco_type;
-- CREATE TABLE benco_type(
--     bencoId VARCHAR,
--     bencoType VARCHAR,
--     FOREIGN KEY(bencoId) REFERENCES benco(bencoId)
-- );