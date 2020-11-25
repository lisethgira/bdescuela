---- se crea base de datos escuela---
create database escuela

---se usa base de datos escuela---
use escuela

--- se crea la tabla carrera con clave primaria---
create table carrera(

clave_c int identity ,

nom_c varchar(50) unique,

durac_c float not null,

constraint pk_cc primary key (clave_c))

insert into carrera values ('ingenieria sistemas', 5) --- se insertan datos a la tabla carrera---
insert into carrera values ('lenguas extranjeras', 4.5)


select * from carrera --- selecciona la tabla carrera y muestra todos sus datos---


create table materia(

clave_m int identity,

nom_m varchar(50) unique,

cred_m float not null,

constraint pk_cm primary key (clave_m))

insert into materia values ('trigonometria', 10)
insert into materia values ('ingles', 10)
insert into materia values ('euclidiana', 5)

select * from materia



create table profesor(

clave_p int identity,
nom_p varchar(150) not null, 
dir_p varchar(200) not null,
tel_p bigint unique, 
hor_p datetime null,

constraint pk_cp primary key (Clave_p))

insert into profesor values ('liseth', 'cra 65 # 35-37', 3256871, 0)
insert into profesor values ('juan', 'calle 59 # 23-80', 3569875, 2)
insert into profesor values ('vanessa', 'calle 27 # 56-45', 3569879, 3)

select * from profesor


-------Tabla alumno con clave foranea------

create table alumno(

mat_alu int identity,

nom_alu varchar(150) not null,

edad_alu int not null,

sem_alu int null,

gen_alu varchar(10) not null,

clave_c1 int ,

constraint pk_calu primary key (mat_alu), 

constraint pk_fc1 foreign key (clave_c1) references carrera (Clave_c))

insert into alumno values ('valeria', '35', 5, 'femenino', 1)
insert into alumno values ('luis', '22', 3, 'masculino', 2)
insert into alumno values ('pedro', '62', 2, 'masculino', 3)

select * from alumno

------tabla intermedia alumno-profesor-----

create table alu_pro(

mat_alu1 int,

clave_p1 int,

constraint fk_falu1 foreign key(mat_alu1) references alumno (mat_alu),

constraint fk_fp1 foreign key (clave_p1) references profesor (clave_p))


insert into alu_pro values (1, 1)

select * from alu_pro

-------tabla intermedia materia-alumno----

create table mat_alu(

clave_m1 int,

mat_alu2 int,

constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),

constraint fk_falu2 foreign key (mat_alu2) references alumno(mat_alu) )

------------tabla intermedia materia profesor----

create table mat_pro(

clave_m2 int,

clave_p2 int,

constraint fk_fm2 foreign key (clave_m2) references materia(clave_m),

constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p))

select * from alumno

--alumnos con id de carrera 3.
select * from alumno where clave_c1 = 2


--consulta por campo que comience por la letra s
select * from alumno where  nom_Alu like 'V%'
select * from alumno where  nom_Alu like '%P'
select * from alumno where  nom_Alu like 'Luis%'

--mostrar de forma ascendente
select * from alumno order by edad_alu asc

--mostrar de forma descendente
select * from alumno order by edad_alu desc


select * from alumno
--se muestran la cantidad de alumnos que tienen el mismo id de carrera y que sea menor o igual a 2
select clave_c1, COUNT(clave_c1) as cantidad from alumno 
group by clave_c1 having count(*) <= 2

--suma las edades de los alumnos
select sum(edad_alu) as suma from alumno


--antes y despues del between
select nom_alu,edad_alu,gen_alu from alumno where edad_alu >= 20 and edad_alu <= 59 order by edad_alu desc
select nom_alu,edad_alu,gen_alu from alumno where edad_alu between  20 and  59 order by edad_alu desc

--exclyendo a Valeria
select * from alumno where (nom_alu not in ('Valeria'))

--mostramos los dos primeros alumnos
select  top 2 * from alumno

select distinct clave_c1 from alumno

--usamos funcion de promedio, dato minimo y dato maximo.
select AVG(edad_Alu) as promedioEdades FROM alumno
select MIN(edad_Alu) as edadMinima from alumno
select MAX(edad_Alu) as edadMinima from alumno