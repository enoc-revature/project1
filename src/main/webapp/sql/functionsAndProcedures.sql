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


/*
DROP FUNCTION employee_menu(VARCHAR);
CREATE OR REPLACE FUNCTION employee_menu(id VARCHAR) RETURNS TABLE(
    reimburse VARCHAR, eDate DATE, pend BOOLEAN, reqId INTEGER
) AS $$
DECLARE 
    var_r record;
BEGIN
   FOR var_r IN(SELECT reimburseType,eventDate,pending,requestId
                FROM request 
                WHERE employeeId = id)
   LOOP
        reimburse := var_r.reimburseType; 
        eDate := var_r.eventDate;
        pend := var_r.pending;
        reqId := var_r.requestId;
        RETURN NEXT;
   END LOOP;
END;$$ LANGUAGE plpgsql;
*/


SELECT employee_menu('JS1324');


SELECT reimburseType,eventDate,pending,requestId FROM request
WHERE employeeId = 'J123';