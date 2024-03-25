-- creacion y posiscionarse en Dastabase alke_wallet --
create database alke_wallet;
use alke_wallet;
-- crecion de tablas --

create table usuario(
user_id int auto_increment primary key,
nombre varchar(50),
correo_electronico varchar(50),
contraseña varchar(10),
saldo int
);

create table transaccion(
transaccion_id int auto_increment primary key,
sender_user_id int, foreign key (sender_user_id)references usuario(user_id),
receiver_user_id int, foreign key(receiver_user_id)references usuario(user_id),
importe int,
transactio_date date
);

create table moneda(
currency_id int auto_increment primary key,
currency_name varchar(15),
current_symbol varchar (5),
transaccion_money int, foreign key (transaccion_money)references transaccion(transaccion_id)
);

-- insercion de datos --

insert into usuario(nombre, correo_electronico, contraseña, saldo) values 
('Jose Opazo','joseopazo.86@gmial.com','1234jo',250000),
('roman medina','rmedina@gmial.com','cas123',300000),
('Josefa Munoz','mmunoz@gmial.com','jo125465',5000000),
('Agustina Lilen','agusli@gmial.com','pupi2012',100000),
('Juan Meneses','jmenes@gmial.com','1112',750000),
('Luis Castro','lcastro.86@gmial.com','lcas12',450000);

insert into transaccion(sender_user_id, receiver_user_id, importe, transactio_date )values
(1,3,10000,"2023-03-20"),
(4,3,250000,"2024-09-15"),
(2,5,90000,"2024-06-08"),
(1,6,85000,"2024-04-10"),
(3,1,25000,"2023-03-25"),
(6,4,11000,"2023-04-30");

insert into moneda(currency_name, current_symbol, transaccion_money)values
('Peso chileno', 'CLP', 1),
('Dolar', 'US', 3),
('Euro', 'EUR', 5);
select*from moneda;

-- Crear consultas SQL para Consulta para obtener el nombre de la moneda elegida por un usuario específico --
select moneda.currency_name, usuario.user_id, usuario.nombre from usuario inner join transaccion on usuario.user_id = transaccion.transaccion_id
inner join moneda on transaccion.transaccion_id= moneda.transaccion_money;


-- Consulta para obtener todas las transacciones registradas
select * from transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
 select nombre  from usuario where  user_id in (select transaccion_id from transaccion where sender_user_id = 1 );

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
update usuario SET correo_electronico = 'correoelectronicoModificado@gmail.com' WHERE user_id = 1;
select * from usuario;

-- - Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
delete from transaccion WHERE transaccion_id = 2;
select * from transaccion;




