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
drop table Users;
drop table User_Type;
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
