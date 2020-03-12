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
INSERT INTO request(    --requestId,
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
VALUES  ('JS1324','CollegeCourse','2008-01-15','12:00:00',
         '123 Ave.','Finance 101',100.00,'Is relevent to cashier job',null,
         null,null,1,2,3,
         null,null,null,null,'StandardGrading',
         null,null,null,null,null,
         null,null,null,null,null,
         null,null,null,null,null),
        ('JS1324','CollegeCourse','2009-01-16','12:00:00',
         '123 Ave.','Sports Health',80.00, 'Is relevent to bussing',null,
         null,null,1,2,3,
         null,null,null,null,'StandardGrading',
         null,null,null,null,null,
         null,null,null,null,null,
         null,null,null,null,null)
;
select * from request;


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
SELECT * FROM reimburse_type_table;

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
SELECT * FROM reimburse_enum;


--Enumeration Table
TRUNCATE TABLE grade_format;
INSERT INTO grade_format(   standardGrading,
                            requestId
            )
VALUES  ('StandardGrading',1),
        ('PassFail',2)
; --StandardGrading, FinerGrading, PassFail
SELECT * FROM grade_format;