-- Habilitar la consola de la base de datos
SET SERVEROUTPUT ON
DECLARE 
    TYPE departamentos IS TABLE OF departments.department_name%TYPE
    INDEX BY PLS_INTEGER;

    depa departamentos;

    TYPE empleados IS TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;

    emple empleados;
    
    
    TYPE nombre IS TABLE OF employees.first_name%TYPE
    INDEX BY VARCHAR(2);
    
    nom nombre;
BEGIN
    depa(1) :='HOLA';
    depa(2) :='Adios';
    depa(50) :='Cualquir valor';
    depa(-10) := 'Es negativo';
    nom('aa') :=  'son Asss';
    
    DBMS_OUTPUT.PUT_LINE(depa(50));
    DBMS_OUTPUT.PUT_LINE(depa(-10));
    DBMS_OUTPUT.PUT_LINE(nom('aa'));
END;


--Colecciones en PLSQL

--Las colecciones es un tipo de dato compuesto en una matriz que consiste en una matriz unidimencional que permite el acceso atravez de un indice
--Comenzando con los arrays asociativos son colecciones que tienen dos columnas una clave primaria, mas un valor(Puede ser escalar o de tipo record)
--Las posiciones se crean de manera dinamica .

--Declaramos un objeto y que sea de tipo coleccion 


--__________________________________________________________________________________________________________________________________________
--DECLARE 
----Creamos un tabla departamentos con el tipo de datos que maneja el campo departments_name precargado en el sistema como la tabla departments
----%TYPE decimos que lo hacemos de tipo columnas, en este caso es solo del la departments_name name de la tabla departments
--TYPE departamento IS TABLE OF departments.departaments_name%TYPE
--INDEX BY PLS_INTEGER;
--
--depa departamentos;
--
----Creamos una tabla de empleados bansandonos en las tablas del sistema
----%Rowtype toma toda la tabla, puede tener multiples columnas
--TYPE empleados IS TABLE OF employeer%rowtype 
--INDEX BY PLS_INTEGER;
--
--emple empleados;
--BEGIN
--depa(1) :='HOLA';
--depa(2) :='Adios';
--depa(50) :='Cualquir valor';
-- En este caso el indice se hace como strings con las  comillas-> ''
--nom('aa') :=  'son Asss';
--DBMS_OUTPUT.PUT_LINE(depa(50));
--DBMS_OUTPUT.PUT_LINE(depa(-10));
--Aqui tambien lleva comillas
--DBMS_OUTPUT.PUT_LINE(nom('aa'));
--
----Tabla dentro de HR
--SELECT * FROM departments;
----Tabla dentro de HR
--SELECT * FROM employees;
-- En este caso a este tipo de array se los conoce como de tipo SPARSE es parecido al concepto de mapa en JAVA pues necesita una clave para devolver un valor es dinamico y desordenado
-- 
--END;
--______________________________________________________________________________________________________________________________________________