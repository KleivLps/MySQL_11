/*Mostrar el nombre y peso de los diez jugadores que sean pivots
 (‘C’) y que pesen más de 200 libras, ordenados por peso.*/
use nba;

select nombre, peso
from jugadores
where posicion = 'C' and peso > 200
order by peso desc limit 10;

/*Mostrar el nombre de los equipos del este (East).*/

select nombre from equipos
where ciudad like 'C%'
order by nombre;

/*Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.*/

select nombre from equipos 
where ciudad like 'C%' order by nombre;

/*Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.*/

select Puntos_por_partido
from estadisticas where jugador =66 and temporada = '04/05';

/*Mostrar los diez jugadores con más puntos en toda su carrera con un redondeo de dos decimales.*/

select jugador, round(sum(puntos_por_partido),2) as total_de_puntos
from estadisticas group by jugador
order by total_de_puntos desc limit 10;

/*Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.*/

select equipos.Nombre, equipos.Conferencia, equipos.Division from equipos
join jugadores on equipos.Nombre = jugadores.nombre_equipo order by Altura desc
limit 1;

/*Mostrar los 10 partidos (equipo_local, equipo_visitante y diferencia)
 con mayor diferencia de puntos.*/

select equipo_local, equipo_visitante, (puntos_local - puntos_visitante) as diferencia_de_puntos
from partidos order by diferencia_de_puntos desc limit 10;

/*Muestra el nombre del equipo con la mayor diferencia de puntos totales
 de la temporada temporada "00/01".*/

select equipo_local, equipo_visitante from partidos
where temporada = '00/01' order by (puntos_local - puntos_visitante) desc
limit 1;

/*Encuentra el nombre de los diez equipos que mejor porcentaje de victorias
 tengan en la temporada "98/99". El número de porcentaje debe estar escrito
 del 1 al 100 con hasta dos decimales y acompañado por el símbolo “%”.*/
 
 select equipo_local, equipo_visitante, concat(round((puntos_local / ( puntos_local + puntos_visitante)) * 100, 2), '%')
 as porcentaje_de_victorias from partidos
 where temporada = '98/99'
 order by porcentaje_de_victorias desc limit 10;

/*Calcula el promedio de puntos por partido de los jugadores que son pivotes
 ('C') y tienen más de 7 pies de altura, y redondea el resultado a dos decimales.*/

SELECT ROUND(AVG(e.puntos_por_partido), 2) AS promedio_de_puntos
FROM estadisticas e
JOIN jugadores j ON e.jugador = j.codigo
WHERE j.posicion = 'C' AND j.altura > (7 * 12);

/*Muestra el nombre del jugador que ha registrado el mayor número de asistencias
 en un solo partido.*/
 
 select jugador from estadisticas
 order by asistencias_por_partido desc limit 1;

/*Encuentra el total de partidos en los que el equipo local anotó más de 100 puntos
 y el equipo visitante anotó menos de 90 puntos.*/

select count(*) as total_partidos
from partidos
where puntos_local > 100 and puntos_visitante < 90;

/*Calcula la diferencia de puntos promedio en todos los partidos de la temporada “00/01”
 y redondea el resultado a dos decimales.*/

select round(avg(abs(puntos_local - puntos_visitante)), 2) as diferencia_de_puntos
from partidos where temporada = '00/01';

/*Encuentra el nombre del equipo que ha tenido al menos un jugador que ha promediado más
 de 10 rebotes por partido en la temporada “97/98”.*/
 
 SELECT DISTINCT equipos.nombre
FROM estadisticas
JOIN jugadores ON estadisticas.jugador = jugadores.codigo
JOIN equipos ON jugadores.nombre_equipo = equipos.nombre
WHERE temporada = '97/98' AND estadisticas.rebotes_por_partido > 10;
