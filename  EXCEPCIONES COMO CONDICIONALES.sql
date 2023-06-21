SET SERVEROUTPUT ON;
DECLARE
    region1 regions%rowtype;
    region_control regions.region_id%type;
BEGIN
    region1.region_id := 100;
    region1.region_name := 'Africa';
    SELECT region_id INTO region_control FROM regions
    WHERE region_id = region1.region_id;
    DBMS_OUTPUT.PUT_LINE('LA REGION YA WXISTE');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO regions VALUES(region1.region_id, region1.region_name);
    COMMIT;
END;

--Contexto: En este caso en caso de no existir la excepcion la agregara a la tabla regions, PERO desde el bloque de ESCEPCIONS

SELECT * FROM regions;