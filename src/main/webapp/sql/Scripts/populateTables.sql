TRUNCATE TABLE employee;
INSERT INTO employee (  employeeId,
                        employeeFirstName,
                        employeeLastName,
                        employeeEmail,
                        availableAmount,
                        maxAmount,
                        pendingAmount,
                        awardedAmount
            )
VALUES  ('JS1324','John','Smith','john.smith@gmail.com',1000.00,1000.00,0.00,0.00),
        ('SS1324','Susanne','Smith','susanne.smith@gmail.com',1000.00,1000.00,0.00,0.00)
;



TRUNCATE TABLE benco;
INSERT INTO benco ( bencoId,
                    bencoFirstName,
                    bencoLastName,
                    bencoEmail,
                    reportsTo,
                    bencoType 
            )
VALUES  ('TB3059','Tylor','Biggins','tylor.biggins@trms.benco.com','JRw0e9', 'Benco'),
        ('JRw0e9','Jeniffer','Robinson','tylor.biggins@trms.benco.com','RF3954', 'Supervisor'),
        ('RF3954','Rebecca','Ford','tylor.biggins@trms.benco.com',NULL, 'DepartmentHead')
; -- bencoType VARCHAR -- BenCo, Supervisor, DeptHead.



-- Junction Table
TRUNCATE TABLE reimburse_type_table
INSERT INTO reimburse_type_table(   requestId,
                                    reimburseType,
                                    reimbursePercentage
            )
VALUES  (2948302,'UniversityCourse'),
        (2948302,'Seminar'),
        (2948302,'CertificationClass'5),
        (2948302,'Certification'),
        (2948302,'TechnicalTraining'),
        (2948302,'Other')
;

--Enumeration Table
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


CREATE TABLE reimburse_enum( -- //TODO: insert values
    reimburseType VARCHAR NOT NULL, --FK: Univ=.8, Seminar=.6, CertClasses=.75; Cert=1, TechTraining=.9, Other=.3
    reimbursePercentage NUMERIC(3,2) NOT NULL
        CONSTRAINT reimburse_perc_bounds CHECK(reimbursePercentage BETWEEN 0.00 AND 1.00),
    FOREIGN KEY(requestId) REFERENCES request(requestId)
)


TRUNCATE TABLE grade_format;
CREATE TABLE grade_format(
    requestId INTEGER,
    standardGradeFarmat INTEGER,
    gradeFormat CHAR(2) NOT NULL, --of specific event, can be A,..,F or A+,A,---,D,D-,F. Also P/F for pass/fail
    FOREIGN KEY(requestId) REFERENCES request(requestId)
);


INSERT INTO grade_format(

);



TRUNCATE TABLE benco_type;
CREATE TABLE benco_type(
    bencoId VARCHAR,
    bencoType VARCHAR,
    FOREIGN KEY(bencoId) REFERENCES benco(bencoId)
);