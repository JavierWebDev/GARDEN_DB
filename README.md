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

7. 
