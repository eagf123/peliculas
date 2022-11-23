insert into direccion values(1, 'Manta','La jefferson');
insert into direccion values(2, 'Portoviejo','El floron');
insert into direccion values(3, 'Montecristi','El cerro');
insert into direccion values(4, 'Guayaquil','Pascual');
insert into direccion values(5, 'Chone','San Antonio');
insert into direccion values(6, 'Jipijapa','El choclo');


insert into cliente values(1, 'Eduardo Antonio', 'Garcia Flores', '1250642334', '09876', 'hshdgddg', 1, ' ');
insert into cliente values(2, 'Enner', 'Valencia', '1250642335', '09876', 'hshdgddg', 1, ' ');
insert into cliente values(3, 'Gonzalo', 'Plata', '1250642336', '09876', 'hshdgddg', 1, ' ');
insert into cliente values(4, 'Hernan', 'Galindez', '1250642357', '09876', 'hshdgddg', 1, ' ');
insert into cliente values(5, 'Piero', 'Hincapie', '1250642348', '09876', 'hshdgddg', 1, ' ');
insert into cliente values(6, 'Jeremy', 'Sarmiento', '1250642349', '09876', 'hshdgddg', 2, ' ');
insert into cliente values(7, 'Felix', 'Torres', '1250642350', '09876', 'hshdgddg', 2, ' ');
insert into cliente values(8, 'Renato', 'Ibarra', '1250642351', '09876', 'hshdgddg', 2, ' ');

insert into Forma_de_Pago values(1, 1, 1);
insert into Forma_de_Pago values(2, 1, 1);
insert into Forma_de_Pago values(3, 1, 1);
insert into Forma_de_Pago values(4, 1, 1);
insert into Forma_de_Pago values(5, 1, 1);


insert into alquiler values(1, 1, 1, '2022-05-15', '2022-05-30');
insert into alquiler values(6, 1, 1, '2022-05-15', '2022-05-30');
insert into alquiler values(2, 2, 3, '2022-05-15', '2022-05-30');
insert into alquiler values(3, 4, 5, '2022-05-15', '2022-05-30');
insert into alquiler values(4, 3, 4, '2022-05-15', '2022-05-30');


insert into categoria values(1, 'Terror');
insert into categoria values(2, 'Accion');

insert into pelicula values(1, 'Halloween 1',2, 'Pelicula de terror antigua','1980', 1, 'Ingles-español',
						   '17','Drako Andrew');
insert into pelicula values(2, 'ROOBIN HOOD',2, 'Pelicula de accion actual',
							'2018', 2, 'Ingles-español',
						   '12','Harry Nicols');
insert into pelicula values(3, 'Punto de quiebre',2, 'Pelicula de accion actual',
							'2020', 2, 'Ingles-español',
						   '19','Steven Mine');						   
insert into pelicula values(4, 'El escuadron suicida',3, 'Pelicula de accion actual',
							'2015', 2, 'Ingles-español',
						   '17','Vike Vans');						   
insert into pelicula values(5, 'El Alquimista',2, 'Pelicula de accion actual',
							'2018', 2, 'Ingles-español',
						   '15','Jhon Dran');
						   
						   
insert into DetalleAlquiler values(1, 15, 1, 3, 1);
insert into DetalleAlquiler values(2, 10, 3, 4, 6);
insert into DetalleAlquiler values(3, 20, 4, 5, 2);
insert into DetalleAlquiler values(4, 26, 2, 2, 4);
insert into DetalleAlquiler values(5, 12, 5, 1, 3);




--Consultas

--Primera
--Mostrar el alquiler de peliculas del mes de mayo, para ello se pide mostrar el nombre, y la cedula
-- de quien realizo el alquiler
select 
c.cli_nombres as nombres, c.cli_cedula  as cedula
from cliente c inner join alquiler al
on c.cli_id = al.cli_id
where EXTRACT(MONTH FROM al.alqui_fechaAlquiler) = '5';

--Segunda
--Mostrar todos los titulos de peliculas segun su categoria. Para ello se pide mostrar
--El titulo de la pelicula, la descripcion, el idioma disponible, y el nombre de la categoria a la que pertenece,
select pe.peli_titulo as titulo, pe.peli_descripcion as descripcion, pe.peli_idioma as idioma,
ca.cat_nombre as categoria
from categoria ca inner join pelicula pe
on ca.cat_id = pe.peli_categoria;


--Tercera
--Mostrar las peliculas que cumplan con edad minima de 17 años. Para ello se pide mostrar el titulo
--de la pelicula, la categoria, el año, en que idiomas esta disponible y la edad minima.
select pe.peli_titulo as titulo, ca.cat_nombre as categoria,
pe.peli_año as año, pe.peli_idioma as idioma,
pe.peli_edadminima as edad_minima
from pelicula pe 
inner join categoria ca on ca.cat_id = pe.peli_categoria
where peli_edadMinima >= '17';


--Cuarta
--Mostrar todos los clientes que hayan alquilado una pelicula. Para ello se quiere saber el titulo de la misma,
--precio, los nombres del cliente y la fecha de alquiler.
select pe.peli_titulo as titulo, de.deta_alqui_preciototal as precio,
ce.cli_nombres as nombre_cliente, al.alqui_fechaalquiler as fecha_alquiler
from cliente ce
inner join alquiler al 
on ce.cli_id = al.cli_id
inner join detallealquiler de
on al.alqui_id = de.alqui_id
inner join pelicula pe on pe.peli_id = de.deta_alqui_pelicula
where pe.peli_categoria = 2;





ee





