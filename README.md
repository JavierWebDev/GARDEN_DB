# **Garden Database**

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
SELECT nombre_empleado, concat(apellido1_empleado, ' ',apellido2_empleado) as apellidos, puesto.puesto, email_empleado
FROM empleado
JOIN puesto ON empleado.puesto_empleado = puesto.id_puesto
WHERE puesto.puesto = 'Jefe';
+-----------------+-----------------------+--------+------------------+
| nombre_empleado | apellidos             | puesto | email_empleado   |
+-----------------+-----------------------+--------+------------------+
| JEFEEEEE        | Apellido 1 Apellido 2 | Jefe   | jefe@example.com |
+-----------------+-----------------------+--------+------------------+
```

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

```sql
SELECT nombre_empleado, concat(apellido1_empleado, ' ',apellido2_empleado) as apellidos, puesto.puesto
FROM empleado
JOIN puesto ON empleado.puesto_empleado = puesto.id_puesto
WHERE puesto.puesto NOT IN ('Rep Ventas');
+-----------------+-----------------------+----------+
| nombre_empleado | apellidos             | puesto   |
+-----------------+-----------------------+----------+
| Empleado 1      | Apellido 1 Apellido 2 | Puesto 1 |
| JEFEEEEE        | Apellido 1 Apellido 2 | Jefe     |
+-----------------+-----------------------+----------+
```

6. Devuelve un listado con el nombre de los todos los clientes españoles.

```sql
SELECT CONCAT(nombre_cliente, ' ', apellido1_cliente, ' ', apellido2_cliente) as nombreCompleto, pais.nombre_pais
FROM cliente
JOIN pais ON cliente.pais_cliente = pais.id_pais
WHERE pais.id_pais = 1;
+---------------------------------+-------------+
| nombreCompleto                  | nombre_pais |
+---------------------------------+-------------+
| Cliente 2 Apellido 7 Apellido 8 | España      |
+---------------------------------+-------------+
```

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

```sql
SELECT id_estado, estado
FROM estado;
+-----------+------------+
| id_estado | estado     |
+-----------+------------+
|         1 | En proceso |
|         2 | En camino  |
|         3 | Entregado  |
+-----------+------------+
```

8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
   • Utilizando la función YEAR de MySQL.

```sql
SELECT id_cliente
FROM cliente
JOIN pago ON id_cliente = pago.pago_cliente
WHERE YEAR(pago.fecha_pago) = 2008;
+------------+
| id_cliente |
+------------+
|          1 |
+------------+
```

​	• Utilizando la función DATE_FORMAT de MySQL.

```sql
SELECT id_cliente
FROM cliente
JOIN pago ON id_cliente = pago.pago_cliente
WHERE DATE_FORMAT(pago.fecha_pago,'%Y') = 2008;
+------------+
| id_cliente |
+------------+
|          1 |
+------------+
```

​	• Sin utilizar ninguna de las funciones anteriores.

```sql
SELECT id_cliente
FROM cliente
JOIN pago ON id_cliente = pago.pago_cliente
WHERE pago.fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';
+------------+
| id_cliente |
+------------+
|          1 |
+------------+
```

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

```sql
select id_pedido, cliente_pedido, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;
+-----------+----------------+----------------+---------------+
| id_pedido | cliente_pedido | fecha_esperada | fecha_entrega |
+-----------+----------------+----------------+---------------+
|         3 |              2 | 2024-05-09     | 2024-05-10    |
+-----------+----------------+----------------+---------------+
```

10. Devuelve un listado con el código de pedido, código de cliente, fecha  esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
    - Utilizando la función ADDDATE de MySQL.

```sql
SELECT id_pedido, cliente_pedido, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega < ADDDATE(fecha_esperada, -2);
```

- Utilizando la función DATEDIFF de MySQL.

```sql
SELECT id_pedido, cliente_pedido, fecha_esperada, fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
```

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    SELECT id_pedido
    FROM pedido
    WHERE estado_pedido = 4 AND DATE_FORMAT(fecha_pedido, '%Y') = 2009;
    +-----------+
    | id_pedido |
    +-----------+
    |         5 |
    +-----------+
    ```

12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

```sql
SELECT id_pedido
FROM pedido
WHERE DATE_FORMAT(fecha_pedido, '%M') = 'January';
+-----------+
| id_pedido |
+-----------+
|         1 |
|         2 |
+-----------+
```

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

```sql
SELECT p.id_pago AS ID, fecha_pago, forma_pago.nombre_forma_pago 
FROM pago as p
JOIN forma_pago ON forma_pago_pago = forma_pago.id_forma_pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = 2008 AND forma_pago.id_forma_pago = 2
ORDER BY fecha_pago DESC;
+----+------------+-------------------+
| ID | fecha_pago | nombre_forma_pago |
+----+------------+-------------------+
|  3 | 2008-05-06 | PayPal            |
+----+------------+-------------------+
```

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

```sql
SELECT DISTINCT(id_forma_pago), nombre_forma_pago
FROM forma_pago;
+---------------+-------------------+
| id_forma_pago | nombre_forma_pago |
+---------------+-------------------+
|             1 | Pago 1            |
|             2 | PayPal            |
+---------------+-------------------+
```

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

```sql
SELECT id_producto, nombre_producto, precio_ventas
FROM producto
JOIN stock ON stock_producto = id_stock
WHERE gama_producto = 'G002' AND stock.stock > 100 
ORDER BY precio_ventas DESC;
+-------------+-----------------+---------------+
| id_producto | nombre_producto | precio_ventas |
+-------------+-----------------+---------------+
| P002        | Producto 2      |         69.99 |
+-------------+-----------------+---------------+
```

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

```sql
SELECT id_cliente, ciudad_cliente 
FROM cliente
WHERE ciudad_cliente = 'Madrid' AND empleado_cliente IN (11,30);
```

---

## Consultas Multitabla (Composicion Interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

```sql
SELECT c.id_cliente, CONCAT(c.nombre_cliente, ' ', c.apellido1_cliente, ' ', c.apellido2_cliente) AS nombreCliente, empleado.id_empleado,CONCAT(empleado.nombre_empleado, ' ', empleado.apellido1_empleado, ' ', empleado.apellido2_empleado) AS nombreEmpleado
FROM cliente AS c
INNER JOIN empleado ON c.empleado_cliente = empleado.id_empleado;
+------------+---------------------------------+-------------+----------------------------------+
| id_cliente | nombreCliente                   | id_empleado | nombreEmpleado                   |
+------------+---------------------------------+-------------+----------------------------------+
|          1 | Cliente 1 Apellido 5 Apellido 6 |           1 | Empleado 1 Apellido 1 Apellido 2 |
|          2 | Cliente 2 Apellido 7 Apellido 8 |           2 | Empleado 2 Apellido 3 Apellido 4 |
+------------+---------------------------------+-------------+----------------------------------+
```

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

```sql
SELECT id_pago, CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente, empleado.id_empleado,CONCAT(empleado.nombre_empleado, ' ', empleado.apellido1_empleado, ' ', empleado.apellido2_empleado) AS nombreEmpleado
FROM pago
INNER JOIN cliente ON pago.pago_cliente = cliente.id_cliente
INNER JOIN empleado ON cliente.empleado_cliente = empleado.id_empleado;
+---------+---------------------------------+-------------+----------------------------------+
| id_pago | nombreCliente                   | id_empleado | nombreEmpleado                   |
+---------+---------------------------------+-------------+----------------------------------+
|       1 | Cliente 1 Apellido 5 Apellido 6 |           1 | Empleado 1 Apellido 1 Apellido 2 |
|       3 | Cliente 1 Apellido 5 Apellido 6 |           1 | Empleado 1 Apellido 1 Apellido 2 |
|       2 | Cliente 2 Apellido 7 Apellido 8 |           2 | Empleado 2 Apellido 3 Apellido 4 |
+---------+---------------------------------+-------------+----------------------------------+
```

3. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql
SELECT CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente, CONCAT(empleado.nombre_empleado, ' ', empleado.apellido1_empleado, ' ', empleado.apellido2_empleado) AS nombreEmpleado, ciudad.nombre_ciudad
FROM cliente
JOIN empleado ON cliente.empleado_cliente = empleado.id_empleado
JOIN oficina ON empleado.oficina_empleado = oficina.id_oficina
JOIN ciudad ON oficina.ciudad_oficina = ciudad.id_ciudad;
+---------------------------------+----------------------------------+---------------+
| nombreCliente                   | nombreEmpleado                   | nombre_ciudad |
+---------------------------------+----------------------------------+---------------+
| Cliente 1 Apellido 5 Apellido 6 | Empleado 1 Apellido 1 Apellido 2 | Ciudad A      |
| Cliente 2 Apellido 7 Apellido 8 | Empleado 2 Apellido 3 Apellido 4 | Ciudad B      |
+---------------------------------+----------------------------------+---------------+
```

4. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

```sql
SELECT CONCAT(direccion.calle, ' #', direccion.numero, ', ', barrio.nombre_barrio) AS direccionOficinaFuenlabrada
FROM oficina
JOIN direccion ON oficina.direccion_oficina = direccion.id_direccion
JOIN barrio ON direccion.barrio = barrio.id_barrio
JOIN ciudad ON oficina.ciudad_oficina = ciudad.id_ciudad
WHERE ciudad.nombre_ciudad = 'Fuenlabrada';
+-----------------------------+
| direccionOficinaFuenlabrada |
+-----------------------------+
| Calle B #456, Barrio B      |
+-----------------------------+
```

5. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

```sql
SELECT CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente, CONCAT(empleado.nombre_empleado, ' ', empleado.apellido1_empleado, ' ', empleado.apellido2_empleado) AS nombreEmpleado, ciudad.nombre_ciudad AS ciudadRepresentante 
FROM cliente
JOIN empleado ON cliente.empleado_cliente = empleado.id_empleado
JOIN oficina ON empleado.oficina_empleado = oficina.id_oficina
JOIN ciudad ON oficina.ciudad_oficina = ciudad.id_ciudad;
+---------------------------------+----------------------------------+---------------------+
| nombreCliente                   | nombreEmpleado                   | ciudadRepresentante |
+---------------------------------+----------------------------------+---------------------+
| Cliente 1 Apellido 5 Apellido 6 | Empleado 1 Apellido 1 Apellido 2 | Ciudad A            |
| Cliente 2 Apellido 7 Apellido 8 | Empleado 2 Apellido 3 Apellido 4 | Ciudad B            |
+---------------------------------+----------------------------------+---------------------+
```

6. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

```sql
SELECT CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente ,fecha_esperada, fecha_entrega
FROM pedido
JOIN cliente ON pedido.cliente_pedido = cliente.id_cliente
WHERE fecha_entrega > fecha_esperada;
+---------------------------------+----------------+---------------+
| nombreCliente                   | fecha_esperada | fecha_entrega |
+---------------------------------+----------------+---------------+
| Cliente 2 Apellido 7 Apellido 8 | 2024-05-09     | 2024-05-10    |
+---------------------------------+----------------+---------------+
```

7. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

```sql
SELECT gama_producto.descripcion
FROM pedido
JOIN detallePedido ON pedido.detalle_pedido = detallePedido.id_detallePedido
JOIN producto ON detallePedido.producto_pedido = producto.id_producto
JOIN gama_producto ON producto.gama_producto = id_gama;
+--------------+
| descripcion  |
+--------------+
| Gama 1       |
| Ornamentales |
| Ornamentales |
| Ornamentales |
| Ornamentales |
+--------------+
```

---

## Consultas multitabla (Composición Externa)

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL LEFT JOIN y NATURAL RIGHT JOIN.

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

```sql
SELECT pago.pago_cliente, cliente.id_cliente, CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente
FROM pago
LEFT JOIN cliente ON pago.pago_cliente = cliente.id_cliente
WHERE pago.pago_cliente IS NULL;
```

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

```sql
SELECT pedido.cliente_pedido, cliente.id_cliente, CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente
FROM pedido
LEFT JOIN cliente ON pedido.cliente_pedido = cliente.id_cliente
WHERE pedido.cliente_pedido IS NULL;
```

---

## Consultas Resumen

1. ¿Cuántos empleados hay en la compañía?

```sql
SELECT COUNT(id_empleado) AS numeroEmpleados
FROM empleado;
+-----------------+
| numeroEmpleados |
+-----------------+
|               4 |
+-----------------+
```

2. ¿Cuántos clientes tiene cada país?

```sql
SELECT pais.nombre_pais, COUNT(cliente.id_cliente) AS numClientes
FROM pais
LEFT JOIN cliente ON cliente.pais_cliente = pais.id_pais
GROUP BY pais.nombre_pais;
+-------------+-------------+
| nombre_pais | numClientes |
+-------------+-------------+
| España      |           1 |
| Francia     |           1 |
+-------------+-------------+
```

3. ¿Cuál fue el pago medio en 2009?

```sql
SELECT AVG(transaccion) AS media2009
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = 2009;
+-------------+
| media2009   |
+-------------+
| 789012.0000 |
+-------------+
```

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

```sql
SELECT estado.estado, COUNT(pedido.id_pedido) AS num_pedidos
FROM estado
LEFT JOIN pedido ON estado.id_estado = pedido.estado_pedido
GROUP BY estado.estado
ORDER BY num_pedidos DESC;
+------------+-------------+
| estado     | num_pedidos |
+------------+-------------+
| En camino  |           3 |
| Rechazado  |           2 |
| En proceso |           1 |
| Entregado  |           0 |
+------------+-------------+
```

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

```sql
SELECT MAX(precio_ventas) AS productoMasCaro, MIN(precio_ventas) AS productoMasBarato
FROM producto;
+-----------------+-------------------+
| productoMasCaro | productoMasBarato |
+-----------------+-------------------+
|           89.99 |             69.99 |
+-----------------+-------------------+
```

6. Calcula el número de clientes que tiene la empresa.

```sql
SELECT COUNT(id_cliente) AS numClientes 
FROM cliente;
+-------------+
| numClientes |
+-------------+
|           2 |
+-------------+
```

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

```sql
SELECT COUNT(cliente.id_cliente) AS numClientesMadrid
FROM cliente
LEFT JOIN ciudad ON cliente.ciudad_cliente = ciudad.id_ciudad
WHERE ciudad.nombre_ciudad = 'Madrid';
+-------------------+
| numClientesMadrid |
+-------------------+
|                 1 |
+-------------------+
```

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

```sql
SELECT COUNT(cliente.id_cliente) AS numClientesM
FROM cliente
LEFT JOIN ciudad ON cliente.ciudad_cliente = ciudad.id_ciudad
WHERE ciudad.nombre_ciudad LIKE 'M%';
+--------------+
| numClientesM |
+--------------+
|            1 |
+--------------+
```

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

```sql
SELECT CONCAT(empleado.nombre_empleado, ' ', empleado.apellido1_empleado, ' ', empleado.apellido2_empleado) AS nombreEmpleado, COUNT(cliente.id_cliente) AS numClientes
FROM cliente
LEFT JOIN empleado ON cliente.empleado_cliente = empleado.id_empleado
GROUP BY cliente.empleado_cliente;
+----------------------------------+-------------+
| nombreEmpleado                   | numClientes |
+----------------------------------+-------------+
| Empleado 1 Apellido 1 Apellido 2 |           1 |
| Empleado 2 Apellido 3 Apellido 4 |           1 |
| Juan Lopez Gomez                 |           1 |
+----------------------------------+-------------+
```

10. Calcula el número de clientes que no tiene asignado representante de ventas.

```sql
SELECT COUNT(id_cliente) AS NoRepVentas
FROM cliente
WHERE empleado_cliente IS null;
+-------------+
| NoRepVentas |
+-------------+
|           1 |
+-------------+
```

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

```sql
SELECT CONCAT(cliente.nombre_cliente, ' ', cliente.apellido1_cliente, ' ', cliente.apellido2_cliente) AS nombreCliente, MIN(fecha_pago) AS fechaPrimerPago, MAX(fecha_pago) AS fechaUltimoPago
FROM pago
LEFT JOIN cliente ON pago.pago_cliente = cliente.id_cliente 
GROUP BY cliente.id_cliente;
+---------------------------------+-----------------+-----------------+
| nombreCliente                   | fechaPrimerPago | fechaUltimoPago |
+---------------------------------+-----------------+-----------------+
| Cliente 1 Apellido 5 Apellido 6 | 2008-05-06      | 2024-05-07      |
| Cliente 2 Apellido 5 Apellido 6 | 2024-05-06      | 2024-05-06      |
| NULL                            | 2023-12-26      | 2023-12-26      |
+---------------------------------+-----------------+-----------------+
```

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

```sql
SELECT COUNT(DISTINCT(producto_pedido)) as productosDiferentes
FROM detallePedido;
+---------------------+
| productosDiferentes |
+---------------------+
|                   2 |
+---------------------+
```

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

```sql
SELECT pedido.id_pedido, SUM(detallePedido.cantidad) AS cantidadTotal
FROM pedido
JOIN detallePedido ON pedido.detalle_pedido = detallePedido.id_detallePedido
GROUP BY pedido.id_pedido;
+-----------+---------------+
| id_pedido | cantidadTotal |
+-----------+---------------+
|         1 |             2 |
|         2 |             1 |
|         3 |             1 |
|         4 |             1 |
|         5 |             2 |
|         6 |             1 |
+-----------+---------------+
```

14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

```sql
SELECT producto.nombre_producto, SUM(detallePedido.cantidad) AS total_unidades_vendidas
FROM detallePedido
JOIN producto ON detallePedido.producto_pedido = producto.id_producto
GROUP BY producto.nombre_producto
ORDER BY total_unidades_vendidas DESC
LIMIT 20;
+-----------------+-------------------------+
| nombre_producto | total_unidades_vendidas |
+-----------------+-------------------------+
| Producto 1      |                       2 |
| Producto 2      |                       1 |
+-----------------+-------------------------+
```

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

```sql

```

16. La misma información que en la pregunta anterior, pero agrupada por código de producto.

```sql

```

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

```sql

```

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

```sql

```

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

```sql
SELECT YEAR(fecha_pago) AS añoPago, SUM(transaccion) AS totalPagos
FROM pago
GROUP BY YEAR(fecha_pago);
+----------+------------+
| añoPago  | totalPagos |
+----------+------------+
|     2024 |    1789012 |
|     2008 |     789012 |
|     2009 |     789012 |
|     2023 |     789012 |
+----------+------------+
```



---

## Subconsultas

### Con operadores básicos de comparación

1. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
SELECT nombre_cliente
FROM cliente
WHERE id_cliente = (
    SELECT pago_cliente
    FROM pago
    WHERE transaccion = (
        SELECT MAX(transaccion)
        FROM pago
    )
);
+----------------+
| nombre_cliente |
+----------------+
| Cliente 1      |
+----------------+
```

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
SELECT nombre_producto
FROM producto
WHERE precio_ventas = (
  SELECT MAX(precio_ventas) AS PrecioMasCaro
  FROM producto
);
+-----------------+
| nombre_producto |
+-----------------+
| Producto 1      |
+-----------------+
```

3. Devuelve el producto que más unidades tiene en stock.

```sql
SELECT nombre_producto
FROM producto
WHERE stock_producto = (
    SELECT id_stock
    FROM stock
    WHERE stock = (
        SELECT MAX(stock)
        FROM stock
    )
);
+-----------------+
| nombre_producto |
+-----------------+
| Producto 2      |
+-----------------+
```

4. Devuelve el producto que menos unidades tiene en stock.

```sql
SELECT nombre_producto
FROM producto
WHERE stock_producto = (
    SELECT id_stock
    FROM stock
    WHERE stock = (
        SELECT MIN(stock)
        FROM stock
    )
);
+-----------------+
| nombre_producto |
+-----------------+
| Producto 1      |
+-----------------+
```

