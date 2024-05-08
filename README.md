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

