DROP FUNCTION employee_menu();
CREATE FUNCTION employee_menu(id VARCHAR) RETURNS TABLE(
    reimburse VARCHAR, eDate DATE, pend BOOLEAN, reqId INTEGER
) AS $$
BEGIN
    RETURN QUERY SELECT reimburseType,eventDate,pending,requestId FROM request
    WHERE employeeId = id;
END;$$ LANGUAGE plpgsql;


SELECT employee_menu('JS1324');

SELECT reimburseType,eventDate,pending,requestId FROM request
WHERE employeeId = 'J123';