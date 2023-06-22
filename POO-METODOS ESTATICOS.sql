--Palabra reservada STATIC 
-- se habla como metodo a nivel de clase, no contienen datos de la instancia, algo estatico es algo que se muestra igual para todos los elementos de clase sin importar como se llamen o como se creen
-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON;

DECLARE
    prod2 producto;
BEGIN
    --prod2.auditoria()--Ya no se puede llamar asi por que es un producto estatico
    producto.auditoria(); 
END;

--Para base de datos siempre es buena practica elminar la tabla antes de volver a a crearla.
DROP TABLE auditoria;

CREATE TABLE auditoria(
usuario VARCHAR2(100),
fecha DATE
);
--Sentencia que devuelve los objetos de la base personal
SELECT * FROM user_objects WHERE object_name = 'auditoria';

--Sentencia que ace lo mismo pero con like el valor siempre debe ser mayusculas 
SELECT * FROM user_objects WHERE object_name like '%AUD%';

--Sentencia para renombrar tablas
ALTER TABLE auditoria RENAME TO nuevo_nombre;

--leer la tabla
SELECT * FROM auditoria;