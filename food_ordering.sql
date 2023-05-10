create schema food_ordering;
use `food_ordering`;
CREATE TABLE `customers` (
  `customer_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  `email` varchar(45) not null,
  `phone_no` tinytext not null,
  `location` varchar(255)
)auto_increment=1;
INSERT INTO `customers` VALUES (1,'Alan Biju','alan@gmail.com','7654321','kannur');
INSERT INTO `customers` VALUES (2,'Don Sagar','sagar@gmail.com','7654541','ktm');
INSERT INTO `customers` VALUES (3,'Thomas Kutty','thoma@gmail.com','7763321','Chanthavila');

CREATE TABLE `employee` (
  `employee_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_id`),
  `delivered` boolean,
  `phone_no` tinytext not null
)auto_increment=1;
INSERT INTO `employee` VALUES (1,'Aniket',true,12345);
INSERT INTO `employee` VALUES (2,'Dona',false,'765');
INSERT INTO `employee` VALUES (3,'Rohit jha',true,'7763');

CREATE TABLE `order` (
  `order_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `order_date` date not null,
  PRIMARY KEY (`order_id`),
  `employee_id` tinyint(4) NOT NULL,
  `customer_id` tinyint(4) NOT NULL,
  `rest_id` tinyint(4) NOT NULL,
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  foreign key (`employee_id`) references `employee` (`employee_id`),
  foreign key (`rest_id`) references `restaurant` (`rest_id`),
  `quantity` tinyint(4) default 1
)auto_increment=1;

CREATE TABLE `restaurant` (
  `rest_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rest_id`),
  `menu_id` tinyint(4) NOT NULL,
  FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  `location` varchar(255)
)auto_increment=1;

CREATE TABLE `menu` (
  `menu_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `food_id` tinyint(4) NOT NULL,
  FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  primary key(`menu_id`)

)auto_increment=1;

create table `food`(
`food_id` tinyint(4) NOT NULL AUTO_INCREMENT,
`food_name` varchar(255),
`food_price` int(10),
primary key(`food_id`)
)auto_increment =1;