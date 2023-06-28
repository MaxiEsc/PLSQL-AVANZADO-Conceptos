--Tecnologia JSON en PLSQL en oracle 11g edition

DROP TABLE productos;

--creacion de una tabla para manejar los objetos JSON
CREATE TABLE productos(
codigo INT,
nombre VARCHAR(200),
datos VARCHAR2(4000)
);

--Ingresar elementos JSON
INSERT INTO productos VALUES(1, 'Ejemplo JSON', '
{
"pais": "Argentina",
"ciudad":"Buenos Aires",
"Poblacion":"42000000"
}
');

