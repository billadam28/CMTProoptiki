/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  adamopoulo
 * Created: Mar 18, 2017
 */

set foreign_key_checks = 0;
--drop table `Group`;
--drop table Visit_Visitor_Lnk;
--drop table Visit;
--drop table Doctor;
--drop table Visitor;
--drop table Admin;
drop table if exists Users;
drop table if exists User_Type;
drop table if exists budget ;
drop table if exists projects;
--drop table Institution;
--drop table City;
--drop table Specialty;
--drop table Geographical_Area;
--drop table Cycle;

set foreign_key_checks= 1;

CREATE TABLE User_Type (
  id           int NOT NULL AUTO_INCREMENT,
  usr_type     varchar(20) NOT NULL CHECK (usr_type='admin' OR usr_type= 'employee' OR usr_type='operator'),
  PRIMARY KEY (id)
);

CREATE TABLE `Users` (
  id           int NOT NULL AUTO_INCREMENT,
  firstname    varchar(50) NOT NULL,
  surname      varchar(50) NOT NULL,
  email        varchar(50) NOT NULL,
  username     varchar(50) NOT NULL,
  passwd       varchar(50) NOT NULL,
  user_type    int NOT NULL,
  unique (email),
  unique(username),
  PRIMARY KEY (id),
  constraint fk_usertype FOREIGN KEY (user_type) REFERENCES User_Type (id) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE Projects (
  id               int NOT NULL AUTO_INCREMENT,
  project_name     varchar(50) not null,
  acronyme         varchar(4) not null,
  contract_number  int not null,
  start_date       date,
  end_date         date,
  budget           float,
  total_project_grant float,
  cmt_budget       float,
  total_cmt_grant  float,
  payments_scheme  varchar(50),
  first_payment    float,
  second_payment    float,
  third_payment    float,
  fourth_payment    float,
  comments         varchar(250),
  PRIMARY KEY (id),
  UNIQUE KEY `name_unq` (`project_name`),
  UNIQUE KEY `acr_unq` (`acronyme`)
  --constraint fk_vst_doctor_id FOREIGN KEY (doctor_id) REFERENCES Doctor (id) 
  --ON DELETE CASCADE ON UPDATE CASCADE,
  --constraint fk_vst_cycle_id FOREIGN KEY (cycle_id) REFERENCES Cycle (id)
);

CREATE TABLE `Budget` (
  id                         int NOT NULL AUTO_INCREMENT,
  project_id                 int NOT NULL,
  category                   varchar(200) NOT NULL,
  dialy_cost                 float,
  monthly_cost               float,
  estimated_person_days      int,
  estimated_person_months    float,
  PRIMARY KEY (id),
  constraint fk_projid FOREIGN KEY (project_id) REFERENCES Projects (id) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ;


INSERT INTO User_Type
(usr_type) VALUES ('admin');

INSERT INTO User_Type
(usr_type) VALUES ('employee');

INSERT INTO User_Type
(usr_type) VALUES ('operator');

INSERT INTO Users
(firstname, surname, email, username, passwd, user_type)
VALUES ('Vassilis', 'Adamopoulos','bill@bill.com','bill',SHA1('123'), 1);

INSERT INTO Users
(firstname, surname, email, username, passwd, user_type)
VALUES ('Aris', 'Mourikis','aris@aris.com','aris',SHA1('123'), 2);

INSERT INTO Users
(firstname, surname, email, username, passwd, user_type)
VALUES ('Thodoris', 'Efstathiou','teo@teo.com','teo',SHA1('123'), 3);


