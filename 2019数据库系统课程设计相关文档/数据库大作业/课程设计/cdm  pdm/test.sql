/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2019/12/11 星期三 下午 10:27:02                   */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_PASSENGE_PEOPLE_CA_BASIC AU') then
    alter table "Passenger information table"
       delete foreign key "FK_PASSENGE_PEOPLE_CA_BASIC AU"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PASSENGE_PEOPLE_TR_TICKET I') then
    alter table "Passenger information table"
       delete foreign key "FK_PASSENGE_PEOPLE_TR_TICKET I"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PASSENGE_ROUNT_PEO_LINE INF') then
    alter table "Passenger information table"
       delete foreign key "FK_PASSENGE_ROUNT_PEO_LINE INF"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TICKET I_ROUNT_PRI_LINE INF') then
    alter table "Ticket information table"
       delete foreign key "FK_TICKET I_ROUNT_PRI_LINE INF"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TICKET I_TRACKIT_C_BASIC AU') then
    alter table "Ticket information table"
       delete foreign key "FK_TICKET I_TRACKIT_C_BASIC AU"
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LINE INF_ROUNT_TRA_BASIC AU') then
    alter table "line information"
       delete foreign key "FK_LINE INF_ROUNT_TRA_BASIC AU"
end if;

drop table if exists "Basic automobile information";

drop table if exists "Passenger information table";

drop table if exists "Ticket information table";

drop table if exists "line information";

/*==============================================================*/
/* Table: "Basic automobile information"                        */
/*==============================================================*/
create table "Basic automobile information" 
(
   car_num              char(10)                       not null,
   "car num"            char(10)                       null,
   车票编号                 char(10)                       null,
   car_var              char(10)                       null,
   capacity             integer                        null,
   "line numbe"         char(10)                       null,
   constraint "PK_BASIC AUTOMOBILE INFORMATIO" primary key clustered (car_num)
);

/*==============================================================*/
/* Table: "Passenger information table"                         */
/*==============================================================*/
create table "Passenger information table" 
(
   "car num"            Characters (10)                not null,
   car_num              char(10)                       null,
   c_num                Characters (10)                null,
   line_number          char(10)                       null,
   s_place              Characters (10)                null,
   d_place              Characters (10)                null,
   r_num                Characters (10)                null,
   s_time               Characters (10)                null,
   constraint "PK_PASSENGER INFORMATION TABLE" primary key clustered ("car num")
);

/*==============================================================*/
/* Table: "Ticket information table"                            */
/*==============================================================*/
create table "Ticket information table" 
(
   c_num                Characters (10)                not null,
   line_number          char(10)                       null,
   car_num              char(10)                       null,
   condition            Characters (10)                null,
   price                integer                        null,
   r_num                Characters (10)                null,
   constraint "PK_TICKET INFORMATION TABLE" primary key clustered (c_num)
);

/*==============================================================*/
/* Table: "line information"                                    */
/*==============================================================*/
create table "line information" 
(
   line_number          char(10)                       not null,
   "car num"            char(10)                       null,
   t_num                char(10)                       null,
   car_num              char(10)                       null,
   departure            char(10)                       null,
   whither              char(10)                       null,
   d_time               char(10)                       null,
   sum_time             integer                        null,
   constraint "PK_LINE INFORMATION" primary key clustered (line_number)
);

alter table "Passenger information table"
   add constraint "FK_PASSENGE_PEOPLE_CA_BASIC AU" foreign key (car_num)
      references "Basic automobile information" (car_num)
      on update restrict
      on delete restrict;

alter table "Passenger information table"
   add constraint "FK_PASSENGE_PEOPLE_TR_TICKET I" foreign key (c_num)
      references "Ticket information table" (c_num)
      on update restrict
      on delete restrict;

alter table "Passenger information table"
   add constraint "FK_PASSENGE_ROUNT_PEO_LINE INF" foreign key (line_number)
      references "line information" (line_number)
      on update restrict
      on delete restrict;

alter table "Ticket information table"
   add constraint "FK_TICKET I_ROUNT_PRI_LINE INF" foreign key (line_number)
      references "line information" (line_number)
      on update restrict
      on delete restrict;

alter table "Ticket information table"
   add constraint "FK_TICKET I_TRACKIT_C_BASIC AU" foreign key (car_num)
      references "Basic automobile information" (car_num)
      on update restrict
      on delete restrict;

alter table "line information"
   add constraint "FK_LINE INF_ROUNT_TRA_BASIC AU" foreign key (car_num)
      references "Basic automobile information" (car_num)
      on update restrict
      on delete restrict;

