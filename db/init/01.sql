CREATE DATABASE IF NOT EXISTS os_controller;
USE os_controller;

CREATE TABLE IF NOT EXISTS task_status (
  id INT(2) NOT NULL,
  status VARCHAR(11),
  PRIMARY KEY (id)
);

insert into task_status (id, status) values (1, 'BACKLOG');
insert into task_status (id, status) values (2, 'WORKING');
insert into task_status (id, status) values (3, 'FIXING');
insert into task_status (id, status) values (4, 'DONE');
insert into task_status (id, status) values (5, 'PAUSED');
insert into task_status (id, status) values (5, 'PAID');

CREATE TABLE IF NOT EXISTS task (
  id BIGINT NOT NULL,
  name VARCHAR(150) NOT NULL,
  description LONGTEXT NOT NULL,
  creationDate DATE NOT NULL,
  lastEditDate VARCHAR(30) NOT NULL,
  time INT(4) NOT NULL,
  status INT(2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (status) REFERENCES task_status(id)
);

CREATE TABLE IF NOT EXISTS user (
  id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  UNIQUE (name),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS regUserTasks(
  taskId BIGINT NOT NULL,
  userId INT NOT NULL,
  FOREIGN KEY (taskId) REFERENCES task(id),
  FOREIGN KEY (userId) REFERENCES user(id),
  PRIMARY KEY (taskId, userId)
);