DROP FUNCTION employee_menu(VARCHAR);
CREATE OR REPLACE FUNCTION employee_menu(id VARCHAR) RETURNS TABLE(
    --reimburse VARCHAR, eDate DATE, pend BOOLEAN, reqId INTEGER
    reimburseType VARCHAR, eventDate DATE, pending BOOLEAN, requestId INTEGER
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
    reimburseType VARCHAR, eventDate DATE, pending BOOLEAN, requestId INTEGER
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

DROP FUNCTION request_details(INTEGER);
CREATE OR REPLACE PROCEDURE request_details(
    IN id INTEGER
) AS $$
BEGIN
    INSERT INTO request
            request.reimburseType,
            request.eventDate,
            request.pending,
            request.requestId
    VALUES id
END;$$ LANGUAGE plpgsql;

SELECT * FROM request_details(1);
