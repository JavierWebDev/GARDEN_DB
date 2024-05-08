-- Insertar datos en la tabla gama_producto
INSERT INTO gama_producto (id_gama, descripcion, descripcion_html, imagen)
VALUES ('G001', 'Gama 1', '<b>Gama 1</b>', 'imagen1.jpg'),
       ('G002', 'Ornamentales', '<b>Gama 2</b>', 'imagen2.jpg');

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
       (2, 'Ciudad B'),
       (3, 'Madrid');

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
       (2, 'Rep Ventas'),
       (3, 'Jefe');

-- Insertar datos en la tabla empleado
INSERT INTO empleado (id_empleado, nombre_empleado, apellido1_empleado, apellido2_empleado, extension_empleado, email_empleado, oficina_empleado, puesto_empleado, jefe_empleado)
VALUES (1, 'Empleado 1', 'Apellido 1', 'Apellido 2', 'Extensión 1', 'empleado1@example.com', 1, 1, 7),
       (2, 'Empleado 2', 'Apellido 3', 'Apellido 4', 'Extensión 2', 'empleado2@example.com', 2, 2, 8),
       (3, 'JEFEEEEE', 'Apellido 1', 'Apellido 2', 'Extensión 3', 'jefe@example.com', 2, 3, null);

-- Insertar datos en la tabla cliente
INSERT INTO cliente (id_cliente, nombre_cliente, apellido1_cliente, apellido2_cliente, contacto_cliente, telefono_cliente, fax_cliente, direccion_cliente, ciudad_cliente, codigo_postal_cliente, pais_cliente, empleado_cliente)
VALUES (1, 'Cliente 1', 'Apellido 5', 'Apellido 6', 1, 1, 1, 1, 1, 1, 2, 1),
       (2, 'Cliente 2', 'Apellido 7', 'Apellido 8', 2, 2, 2, 2, 2, 2, 1, 2);

-- Insertar datos en la tabla forma_pago
INSERT INTO forma_pago (id_forma_pago, nombre_forma_pago)
VALUES (1, 'Pago 1'),
       (2, 'PayPal');

-- Insertar datos en la tabla pago
INSERT INTO pago (id_pago, transaccion, forma_pago_pago, fecha_pago, pago_cliente)
VALUES (1, 123456, 1, '2024-05-07', 1),
       (2, 789012, 2, '2024-05-06', 2),
       (3, 789012, 2, '2008-05-06', 1);

-- Insertar datos en la tabla estado
INSERT INTO estado (id_estado, estado)
VALUES (1, 'En proceso'),
       (2, 'En camino'),
       (3, 'Entregado'),
       (4, 'Rechazado');

-- Insertar datos en la tabla detallePedido
INSERT INTO detallePedido (id_detallePedido, producto_pedido, cantidad, precio_unidad, numeroLinea)
VALUES (1, 'P001', 2, 50.99, 'NL001'),
       (2, 'P002', 1, 35.75, 'NL002');

-- Insertar datos en la tabla pedido
INSERT INTO pedido (id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, detalle_pedido, cliente_pedido, estado_pedido)
VALUES (1, '2024-01-07', '2024-05-10', NULL, 'Comentario 1', 1, 2, 1),
       (2, '2024-01-06', '2024-05-09', NULL, 'Comentario 2', 2, 1, 2),
       (3, '2024-05-06', '2024-05-09', '2024-05-10', 'Comentario 3', 2, 2, 2),
       (4, '2024-08-06', '2024-05-09', '2024-05-8', 'Comentario 4', 2, 2, 2),
       (5, '2009-05-06', '2024-05-09', NULL, 'Comentario 5', 2, 1, 4);

