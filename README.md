# **Garden Database**

## DDL

```sql
-- Tabla para clasificación de productos
create table gama_producto(
  id_gama varchar(50) primary key,
  descripcion text,
  descripcion_html text,
  imagen varchar(256)
);

-- Tabla para dimensiones de productos
create table dimensiones(
  id_dimensiones int(10) primary key,
  ancho float(10) not null,
  largo float(10) not null,
  alto float(10) not null
);

-- Tabla para información de proveedores
create table proveedor(
  id_proveedor int(10) primary key,
  nombre_proveedor varchar(50) not null
);

-- Tabla para control de inventario de productos
create table stock(
  id_stock int(10) primary key,
  stock int(10) not null
);

-- Tabla principal de productos
create table producto(
  id_producto varchar(50) primary key,
  nombre_producto text not null,
  precio_proveedor float(5,2) not null,
  precio_ventas float(5,2) not null,
  gama_producto varchar(50) not null,
  dimensiones_producto int(10) not null,
  proveedor_producto int(10) not null,
  stock_producto int(10) not null,
    constraint FK_gama foreign key (gama_producto) references gama_producto(id_gama),
    constraint FK_dimensiones foreign key (dimensiones_producto) references dimensiones(id_dimensiones),
    constraint FK_proveedor foreign key (proveedor_producto) references proveedor(id_proveedor),
    constraint FK_stock foreign key (stock_producto) references stock(id_stock)
);

-- Tabla para información de barrios
create table barrio(
  id_barrio int(11) primary key,
  nombre_barrio varchar(50)
);

-- Tabla para direcciones
create table direccion(
  id_direccion int(11) primary key,
  calle varchar(50) not null,
  numero varchar(50) not null,
  barrio int(11) not null,
    constraint FK_barrio foreign key (barrio) references barrio(id_barrio)
);

-- Tabla para tipos de teléfono
create table tipo_telefono(
  id_tipo_tel int(11) primary key,
  nombre_tipo_tel varchar(50) not null,
  descripcion_tel text not null
);

-- Tabla para números de teléfono
create table telefono(
  id_telefono int(11) primary key,
  tipo_tel int(11) not null,
  numero int(10),
    constraint FK_tipo_tel foreign key (tipo_tel) references tipo_telefono(id_tipo_tel)
);

-- Tabla para información de ciudades
create table ciudad(
  id_ciudad int(11) primary key,
  nombre_ciudad varchar(50) not null
);

-- Tabla para información de regiones
create table region(
  id_region int(11) primary key,
  nombre_region varchar(50) not null
);

-- Tabla para códigos postales
create table codigo_postal(
  id_codigo_postal int(11) primary key,
  codigo varchar(30) not null,
  region_global int(11) not null,
    constraint FK_region foreign key (region_global) references region(id_region)
);

-- Tabla para información de contactos
create table contacto(
  id_contacto int(11) primary key,
  nombre_contacto varchar(50) not null,
  apellido_contacto varchar(50) not null
);

-- Tabla para información de países
create table pais(
  id_pais int(11) primary key,
  nombre_pais varchar(50) not null
);

-- Tabla para números de fax
create table fax(
  id_fax int(11) primary key,
  fax varchar(50) not null
);

-- Tabla para oficinas
create table oficina(
  id_oficina int(11) primary key,
  telefono_oficina varchar(10) not null,
  ciudad_oficina int(11) not null,
  pais_oficina int(11) not null,
  codigo_postal_oficina int(11) not null,
    constraint FK_ciudad_oficina foreign key (ciudad_oficina) references ciudad(id_ciudad),
    constraint FK_pais_oficina foreign key (pais_oficina) references pais(id_pais),
    constraint FK_codpostal_oficina foreign key (codigo_postal_oficina) references codigo_postal(id_codigo_postal)
);

-- Tabla para tipos de puestos
create table puesto(
  id_puesto int(11) primary key,
  puesto varchar(50) not null
);

-- Tabla para información de empleados
create table empleado(
  id_empleado int(11) primary key,
  nombre_empleado varchar(50) not null,
  apellido1_empleado varchar(50) not null,
  apellido2_empleado varchar(50) not null,
  extension_empleado varchar(50) not null,
  email_empleado varchar(50) not null,
  oficina_empleado int(11) not null,
  puesto_empleado int(11) not null,
  jefe_empleado int(11) not null,
    constraint FK_oficina_empleado foreign key (oficina_empleado) references oficina(id_oficina),
    constraint FK_puesto_empleado foreign key (puesto_empleado) references puesto(id_puesto)
);

-- Tabla para información de clientes
create table cliente(
  id_cliente int(11) primary key,
  nombre_cliente varchar(50) not null,
  apellido1_cliente varchar(50) not null,
  apellido2_cliente varchar(50) not null,
  contacto_cliente int(11) not null,
  telefono_cliente int(11) not null,
  fax_cliente int(11) not null,
  direccion_cliente int(11) not null,
  ciudad_cliente int(11) not null,
  codigo_postal_cliente int(11) not null,
  empleado_cliente int(11) not null,
    constraint FK_contacto_cliente foreign key (contacto_cliente) references contacto(id_contacto),
    constraint FK_telefono_cliente foreign key (telefono_cliente) references telefono(id_telefono),
    constraint FK_fax foreign key (fax_cliente) references fax(id_fax),
    constraint FK_direccion_cliente foreign key (direccion_cliente) references direccion(id_direccion),
    constraint FK_ciudad_cliente foreign key (ciudad_cliente) references ciudad(id_ciudad),
    constraint FK_codpostal_cliente foreign key (codigo_postal_cliente) references codigo_postal(id_codigo_postal),
    constraint FK_empleado_cliente foreign key (empleado_cliente) references empleado(id_empleado)
);

-- Tabla para formas de pago
create table forma_pago(
  id_forma_pago int(11) primary key,
  nombre_forma_pago varchar(50) not null
);

-- Tabla para información de pagos
create table pago(
  id_pago int(11) primary key,
  transaccion int(11) not null,
  forma_pago_pago int(11) not null,
  fecha_pago DATE not null,
    constraint FK_forma_pago foreign key (forma_pago_pago) references forma_pago(id_forma_pago)
);

```

---

## DML

```sql
-- Insertar datos en la tabla gama_producto
INSERT INTO gama_producto (id_gama, descripcion, descripcion_html, imagen)
VALUES ('G001', 'Gama 1', '<b>Gama 1</b>', 'imagen1.jpg'),
       ('G002', 'Gama 2', '<b>Gama 2</b>', 'imagen2.jpg');

-- Insertar datos en la tabla dimensiones
INSERT INTO dimensiones (id_dimensiones, ancho, largo, alto)
VALUES (1, 10.5, 20.3, 15),
       (2, 8.2, 18.7, 12);

-- Insertar datos en la tabla proveedor
INSERT INTO proveedor (id_proveedor, nombre_proveedor)
VALUES (1, 'Proveedor A'),
       (2, 'Proveedor B');

-- Insertar datos en la tabla stock
INSERT INTO stock (id_stock, stock)
VALUES (1, 100),
       (2, 150);

-- Insertar datos en la tabla producto
INSERT INTO producto (id_producto, nombre_producto, precio_proveedor, precio_ventas, gama_producto, dimensiones_producto, proveedor_producto, stock_producto)
VALUES ('P001', 'Producto 1', 50.99, 89.99, 'G001', 1, 1, 1),
       ('P002', 'Producto 2', 35.75, 69.99, 'G002', 2, 2, 2);

-- Insertar datos en la tabla barrio
INSERT INTO barrio (id_barrio, nombre_barrio)
VALUES (1, 'Barrio A'),
       (2, 'Barrio B');

-- Insertar datos en la tabla direccion
INSERT INTO direccion (id_direccion, calle, numero, barrio)
VALUES (1, 'Calle A', '123', 1),
       (2, 'Calle B', '456', 2);

-- Insertar datos en la tabla tipo_telefono
INSERT INTO tipo_telefono (id_tipo_tel, nombre_tipo_tel, descripcion_tel)
VALUES (1, 'Tipo 1', 'Descripción 1'),
       (2, 'Tipo 2', 'Descripción 2');

-- Insertar datos en la tabla telefono
INSERT INTO telefono (id_telefono, tipo_tel, numero)
VALUES (1, 1, 123456789),
       (2, 2, 987654321);

-- Insertar datos en la tabla ciudad
INSERT INTO ciudad (id_ciudad, nombre_ciudad)
VALUES (1, 'Ciudad A'),
       (2, 'Ciudad B');

-- Insertar datos en la tabla region
INSERT INTO region (id_region, nombre_region)
VALUES (1, 'Región 1'),
       (2, 'Región 2');

-- Insertar datos en la tabla codigo_postal
INSERT INTO codigo_postal (id_codigo_postal, codigo, region_global)
VALUES (1, 'CP001', 1),
       (2, 'CP002', 2);

-- Insertar datos en la tabla contacto
INSERT INTO contacto (id_contacto, nombre_contacto, apellido_contacto)
VALUES (1, 'Contacto 1', 'Apellido 1'),
       (2, 'Contacto 2', 'Apellido 2');

-- Insertar datos en la tabla pais
INSERT INTO pais (id_pais, nombre_pais)
VALUES (1, 'España'),
       (2, 'Francia');

-- Insertar datos en la tabla fax
INSERT INTO fax (id_fax, fax)
VALUES (1, '123456'),
       (2, '987654');

-- Insertar datos en la tabla oficina
INSERT INTO oficina (id_oficina, telefono_oficina, ciudad_oficina, pais_oficina, codigo_postal_oficina)
VALUES (1, '123456789', 1, 1, 1),
       (2, '987654321', 2, 2, 2);

-- Insertar datos en la tabla puesto
INSERT INTO puesto (id_puesto, puesto)
VALUES (1, 'Puesto 1'),
       (2, 'Puesto 2');

-- Insertar datos en la tabla empleado
INSERT INTO empleado (id_empleado, nombre_empleado, apellido1_empleado, apellido2_empleado, extension_empleado, email_empleado, oficina_empleado, puesto_empleado, jefe_empleado)
VALUES (1, 'Empleado 1', 'Apellido 1', 'Apellido 2', 'Extensión 1', 'empleado1@example.com', 1, 1, 7),
       (2, 'Empleado 2', 'Apellido 3', 'Apellido 4', 'Extensión 2', 'empleado2@example.com', 2, 2, 8);

-- Insertar datos en la tabla cliente
INSERT INTO cliente (id_cliente, nombre_cliente, apellido1_cliente, apellido2_cliente, contacto_cliente, telefono_cliente, fax_cliente, direccion_cliente, ciudad_cliente, codigo_postal_cliente, empleado_cliente)
VALUES (1, 'Cliente 1', 'Apellido 5', 'Apellido 6', 1, 1, 1, 1, 1, 1, 1),
       (2, 'Cliente 2', 'Apellido 7', 'Apellido 8', 2, 2, 2, 2, 2, 2, 2);

-- Insertar datos en la tabla forma_pago
INSERT INTO forma_pago (id_forma_pago, nombre_forma_pago)
VALUES (1, 'Pago 1'),
       (2, 'Pago 2');

-- Insertar datos en la tabla pago
INSERT INTO pago (id_pago, transaccion, forma_pago_pago, fecha_pago)
VALUES (1, 123456, 1, '2024-05-07'),
       (2, 789012, 2, '2024-05-06');
```

---

## Consultas Sobre Una Tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

```sql
SELECT o.id_oficina, c.nombre_ciudad
FROM oficina as o, ciudad as c
WHERE o.id_oficina = c.id_ciudad;

+------------+---------------+
| id_oficina | nombre_ciudad |
+------------+---------------+
|          1 | Ciudad A      |
|          2 | Ciudad B      |
+------------+---------------+
```

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

```sql
SELECT nombre_ciudad, oficina.telefono_oficina
FROM ciudad
JOIN oficina ON ciudad.id_ciudad = oficina.ciudad_oficina
JOIN pais ON ciudad.id_ciudad = pais.id_pais;

+---------------+------------------+
| nombre_ciudad | telefono_oficina |
+---------------+------------------+
| Ciudad A      | 123456789        |
+---------------+------------------+
```

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

```sql
SELECT nombre_empleado, apellido1_empleado, apellido2_empleado, email_empleado
FROM empleado
WHERE jefe_empleado = 7;
```

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

```sql
SELECT 
```

