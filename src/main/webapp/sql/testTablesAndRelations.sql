DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    employeeId VARCHAR PRIMARY KEY,
    employeeName VARCHAR,
    employeePassword VARCHAR
);

DROP TABLE IF EXISTS request;
CREATE TABLE request(
    requestId SERIAL PRIMARY KEY,
    eventName VARCHAR
);

select * from employee;

select * from request;

COMMIT;
