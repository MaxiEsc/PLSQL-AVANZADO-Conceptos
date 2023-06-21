SET SERVEROUTPUT ON;

DECLARE

    emple employees%rowtype;
    codigo number;
    mensaje VARCHAR2(100);
BEGIN
    SELECT * INTO emple FROM employees;
    DBMS_OUTPUT.PUT_LINE(emple.salary);
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(sqlcode);
    DBMS_OUTPUT.PUT_LINE(sqlerrm);
    codigo := sqlcode;
    mensaje := sqlerrm;
    INSERT INTO errores VALUES(codigo,mensaje);
    commit;
END;

--Conceptos:
--En las eceptiones van a parar todos lor errores del sistemas ya sean controlados o no....
--
--sqlcode:Nos devuelve el codigo del error que maneja la excepcion  
--sqlerrm:Nos trae el mensaje del error que ha ocurrido
