DROP TABLE IF EXISTS nf0;
CREATE TABLE nf0(
    employeeId VARCHAR NOT NULL, --pk
    employeeFirstName VARCHAR NOT NULL,
    employeeLastName VARCHAR NOT NULL,
    employeeEmail VARCHAR NOT NULL,
    directSupervisorId VARCHAR, --pk
    directSupervisorFirstName VARCHAR,
    directSupervisorLastName VARCHAR,
    directSupervisorEmail VARCHAR,
    bencoId VARCHAR, --pk
    bencoFirstName VARCHAR,
    bencoLastName VARCHAR,
    bencoEmail VARCHAR,
    reportsTo VARCHAR, --ids to be used with self join, the id of the direct supervisor for BenCo
    deptHeadId VARCHAR, --pk
    deptHeadFirstName VARCHAR,
    deptHeadLastName VARCHAR,
    deptHeadEmail VARCHAR,
    denialReason TEXT,
    availableAmount NUMERIC(7,2), -- maxAmount - pendingAmount - awardedAmount
    maxAmount NUMERIC(7,2), -- 1000 max check
    pendingAmount NUMERIC(7,2), -- trigger to reset each year
    awardedAmount NUMERIC(7,2), -- trigger to reset each year
    pending BOOLEAN,
    grade CHAR(1),
    passingGrade CHAR(1), --Has default
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
    reimburseType VARCHAR NOT NULL, --FK: Univ=.8, Seminar=.6, CertClasses=.75; Cert=1, TechTraining=.9, Other=.3
    eventDate DATE NOT NULL, -- start of event (date)
    eventTime TIME NOT NULL, -- when submitted (datetime)
    eventAddress VARCHAR NOT NULL,
    eventDescription TEXT NOT NULL, -- Could include when the course will be taking place
    eventCost NUMERIC(7,2) NOT NULL,
    gradeFormat CHAR(1) NOT NULL, --of specific event
    justification TEXT NOT NULL,
    attachments VARCHAR, --file location: pdf,png,txt,or doc
    attachmentsOfApproval VARCHAR, --file location:  .msg file
    projectedApproval NUMERIC(7,2),  --displayed as read-only field along with confirmation number (requestId pk)
    requestId INTEGER, -- pk, auto-increment and confirmation number. Start at 2948302.
    approvalType VARCHAR, -- supervisor, departmenthead, is related specifically to the email attachment .msg, is bencoType
    timeMissedFromWork NUMERIC(8,2)
);


