--Sobrecarga de operadoers de objetos
--Bueno como en la programacion orientada objetos un metodo cuyo nombre sea igual con  omportamientos distinto en este caso ejemplo sera con calcular un descuento de impuesto.
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;
DECLARE
    prod3 producto;
BEGIN
    prod3 := producto(101,'Sandias',10);--Este constructor a pesar de haber creado el otro sigue funcionando
    DBMS_OUTPUT.PUT_LINE('Precio en descuento: ' || prod3.ver_precio(50));
    DBMS_OUTPUT.PUT_LINE('Precio: ' || prod3.ver_precio());
    prod3.cambiar_precio(20);
    DBMS_OUTPUT.PUT_LINE('Precio en descuento: ' || prod3.ver_precio(50));
    DBMS_OUTPUT.PUT_LINE('Precio: ' || prod3.ver_precio());
END;