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
  direccion_oficina int(11) not null,
    constraint FK_ciudad_oficina foreign key (ciudad_oficina) references ciudad(id_ciudad),
    constraint FK_pais_oficina foreign key (pais_oficina) references pais(id_pais),
    constraint FK_codpostal_oficina foreign key (codigo_postal_oficina) references codigo_postal(id_codigo_postal),
    constraint FK_direccion_oficina foreign key (direccion_oficina) references direccion(id_direccion)
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
  jefe_empleado int(11),
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
  pais_cliente int(11) not null,
  empleado_cliente int(11),
    constraint FK_contacto_cliente foreign key (contacto_cliente) references contacto(id_contacto),
    constraint FK_telefono_cliente foreign key (telefono_cliente) references telefono(id_telefono),
    constraint FK_fax foreign key (fax_cliente) references fax(id_fax),
    constraint FK_direccion_cliente foreign key (direccion_cliente) references direccion(id_direccion),
    constraint FK_ciudad_cliente foreign key (ciudad_cliente) references ciudad(id_ciudad),
    constraint FK_codpostal_cliente foreign key (codigo_postal_cliente) references codigo_postal(id_codigo_postal),
    constraint FK_pais_cliente foreign key (pais_cliente) references pais(id_pais),
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
  pago_cliente int(11),
    constraint FK_forma_pago foreign key (forma_pago_pago) references forma_pago(id_forma_pago),
    constraint FK_cliente_pago foreign key (pago_cliente) references cliente(id_cliente)
);

-- Tabla para los pedidos

create table estado(
  id_estado int(11) primary key,
  estado varchar(50) not null
);

create table detallePedido(
  id_detallePedido int(11) primary key,
  producto_pedido varchar(50) not null,
  cantidad int(2) not null,
  precio_unidad float(5,2) not null,
  numeroLinea varchar(20),
  constraint FK_productoDetalle foreign key (producto_pedido) references producto(id_producto)
);

create table pedido(
 id_pedido int(11) primary key,
 fecha_pedido date,
 fecha_esperada date,
 fecha_entrega date,
 comentarios text,
 detalle_pedido int(11) not null,
 cliente_pedido int(11),
 estado_pedido int(11) not null,
  constraint FK_estado_pedido foreign key  (estado_pedido) references estado(id_estado),
  constraint FK_cliente_pedido foreign key  (cliente_pedido) references cliente(id_cliente)
);