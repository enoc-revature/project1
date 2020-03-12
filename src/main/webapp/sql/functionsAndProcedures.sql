DROP FUNCTION employee_menu(VARCHAR);
CREATE OR REPLACE FUNCTION employee_menu(id VARCHAR) RETURNS TABLE(
    --reimburse VARCHAR, eDate DATE, pend BOOLEAN, reqId INTEGER
    reimburseType VARCHAR, eventDate VARCHAR, pending BOOLEAN, requestId INTEGER
) AS $$
BEGIN
    RETURN QUERY SELECT
            request.reimburseType,
            request.eventDate,
            request.pending,
            request.requestId
        FROM request
    WHERE employeeId = id;
END;$$ LANGUAGE plpgsql;

SELECT * FROM employee_menu('JS1324');


DROP FUNCTION request_details(INTEGER);
CREATE OR REPLACE FUNCTION request_details(id INTEGER) RETURNS TABLE(
    reimburseType VARCHAR, eventDate VARCHAR, pending BOOLEAN, requestId INTEGER
) AS $$
BEGIN
    RETURN QUERY SELECT
            request.reimburseType,
            request.eventDate,
            request.pending,
            request.requestId
        FROM request
    WHERE request.requestId = id;
END;$$ LANGUAGE plpgsql;

SELECT * FROM request_details(1);


-- Trigger for requestId
/*
drop function func_insert_request();
create or replace function func_insert_employee()
returns trigger as $$
begin
	if(TG_OP = 'INSERT') then
		new.requestId = (select max(requestId) from request);
		new.requestId = new.requestId + 1;
	end if;
return new;
end; $$language plpgsql;

drop trigger trig_insert_employee on request;
create trigger trig_insert_employee
	before insert on request
	for each row
		execute procedure func_insert_request();
*/

DROP PROCEDURE create_request(VARCHAR, VARCHAR, BOOLEAN, VARCHAR, VARCHAR,
                              VARCHAR, TEXT, NUMERIC,VARCHAR,TEXT);
CREATE OR REPLACE PROCEDURE create_request(
            IN reimburseType VARCHAR,
            IN eventDate DATE,
            IN pending BOOLEAN,
            IN employeeId VARCHAR,
            IN eventTime TIME,
            IN eventAddress VARCHAR,
            IN eventDescription TEXT,
            IN eventCost NUMERIC,
            --IN eventCost DOUBLE PRECISION,
            IN gradeFormat VARCHAR,
            IN justification TEXT
) AS $$
BEGIN
    INSERT INTO request
            (reimburseType,
            eventDate,
            pending,
            employeeId,
            eventTime,
            eventAddress,
            eventDescription,
            eventCost,
            gradeFormat,
            justification)

    VALUES (reimburseType,
            eventDate,
            pending,
            employeeId,
            eventTime,
            eventAddress,
            eventDescription,
            eventCost,
            gradeFormat,
            justification);
END;$$ LANGUAGE plpgsql;

CALL create_request('TEST_TYPE','2001-01-01', true, 'JS1324', '12:00:00',
                     '123 Ave.','College Course',
                     100, 'SandardGrading','Stuff');

SELECT * FROM request;

/*
INSERT INTO request
        (reimburseType,
        eventDate,
        pending,
        employeeId,
        eventTime,
        eventAddress,
        eventDescription,
        eventCost,
        gradeFormat,
        justification)
        -- request.requestId
VALUES ('TEST_TYPE','2001-01-01', true, 'JS1324', '12:00:00','123 Ave.','College Course',
        100.00, 'SandardGrading','Stuff');
*/


SELECT * FROM benco;