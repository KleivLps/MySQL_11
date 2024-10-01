use tienda;

/*Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/

select * from producto p 
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre ='Lenovo';

select * from producto
where codigo_fabricante =(
select codigo
from fabricante
where nombre ='Lenovo'
);

/*Devuelve todos los datos de los productos que tienen el mismo precio que el producto más
 caro del fabricante Lenovo (Sin utilizar INNER JOIN):*/
 
 SELECT * 
FROM producto 
WHERE precio = (
    SELECT MAX(precio) 
    FROM producto 
    WHERE codigo_fabricante = (
        SELECT codigo 
        FROM fabricante 
        WHERE nombre = 'Lenovo'
    )
);

/*Lista el nombre del producto más caro del fabricante Lenovo:*/

select nombre from producto
where precio = (
select max(precio) from producto
where codigo_fabricante =(
select codigo
from fabricante
where nombre = 'Lenovo'
)
);

/*Lista todos los productos del fabricante Asus
 que tienen un precio superior al precio medio de todos sus productos:*/
 
 select * from producto
 where codigo_fabricante =(
 select codigo from fabricante
 where nombre ='Asus'
 )
 and precio > (
 select avg(precio)
 from producto
where codigo_fabricante =(
select codigo
from fabricante
where nombre ='Asus'
)
);

/*Devuelve los nombres de los fabricantes que tienen productos asociados (Utilizando IN):*/

select nombre from fabricante 
where codigo in (
select codigo_fabricante from producto
);

/*Devuelve los nombres de los fabricantes que no tienen productos asociados 
(Utilizando NOT IN):*/

select nombre from fabricante
where codigo not in(
select codigo_fabricante
from producto
);

/*Devuelve un listado con todos los nombres de los fabricantes que tienen
 el mismo número de productos que el fabricante Lenovo:*/
 
 select f.nombre from fabricante f
 join producto p on f.codigo = p.codigo_fabricante
 group by f.nombre
 having count(*) = (
 select count(*) from producto
 where codigo_fabricante =(
 select codigo from fabricante
 where nombre ='Lenovo'
 )
 );