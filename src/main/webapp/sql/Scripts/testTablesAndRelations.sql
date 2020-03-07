DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    employeeid VARCHAR PRIMARY KEY,
    employeeName VARCHAR
);

DROP TABLE IF EXISTS request;
CREATE TABLE request(
    request SERIAL PRIMARY KEY,
    eventName VARCHAR
);

select * from employee;

select * from request;

COMMIT;
