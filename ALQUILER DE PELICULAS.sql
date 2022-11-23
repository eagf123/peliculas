/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/11/2022 12:22:45                          */
/*==============================================================*/


drop table Alquiler;

drop table Categoria;

drop table Cliente;

drop table DetalleAlquiler;

drop table Direccion;

drop table Forma_de_Pago;

drop table Inventario;

drop table Pelicula;

/*==============================================================*/
/* Table: Alquiler                                              */
/*==============================================================*/
create table Alquiler (
   alqui_id             smallint             not null,
   Pago_id              INT4                 null,
   cli_id               smallint             null,
   alqui_fechaAlquiler  date                 null,
   alqui_fechaDevolucion date                 null,
   constraint PK_ALQUILER primary key (alqui_id)
);

/*==============================================================*/
/* Table: Categoria                                             */
/*==============================================================*/
create table Categoria (
   cat_id               smallint             not null,
   cat_nombre           varchar(45)          null,
   constraint PK_CATEGORIA primary key (cat_id)
);

/*==============================================================*/
/* Table: Cliente                                               */
/*==============================================================*/
create table Cliente (
   cli_id               smallint             not null,
   cli_nombres          varchar(45)          null,
   cli_apellidos        varchar(45)          null,
   cli_cedula           varchar(15)          null,
   cli_telefono         varchar(15)          null,
   cli_email            varchar(45)          null,
   cli_direccion        smallint             null,
   constraint PK_CLIENTE primary key (cli_id)
);

/*==============================================================*/
/* Table: DetalleAlquiler                                       */
/*==============================================================*/
create table DetalleAlquiler (
   deta_alqui_id        smallint             not null,
   deta_alqui_precioTotal numeric              null,
   deta_alqui_cantidad  int                  null,
   deta_alqui_pelicula  smallint             null,
   alqui_id             smallint             null,
   constraint PK_DETALLEALQUILER primary key (deta_alqui_id)
);

/*==============================================================*/
/* Table: Direccion                                             */
/*==============================================================*/
create table Direccion (
   dir_id               smallint             not null,
   dir_ciudad           varchar(25)          null,
   dir_calle            varchar(25)          null,
   constraint PK_DIRECCION primary key (dir_id)
);

/*==============================================================*/
/* Table: Forma_de_Pago                                         */
/*==============================================================*/
create table Forma_de_Pago (
   Pago_id              INT4                 not null,
   Pagoportranferencia_id INT4                 null,
   Pagoenefectivo_id    INT4                 null,
   constraint PK_FORMA_DE_PAGO primary key (Pago_id)
);

/*==============================================================*/
/* Table: Inventario                                            */
/*==============================================================*/
create table Inventario (
   inve_id              smallint             not null,
   invetario_cantidad   int                  null,
   inve_pelicula        smallint             null,
   constraint PK_INVENTARIO primary key (inve_id)
);

/*==============================================================*/
/* Table: Pelicula                                              */
/*==============================================================*/
create table Pelicula (
   peli_id              smallint             not null,
   peli_titulo          varchar(45)          null,
   peli_duracion        int                  null,
   peli_descripcion     varchar(45)          null,
   peli_año            varchar(20)          null,
   peli_categoria       int                  null,
   peli_idioma          varchar(20)          null,
   peli_edadMinima      varchar(20)          null,
   peli_director        varchar(45)          null,
   constraint PK_PELICULA primary key (peli_id)
);

alter table Alquiler
   add constraint FK_ALQUILER_REFERENCE_FORMA_DE foreign key (Pago_id)
      references Forma_de_Pago (Pago_id)
      on delete restrict on update restrict;

alter table Alquiler
   add constraint alqui_cli_fk foreign key (cli_id)
      references Cliente (cli_id)
      on delete set null on update cascade;

alter table Cliente
   add constraint cli_dir_fk foreign key (cli_direccion)
      references Direccion (dir_id)
      on delete set null on update cascade;

alter table DetalleAlquiler
   add constraint alguiler_detalle_fk foreign key (alqui_id)
      references Alquiler (alqui_id)
      on delete set null on update cascade;

alter table DetalleAlquiler
   add constraint alguiler_peli_fk foreign key (deta_alqui_pelicula)
      references Pelicula (peli_id)
      on delete set null on update cascade;

alter table Inventario
   add constraint peli_inve_fk foreign key (inve_pelicula)
      references Pelicula (peli_id)
      on delete set null on update cascade;

alter table Pelicula
   add constraint peli_cat_fk foreign key (peli_categoria)
      references Categoria (cat_id)
      on delete set null on update cascade;

