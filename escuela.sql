create database escuela

use escuela

create table carrera(

Clave_c int identity ,

nom_c varchar(50) unique,

durac_c float not null,

constraint pk_cc primary key (clave_c))

insert into carrera values ('ingenieria informatica', 5)
insert into carrera values ('artes', 4.5)

select * from carrera



create table materia(

clave_m int identity,

nom_m varchar(50) unique,

cred_m float not null,

constraint pk_cm primary key (clave_m))

insert into materia values ('java', 10)
insert into materia values ('artes palsticas', 10)

select * from materia



create table profesor(

clave_p int identity,
nom_p varchar(150) not null, 
dir_p varchar(200) not null,
tel_p bigint unique, 
hor_p datetime null,

constraint pk_cp primary key (Clave_p))

insert into profesor values ('alejandro', 'cra 65 # 45-85', 3256871, 0)
insert into profesor values ('juan', 'calle 78 # 236-8', 3569875, 2)

select * from profesor


-------Tabla alumno con clave foranea

create table alumno(

mat_alu int identity,

nom_alu varchar(150) not null,

edad_alu int not null,

sem_alu int null,

gen_alu varchar(10) not null,

clave_c1 int ,

constraint pk_calu primary key (mat_alu), constraint fk_fc1 foreign key (clave_c1) references carrera(clave_c))

insert into alumno values ('alejandro', '28', 5, 'masculino', 1)
insert into alumno values ('luisa', '20', 3, 'femenino', 2)

select * from alumno

------tablas intermedias alumno-profesor

create table alu_pro(

mat_alu1 int,

clave_p1 int,

constraint fk_falu1 foreign key(mat_alu1) references alumno (mat_alu),

constraint fk_fp1 foreign key (clave_p1) references profesor (clave_p))


insert into alu_pro values (1, 1)

select * from alu_pro

-------tabla intermedia materia-alumno

create table mat_alu(

clave_m1 int,

mat_alu2 int,

constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),

constraint fk_falu2 foreign key (mat_alu2) references alumno(mat_alu) )

------------tabla intermedia materia profesor

create table mat_pro(

clave_m2 int,

clave_p2 int,

constraint fk_fm2 foreign key (clave_m2) references materia(clave_m),

constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p))