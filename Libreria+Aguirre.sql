
-- Creacion de tablas
drop database if exists LIBRERIA;
CREATE DATABASE LIBRERIA;

USE LIBRERIA;

CREATE TABLE LIBRERIA.PROVINCIA (
	  ID_PROVINCIA			INT NOT NULL AUTO_INCREMENT UNIQUE
	, NOMBRE				VARCHAR(200)	NOT NULL
	, PRIMARY KEY (ID_PROVINCIA)
);

CREATE TABLE LIBRERIA.CIUDAD (
	  ID_CIUDAD			    INT NOT NULL AUTO_INCREMENT UNIQUE
	, NOMBRE				VARCHAR(200)	NOT NULL
	, ID_PROVINCIA			INT   
	, PRIMARY KEY (ID_CIUDAD) 
    , FOREIGN KEY (ID_PROVINCIA) REFERENCES PROVINCIA(ID_PROVINCIA) ON DELETE CASCADE
);

CREATE TABLE LIBRERIA.CLIENTE (
	  ID_CLIENTE			INT NOT NULL AUTO_INCREMENT UNIQUE
	, DNI		            INT
    , TELEFONO		        INT
    , ID_CIUDAD		        INT
	, NOMBRE				VARCHAR(200)
    , APELLIDO				VARCHAR(200)
	, DOMICILIO				VARCHAR(300)
	, PRIMARY KEY (ID_CLIENTE)
    , FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD) ON DELETE CASCADE
);

CREATE TABLE LIBRERIA.ESTADO_PEDIDO (
	  ID_ESTADO				INT NOT NULL AUTO_INCREMENT UNIQUE
	, DESCRIPCION			VARCHAR(200) 	NOT NULL
	, PRIMARY KEY (ID_ESTADO)
);

CREATE TABLE LIBRERIA.PEDIDO (
	  ID_PEDIDO				INT NOT NULL AUTO_INCREMENT UNIQUE
	, FECHA		            DATE NOT NULL
    , ID_ESTADO		        INT NOT NULL
    , ID_CLIENTE 	        INT NOT NULL
	, PRIMARY KEY (ID_PEDIDO)
    , FOREIGN KEY (ID_ESTADO) REFERENCES ESTADO_PEDIDO(ID_ESTADO) ON DELETE CASCADE
    , FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE) ON DELETE CASCADE
);

CREATE TABLE LIBRERIA.IDIOMA (
	  ID_IDIOMA				INT NOT NULL AUTO_INCREMENT UNIQUE
	, NOMBRE				VARCHAR(200) 	NOT NULL
	, PRIMARY KEY (ID_IDIOMA)
);

CREATE TABLE LIBRERIA.EDITORIAL (
	  ID_EDITORIAL			INT NOT NULL AUTO_INCREMENT UNIQUE
	, NOMBRE				VARCHAR(200) 	NOT NULL
	, PRIMARY KEY (ID_EDITORIAL)
);

CREATE TABLE LIBRERIA.AUTOR (
	  ID_AUTOR       		INT NOT NULL AUTO_INCREMENT UNIQUE
	, NOMBRE				VARCHAR(200) 	
    , APELLIDO				VARCHAR(200) 	
	, PRIMARY KEY (ID_AUTOR)
);


CREATE TABLE LIBRERIA.GENERO (
	  ID_GENERO       		INT NOT NULL AUTO_INCREMENT UNIQUE
	, NOMBRE				VARCHAR(200) 		
	, PRIMARY KEY (ID_GENERO)
);

CREATE TABLE LIBRERIA.DESCUENTO (
	  ID_DESCUENTO       		INT NOT NULL AUTO_INCREMENT UNIQUE
	, PORCENTAJE				VARCHAR(200) 		
	, PRIMARY KEY (ID_DESCUENTO)
);

CREATE TABLE LIBRERIA.VALORACION (
	  ID_VALORACION       		INT NOT NULL AUTO_INCREMENT UNIQUE
	, DESCRIPCION				VARCHAR(200) 		
	, PRIMARY KEY (ID_VALORACION)
);

CREATE TABLE LIBRERIA.TAPA (
	  ID_TAPA       		INT NOT NULL AUTO_INCREMENT UNIQUE
	, DESCRIPCION			VARCHAR(200) 		
	, PRIMARY KEY (ID_TAPA)
);

CREATE TABLE LIBRERIA.LIBRO (
	  ID_LIBRO			    INT NOT NULL AUTO_INCREMENT UNIQUE
	, TITULO				VARCHAR(200) 	NOT NULL
    , PRECIO		        DECIMAL(15,2) 	NOT NULL
    , ISBN 	           	    INT
    , ID_EDITORIAL 	        INT 
    , ID_IDIOMA	            INT 
    , ID_AUTOR 	            INT 
    , ID_GENERO 	        INT 
    , ID_DESCUENTO 	        INT 
    , ID_VALORACION 	    INT 
    , ID_TAPA 	            INT 
	, PRIMARY KEY (ID_LIBRO)
    , FOREIGN KEY (ID_EDITORIAL) REFERENCES EDITORIAL(ID_EDITORIAL) ON DELETE CASCADE
    , FOREIGN KEY (ID_IDIOMA) REFERENCES IDIOMA(ID_IDIOMA) ON DELETE CASCADE
    , FOREIGN KEY (ID_AUTOR) REFERENCES AUTOR(ID_AUTOR) ON DELETE CASCADE
    , FOREIGN KEY (ID_GENERO) REFERENCES GENERO(ID_GENERO) ON DELETE CASCADE
    , FOREIGN KEY (ID_DESCUENTO) REFERENCES DESCUENTO(ID_DESCUENTO) ON DELETE CASCADE
    , FOREIGN KEY (ID_VALORACION) REFERENCES VALORACION(ID_VALORACION) ON DELETE CASCADE
    , FOREIGN KEY (ID_TAPA) REFERENCES TAPA(ID_TAPA) ON DELETE CASCADE
);

CREATE TABLE LIBRERIA.ITEMS_PEDIDO (
	  ID_ITEM_PED			INT NOT NULL AUTO_INCREMENT UNIQUE
    , CANTIDAD 	            INT NOT NULL
    , ID_PEDIDO 	        INT NOT NULL 
    , ID_LIBRO 	            INT NOT NULL
	, PRIMARY KEY (ID_ITEM_PED)
    , FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO) ON DELETE CASCADE
    , FOREIGN KEY (ID_LIBRO) REFERENCES LIBRO(ID_LIBRO) ON DELETE CASCADE
);

CREATE TABLE LIBRERIA.STOCK (
	  ID_LIBRO			    INT NOT NULL UNIQUE
	, FECHA_MODIFICACION	DATE 	NOT NULL
    , CANTIDAD 	            INT NOT NULL
	, PRIMARY KEY (ID_LIBRO)
); 

-- Insercion de datos

insert into PROVINCIA(nombre) values
('Buenos Aires'),
('Cordoba'),
('Jujuy'),
('Salta'),
('Tucuman'),
('Santa Cruz'),
('Entre Rios'),
('Corrientes'),
('Mendoza'),
('Catamarca');

insert into CIUDAD(nombre,ID_PROVINCIA) values
('La Plata',1), ('Villa Carlos Paz',2),
('San Salvador de Jujuy',3),
('Oran',4),
('Aguilares',5),
('Olivia',6),
('Parana',7),
('Paso de los Libres',8),
('Guaymallen',9),
('Aconquija',10);

insert into CLIENTE(DNI,TELEFONO,ID_CIUDAD,NOMBRE,APELLIDO,DOMICILIO) values
(40694632,157846945,1,'Roberto','Perez','Cordoba 8979'),
(40364632,157765445,2,'Jose','Gonzalez','27 de Febrero 8762'), 
(40605632,159075945,3,'Felipe','Rodriguez','Acacias 2999'),
(40694642,155809965,4,'Belen','Gomez','Acassuso 2995'),
(89494632,1509299645,5,'Maria','Fernandez','Acevedo 28979'),
 (34584632,158765645,6,'Juan','Lopez','Achala 8799'),
 (46786632,156709645,7,'Ignacio','Martinez','Daract 6799'),
 (49694632,157878954,8,'Lucas','Diaz','Cachimayo 6784'), 
 (30694632,154359965,9,'Matias','Sanchez','Cervantes 9675'),
 (40694632,157846945,1,'Jose Luis','Perez','9 de Julio 8979'),
 (20694632,156789345,10,'Lucia','Romero','Vergara 2999');

insert into ESTADO_PEDIDO(DESCRIPCION) values ('Sin informacion'),('En deposito'),('Empaquetado'),('En camino');

insert into PEDIDO(FECHA,ID_ESTADO,ID_CLIENTE) values
(DATE '2022-10-21',4,10),
(DATE '2022-8-15',3,9),
(DATE '2022-6-17',2,8),
(DATE '2021-4-19',1,7),
(DATE '2021-2-2',4,6),
 (DATE '2021-1-30',3,5),
 (DATE '2021-11-09',2,4),
 (DATE '2020-9-11',1,3),
 (DATE '2020-3-25',4,2),
 (DATE '2020-7-18',3,1);

insert into PEDIDO(FECHA,ID_ESTADO,ID_CLIENTE)
values (DATE '2022-10-21',1,1),
(DATE '2022-8-15',2,2),
(DATE '2022-6-17',3,3),
(DATE '2021-4-19',4,4),
(DATE '2021-2-2',1,5),
 (DATE '2021-1-30',2,6),
 (DATE '2021-11-09',3,7),
 (DATE '2020-9-11',4,8),
 (DATE '2020-3-25',1,9),
 (DATE '2020-7-18',2,10);

insert into IDIOMA(nombre) values
('Español'),
('Ingles'),
('Portuges'),
('Frances'),
('Aleman'),
('Italiano'),
('Holandes'),
('Chino'),
('Japones'),
('Ruso');

insert into EDITORIAL(nombre) values
('Tirant Lo Blanch'),
('Alianza'),
('Aranzadi'),
('Catedra'),
('Ariel'),
('Tecnos'),
('Akal'),
('Comares'),
('Civitas'),
('Arco Libros');


insert into AUTOR(nombre,apellido) values
('Antonio ','Garcia'),
('Manuel','Gonzalez'),
('Francisco','Lopez'),
('Aitor','Sanchez'),
('María','Jimenez'),
('Pilar','Santos'),
('Martin','Castillo'),
('Carmen','Medina'),
('Ana','Nuñez'),
('Lucia','Marin');

insert into GENERO(nombre) values
('Terror'),
('Policial'),
('Romance'),
('Ciencia'),
('Horror'),
('Biografia'),
('Epico'),
('Fantasia'),
('Comedia'),
('Poesia');

insert into DESCUENTO(porcentaje) values
('Sin descuento'),
('10%'),
('30%'),
('50%');

insert into VALORACION(descripcion) values
('Pesimo'),
('Malo'),
('Regular'),
('Bueno'),
('Excelente');

insert into TAPA(descripcion) values
('Dura'),
('Blanda');

insert into LIBRO(TITULO,PRECIO,ISBN,ID_EDITORIAL,ID_IDIOMA,ID_AUTOR,ID_GENERO,ID_DESCUENTO,ID_VALORACION,ID_TAPA) values
('LA BRUJA BLANCA - ASESINO DE BRUJAS','5990.80',42837,10,10,10,10,4,5,2),
('LA TÍA COSIMA','9990.60',42347,9,9,9,9,3,4,1),
('LOS SIETE MARIDOS DE EVELYN','3499.50',42837,8,8,8,8,3,3,2),
('AL FINAL MUEREN LOS DOS','3199.70',62837,7,7,7,7,2,5,1),
('HARRY POTTER Y LA PIEDRA FILOSOFAL','7990.10',72837,6,6,6,6,1,2,2),
('UNA FAMILIA ANORMAL. Y EL CRUCE DE LOS UNIVERSOS','999.99',42837,5,5,5,5,4,1,1),
('LA VIDA INVISIBLE DE ADDIE LARUE','1990.90',54837,4,4,4,4,3,5,2),
('LA SALUD DE LOS PAPAS','7499.80',35837,3,3,3,3,2,4,1),
('EL DUELO','4999.80',34837,2,2,2,2,1,3,2),
('EN EL LIMBO','6570.50',93937,1,1,1,1,4,2,1);

insert into ITEMS_PEDIDO(CANTIDAD,ID_PEDIDO,ID_LIBRO) values
(1,10,10),
(2,9,9),
(3,8,8),
(4,7,7),
(3,6,6),
(2,5,5),
(1,4,4),
(2,3,3),
(3,2,2),
(4,1,1);

insert into STOCK(FECHA_MODIFICACION,CANTIDAD,ID_LIBRO) values
(DATE '2022-10-21',1,10),
(DATE '2022-10-21',2,9),
(DATE '2022-10-21',3,8),
(DATE '2022-10-21',4,7),
(DATE '2022-10-21',5,6),
(DATE '2022-10-21',0,5),
(DATE '2022-10-21',0,4),
(DATE '2022-10-21',1,3),
(DATE '2022-10-21',3,2),
(DATE '2022-10-21',5,1);



-- VISTAS
-- Provincias con mas clientes
create or replace view ProvinciasClientes as
select p.nombre PROVINCIA, count(*) CANTIDAD_CLIENTES from provincia p 
join ciudad c
on p.id_provincia = c.id_provincia
join cliente cli
on c.id_ciudad = cli.id_ciudad
group by p.ID_PROVINCIA
order by CANTIDAD_CLIENTES desc
;

-- Autores con mas libros
create or replace view AutoresCantidad as
select concat(nombre,' ',apellido) AUTOR, count(*) CantidadLibrosEscritos from autor a
join libro l
on a.id_autor = l.id_autor
group by autor
;

-- Libros cuyo stock debe ser reemplazado mas urgentemente
create or replace view UrgenciaStock as
select titulo LIBRO, cantidad Stock from libro l
join stock s
on l.id_libro = s.id_libro
order by Stock
;

-- Pedidos para preparar
create or replace view PrepararPedidos as
select p.id_pedido, id_cliente CLIENTE, cantidad CANTIDAD, titulo LIBRO, ep.descripcion ESTADO from pedido p
join items_pedido ip
on p.id_pedido = ip.id_pedido
join libro l
on ip.id_libro = l.id_libro
join estado_pedido ep
on p.id_estado = ep.id_estado
where p.id_estado = 2
;

-- ver la valoracion obtenida en cada libro por el critico
create or replace view ValoracionLibros as
select titulo LIBRO, descripcion VALORACION from libro l
join valoracion v
on l.id_valoracion = v.id_valoracion
order by titulo
;

-- FUNCIONES
-- 1) Funcion que devuelve la cantidad de libros en el deposito

DROP FUNCTION if exists StockTotal;
delimiter ##
create function StockTotal()
returns int
reads sql data
begin
    declare resultado int;
    
    select sum(cantidad) into resultado from libreria.stock;
    
    return resultado;
end##
delimiter ; 

-- Puesta a prueba
SELECT StockTotal();


-- 2) Funcion que devuelve el precio de un libro en particular

DROP FUNCTION if exists PrecioLibro;
delimiter ##
create function PrecioLibro(libroInteres varchar(200))
returns float
reads sql data
begin
    declare resultado float;
    
    select PRECIO into resultado from libreria.libro where titulo = libroInteres;
    
    return resultado;
end##
delimiter ; 

-- Puesta a prueba
SELECT PrecioLibro('EL DUELO');

-- 3) Funcion que devuelve el estado de un pedido a partir del id del pedido

DROP FUNCTION if exists InfoPedido;
delimiter ##
CREATE FUNCTION  InfoPedido (idPedido int)  
returns varchar(100)
reads sql data
BEGIN  
	  declare resultado varchar(100);
	  select ep.DESCRIPCION ESTADO_PEDIDO into resultado from pedido p
	  join estado_pedido ep
	  on p.ID_ESTADO = ep.ID_ESTADO
	  where p.ID_PEDIDO = idPedido;
	  RETURN resultado;
END##
delimiter ;

-- Puesta a prueba
SELECT InfoPedido(3);


-- STORED PROCEDURES

-- 1) Este SP ordena los libros en funcion de su precio.

DROP PROCEDURE IF EXISTS OrdenadorPrecioLibros;  
DELIMITER $$
CREATE PROCEDURE OrdenadorPrecioLibros(orden int)
BEGIN  
        declare query_base varchar(250);
        declare tipo_orden varchar(10);
        declare query_final varchar(250);
        
        set query_base = 'select titulo, precio from libreria.libro ';
        
        if orden = 1 then 
            set tipo_orden = ' asc;';
        else 
            set tipo_orden = ' desc;';
        end if;
		select concat(query_base, ' order by precio ', tipo_orden) into query_final;
		
		SET @smtmt = query_final;
		
		PREPARE EJECUTAR FROM @smtmt;
		EXECUTE EJECUTAR;
		deallocate prepare EJECUTAR;
    
END$$
DELIMITER ;

-- Puesta a prueba
call OrdenadorPrecioLibros(1);



-- 2) Este segundo SP inserta registros (libros y su cantidad) en la tabla ITEMS PEDIDO. NOTA: si es un nuevo pedido (otro cliente y/o otra fecha), debe 
-- primero generarse un nuevo registro en la tabla PEDIDO

DROP PROCEDURE IF EXISTS GeneraItemsPedido;  
DELIMITER $$
CREATE PROCEDURE GeneraItemsPedido(CANTIDAD int, ID_PEDIDO int, ID_LIBRO int)
BEGIN  
	declare ID int;
    declare ultimoID int;
    set ultimoID = (select max(ID_ITEM_PED) from libreria.items_pedido);
    set ID = ultimoID + 1;
    
    insert into libreria.ITEMS_PEDIDO values (ID, CANTIDAD,ID_PEDIDO,ID_LIBRO);
    
END$$
DELIMITER ;


-- PUESTA A PRUEBA
call GeneraItemsPedido(99,1,3);
select * from items_pedido;

 
-- TRIGGERS
-- 1) Registra quien y cuando realizo un delete de la tabla Libro o un update del mismo (guardando el nuevo y viejo nombre y precio, siendo estas las
-- variables mas importantes).

-- Tabla que guarda este tipo de informacion
DROP TABLE if exists log_libro;
create table log_libro (
    id_log_libro int auto_increment primary key,
    action varchar(30),
    OLD_ID_LIBRO int,
    NEW_TITULO varchar(100),
    OLD_TITULO varchar(100),
    NEW_PRECIO DECIMAL(15,2),
    OLD_PRECIO DECIMAL(15,2),
    usuario varchar(100),
    log_fecha timestamp, 
    log_hora timestamp
); 
 -- 1.A) LOG AFTER DELETE
 DROP TRIGGER if exists AD_LIBRO;
 delimiter $$
CREATE TRIGGER AD_LIBRO
AFTER DELETE
ON LIBRO FOR EACH ROW
BEGIN
    INSERT INTO log_libro VALUES(NULL, 'AFTER DELETE', OLD.ID_LIBRO, NULL, OLD.TITULO, NULL, OLD.PRECIO, user(), current_date(), curtime());
END$$
delimiter ;

-- Puesta a prueba del AFTER DELETE
DELETE FROM LIBRO WHERE ID_LIBRO = 1;
select * from log_libro;

-- 1.B) LOG BEFORE UPDATE
 DROP TRIGGER if exists BU_LIBRO;
delimiter $$
CREATE TRIGGER BU_LIBRO 
BEFORE UPDATE
ON LIBRO FOR EACH ROW
BEGIN
    INSERT INTO log_libro VALUES(NULL, 'BEFORE UPDATE', OLD.ID_LIBRO, NEW.TITULO, OLD.TITULO, NEW.PRECIO, OLD.PRECIO, user(), current_date(), curtime());
END$$
delimiter ;

-- Puesta a prueba del BEFORE UPDATE
UPDATE libro
SET TITULO = 'EL ABUELO COSIMA', PRECIO = 10
WHERE ID_LIBRO = 2;

select * from log_libro;


-- 2) Registra quien y cuando realizo un delete de la tabla Cliente, asi como quien y cuando realiza un update (guardando
-- el nuevo ID y el nuevo nombre + apellido, dado que son los campos mas importantes)

-- Tabla que guarda este tipo de informacion
DROP TABLE if exists log_cliente;
create table log_cliente (
    id_log_cliente int auto_increment primary key,
    action varchar(30),
    OLD_ID_CLIENTE int,
    NEW_NOMBRE_COMPLETO varchar(200),
    OLD_NOMBRE_COMPLETO varchar(200),
    usuario varchar(100),
    log_fecha timestamp, 
    log_hora timestamp
); 

 -- 2.A) LOG AFTER DELETE
DROP TRIGGER if exists AD_CLIENTE;
delimiter $$
CREATE TRIGGER AD_CLIENTE
AFTER DELETE
ON CLIENTE FOR EACH ROW
BEGIN
    INSERT INTO log_cliente VALUES(NULL, 'AFTER DELETE', OLD.ID_CLIENTE, NULL,CONCAT(old.NOMBRE,' ',old.APELLIDO), user(), current_date(), curtime());
END$$
delimiter ;

-- Puesta a prueba del AFTER DELETE
DELETE FROM CLIENTE WHERE ID_CLIENTE = 1;
select * from log_cliente;


-- 2.B) LOG BEFORE UPDATE
 DROP TRIGGER if exists BU_CLIENTE;
delimiter $$
CREATE TRIGGER BU_CLIENTE 
BEFORE UPDATE
ON CLIENTE FOR EACH ROW
BEGIN
    INSERT INTO log_cliente VALUES(NULL, 'BEFORE UPDATE', OLD.ID_CLIENTE, CONCAT(new.NOMBRE,' ',new.APELLIDO), CONCAT(old.NOMBRE,' ',old.APELLIDO), user(), current_date(), curtime());
END$$
delimiter ;

-- Puesta a prueba del BEFORE UPDATE
UPDATE CLIENTE
SET nombre = 'JUAN CARLOS', apellido = 'RODRIGUEZ'
WHERE ID_CLIENTE = 2;
select * from log_cliente;


-- 3) TRIGGER que no permite guardar un dato incorrecto en la columna de numero de celular
select * from cliente;
delimiter $$
CREATE TRIGGER BI_VALIDA_CEL_cliente
BEFORE INSERT
ON cliente FOR EACH ROW
BEGIN
    DECLARE MSG_ERR VARCHAR(255);
    IF(NEW.TELEFONO NOT LIKE '15%') THEN 
        SET MSG_ERR = 'EL CELULAR DEBE CONTENER EL PREFIJO 15';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = MSG_ERR;
    END IF;
END$$
delimiter ;

-- Puesta a prueba
-- insert into CLIENTE(DNI,TELEFONO,ID_CIUDAD,NOMBRE,APELLIDO,DOMICILIO) values
-- (40694632,141546945,1,'Roberto','Perez','Cordoba 8979');


# 1. CREAR USUARIO
DROP USER if exists 'LECTURA'@'LOCALHOST';
CREATE USER 'LECTURA'@'LOCALHOST' IDENTIFIED BY 'lectura123'; -- creamos un usuario con su respectiva contraseña

# OTORGAR PERMISOS
GRANT SELECT ON *.* TO'LECTURA'@'LOCALHOST'; -- otorgamos permisos solo de lectura de datos (de todas las tablas)

# MOSTRAMOS LOS PERMISDOS DEL USUARIO
SHOW GRANTS FOR 'LECTURA'@'localhost';

# 2. CREAR USUARIO
DROP USER if exists 'ISUC'@'LOCALHOST';
CREATE USER 'ISUC'@'LOCALHOST' IDENTIFIED BY 'isuc123'; -- creamos un usuario ISUC (Insert, Select, Update, Create) con su respectiva contraseña

# OTORGAR PERMISOS
GRANT INSERT,SELECT,UPDATE,CREATE ON *.* TO'ISUC'@'LOCALHOST'; -- otorgamos permisos para leer, insertar, actualizar y crear elementos en la base de datos

# MOSTRAMOS LOS PERMISDOS DEL USUARIO
SHOW GRANTS FOR 'ISUC'@'localhost';

 
 -- TCL
 
-- 1) Rollback y Comitt ante Delete en tabla Pedido
--    al ser registros importantes, prefiero descomentar la sentencia ROLLBACK de modo que se reinserten previo al COMMIT.
START TRANSACTION;
	DELETE FROM pedido WHERE ID_PEDIDO = 1;
    DELETE FROM pedido WHERE ID_PEDIDO = 2;
	ROLLBACK;
    COMMIT;
	select * from pedido;


-- 2) Savepoints y Comitt ante multiples Inserts en tabla AUTOR
START TRANSACTION;

    # Primeros 4
	insert into AUTOR(nombre,apellido) values
	('Francisco','Sanchez'),
	('Aitor','Lopez'),
	('Antonio','Gonzalez'),
	('Manuel','Garcia');
    SAVEPOINT LOTE1; 
    
    # Ultimos 4
    insert into AUTOR(nombre,apellido) values
	('Martin','Medina'),
	('Carmen','Castillo'),
	('María','Santos'),
	('Pilar','Jimenez');
    SAVEPOINT LOTE2; 

-- RELEASE SAVEPOINT LOTE1;    
COMMIT;
# Puesta a prueba
select * from AUTOR;
