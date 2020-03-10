TRUNCATE TABLE employee;
INSERT INTO employee (  employeeId,
                        employeeFirstName,
                        employeeLastName,
                        employeePassword,
                        employeeEmail,
                        availableAmount,
                        maxAmount,
                        pendingAmount,
                        awardedAmount
            )
VALUES  ('JS1324','John','Smith','password','john.smith@gmail.com',1000.00,1000.00,0.00,0.00),
        ('SS1324','Susanne','Smith','pa$$word','susanne.smith@gmail.com',1000.00,1000.00,0.00,0.00)
;
select * from employee;


TRUNCATE TABLE benco;
INSERT INTO benco ( bencoId,
                    bencoFirstName,
                    bencoLastName,
                    bencoPassword,
                    bencoEmail
            )
VALUES  ('TB3059','Tylor','Biggins','p123','tylor.biggins@trms.benco.com'),
        ('JRw0e9','Jeniffer','Robinson','p123','tylor.biggins@trms.benco.com'),
        ('RF3954','Rebecca','Ford','p123','tylor.biggins@trms.benco.com')
;

select * from request;
TRUNCATE TABLE request;
INSERT INTO request(    requestId,
                        employeeId,
                        reimburseType,
                        eventDate,
                        eventTime,

                        eventAddress,
                        eventDescription,
                        eventCost,
                        justification,
                        attachments,

                        attachmentsOfApproval,
                        timeMissedFromWork,
                        bencoId,
                        supervisorId,
                        deptHeadId,

                        denialReason,
                        pending,
                        grade,
                        gradeCutoff,
                        gradeFormat,

                        passed,
                        urgent,
                        preApproved,
                        preApprovalEmail,
	                    approved,

                        awarded,
                        canceled,
                        escalation,
                        elevatedAward,
                        elevatedReason,

                        elevated,
                        presentation,
                        presentationUpload,
                        projectedApproval,
                        approvalType
                    )
VALUES  (1,'JS1324','CollegeCourse','2008-01-15','12:00:00',
         '123 Ave.','Finance 101',100.00,'Is relevent to cashier job',null,
         null,null,1,2,3,
         null,null,null,null,'S',--'StandardGrading',
         null,null,null,null,null,
         null,null,null,null,null,
         null,null,null,null,null),
        (2,'JS1324','CollegeCourse','2009-01-16','12:00:00',
         '123 Ave.','Sports Health',80.00, 'Is relevent to bussing',null,
         null,null,1,2,3,
         null,null,null,null,'S',--'StandardGrading',
         null,null,null,null,null,
         null,null,null,null,null,
         null,null,null,null,null)
;
select * from request;
    -- requestId INTEGER PRIMARY KEY, -- auto-increment and confirmation number. Start at 2948302.

    -- -- Required in Form
    -- employeeId VARCHAR NOT NULL, --fk, for employee info
    -- reimburseType VARCHAR NOT NULL, --FK: Univ=.8, Seminar=.6, CertClasses=.75; Cert=1, TechTraining=.9, Other=.3
    -- eventDate DATE NOT NULL, -- start of event (date)
    -- eventTime TIME NOT NULL, -- when submitted (datetime)
    -- eventAddress VARCHAR NOT NULL,
    -- eventDescription TEXT NOT NULL, -- Could include when the course will be taking place
    -- eventCost NUMERIC(7,2) NOT NULL,
    -- gradeFormat CHAR(1) NOT NULL, --of specific event
    -- justification TEXT NOT NULL,

    -- -- Optional in Form
    -- attachments VARCHAR, --file location: pdf,png,txt,or doc
    -- attachmentsOfApproval VARCHAR, --file location:  .msg file
    -- timeMissedFromWork NUMERIC(8,2),

    -- -- Variables
    -- bencoId VARCHAR, --fk
    -- deptHeadId VARCHAR, --fk
    -- denialReason TEXT,
    -- pending BOOLEAN,
    -- grade CHAR(1),
    -- gradeCutoff CHAR(1), --Has default
    -- gradeFormat VARCHAR,
    -- passed BOOLEAN,
    -- urgent BOOLEAN, --less than 2 weeks left to approve reimbursement
    -- preApproved BOOLEAN,
    -- preApprovalEmail VARCHAR,
	-- approved BOOLEAN, --leave as null, false = request denied. null=not decided.
    -- awarded BOOLEAN,
    -- canceled BOOLEAN,
    -- escalation BOOLEAN, --Needs trigger
    -- elevatedAward BOOLEAN, --exceeds maxAmount
    -- elevatedReason BOOLEAN, --exceeds maxAmount
    -- elevated BOOLEAN, --exceeds maxAmount
    -- presentation BOOLEAN,
    -- presentationUpload VARCHAR, --file location
    -- projectedApproval NUMERIC(7,2),  --displayed as read-only field along with confirmation number (requestId pk)
    -- approvalType VARCHAR -- supervisor, departmenthead, is related specifically to the email attachment .msg, is bencoType
);


-- Junction Table
TRUNCATE TABLE reimburse_type_table;
INSERT INTO reimburse_type_table(   requestId,
                                    reimburseType
            )
VALUES  (2948302,'UniversityCourse'),
        (2948302,'Seminar'),
        (2948302,'CertificationClass'),
        (2948302,'Certification'),
        (2948302,'TechnicalTraining'),
        (2948302,'Other')
;
select * from reimburse_type_table;

--Enumeration Table
TRUNCATE TABLE reimburse_enum;
INSERT INTO reimburse_enum( reimburseType,
                            reimbursePercentage
            )
VALUES  ('UniversityCourse', 0.8),
        ('Seminar', 0.6),
        ('CertificationClass', 0.75),
        ('Certification', 1.0),
        ('TechnicalTraining', 0.9),
        ('Other', 0.3)
;


--Enumeration Table
TRUNCATE TABLE grade_format;
INSERT INTO grade_format(   standardGrading,
                            requestId
            )
VALUES  ('standardGrading',1),
        ('PassFail',2)
; --StandardGrading, FinerGrading, PassFail