DROP DATABASE IF EXISTS bus_db;
CREATE DATABASE bus_db;
SHOW DATABASES;

USE bus_db;

CREATE TABLE IF NOT EXISTS employee(
	employee_id VARCHAR(6) NOT NULL,
	title VARCHAR(4) NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	surname VARCHAR(40) NOT NULL,
	dob DATE NOT NULL,
	house_num VARCHAR(10),
	street_name VARCHAR(40),
	town VARCHAR(40),
	postcode VARCHAR(7) NOT NULL,
	telephone_num VARCHAR(11) NOT NULL,
	country VARCHAR(40) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	job VARCHAR(10) NOT NULL,
	PRIMARY KEY (employee_id)
)engine=innodb DEFAULT CHARSET=latin1 AUTO_INCREMENT=9;

/*Employee Querys - Taken from provided table*/

INSERT INTO employee VALUES('NR1538','Mr','Nigel','Roberts','1975-04-26','1','Mocks Road','Walsall','WS1 1PM','07725489212','UK','M','Driver');
INSERT INTO employee VALUES('KB3352','Mrs','Kathy','Baker','1972-02-14','24','Baker Road','Birmingham','B46 7DE','07825837112','UK','F','Admin');
INSERT INTO employee VALUES('CP4434','Mr','Chris','Perry','1972-01-05','187','Cole Avenue','Birmingham','B36 0UI','07829192513','UK','M','Driver');
INSERT INTO employee VALUES('JW9989','Ms','Jenny','Ward','1979-08-07','276','Lancaster Way','Walsall','WS1 1TY','07725489212','UK','F','Driver');
INSERT INTO employee VALUES('SS129T','Miss','Sandeep','Singh','1981-11-05','8','Rover Drive','Birmingham','B46 1TR','07715419999','UK','F','Driver');
INSERT INTO employee VALUES('JE1221','Mr','Jacob','Edwards','1980-05-22','233','Pool Street','Walsall','WS1 7UY','01922458745','UK','M','Driver');
INSERT INTO employee VALUES('MF0091','Mr','Mohammed','Faisel','1965-07-17','77','Maxtor Road','Walsall','WS1 9KL','07725489212','UK','M','Admin');
INSERT INTO employee VALUES('CJ2323','Mrs','Caroline','Jackson','1970-06-10','15','Carey Way','Birmingham','B36 8WQ','01217845857','UK','F','Admin');
INSERT INTO employee VALUES('LK9706','Mr','Joesph','Hopwood','1986-03-01','23','Chester Avenue','Walsall','WS2 5GT','01922765843','UK','M','Admin');
INSERT INTO employee VALUES('BV3743','Mr','Daniel','Smith','1985-02-14','10','Fawkes Road','Birmingham','B12 6XT','07734765232','UK','M','Driver');
INSERT INTO employee VALUES('MN0984','Mrs','Katie','Fielder','1952-10-28','55','Brielle Street','Birmingham','B34 9IU','07775634123','UK','F','Driver');
INSERT INTO employee VALUES('AS3433','Mrs','Emma','Beech','1961-04-14','323','Caxton Road','Walsall','WS3 8HY','07756382649','UK','F','Admin');

CREATE TABLE IF NOT EXISTS bus_driver(
	ID INT(11) NOT NULL AUTO_INCREMENT,
	employee_id VARCHAR(6) NOT NULL,
	licence_num VARCHAR(9),
	expire_date DATE,
	acquire_date DATE,
	p_points INT,
	PRIMARY KEY (ID),
	UNIQUE (employee_id),
	FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
)engine=innodb DEFAULT CHARSET=latin1;

/*Bus Driver Querys*/

INSERT INTO bus_driver VALUES(NULL,'NR1538','JH3454555','2025-05-01','1975-05-01','0');
INSERT INTO bus_driver VALUES(NULL,'CP4434','HG676766','2031-08-01','1981-08-01','0');
INSERT INTO bus_driver VALUES(NULL,'JW9989','KL867656','2045-03-01','1995-03-01','3');
INSERT INTO bus_driver VALUES(NULL,'SS129T','KL867656','2051-01-01','2001-01-01','6');
INSERT INTO bus_driver VALUES(NULL,'JE1221','OI5676900','2019-07-01','1969-07-01','0');
INSERT INTO bus_driver VALUES(NULL,'BV3743',NULL,NULL,NULL,NULL);
INSERT INTO bus_driver VALUES(NULL,'MN0984',NULL,NULL,NULL,NULL);

CREATE TABLE IF NOT EXISTS route(
	route_id VARCHAR(6) NOT NULL,
	destination VARCHAR(40) NOT NULL,
	description VARCHAR(255) NOT NULL,
	PRIMARY KEY (route_id)
)engine=innodb DEFAULT CHARSET=latin1 AUTO_INCREMENT=9;

/*Route Querys*/

INSERT INTO route VALUES(1,'Old Birchills','The Drive, Abbey Drive, Abbey Square, The Glades, Red River Road, Roberts Road, Muirfield Close, Chandlers Keep, The Granary,  The Green, Wingate Road, Wisemore, Wolverhampton Road, Wolverhampton Road West');
INSERT INTO route VALUES(2,'Walsall Road Via Bloxwhich','Abingdon Road, Chapel Avenue, The Downs, The Grove, The Leasow, Mulberry Road, Myatt Way, Redbourn Road, Wolverhampton Street, Wolverson Road, Wood Common Grange, Chapel Drive, Mulberry Place, The Maltings, The Meadows, The Nook, Mouse Hill');
INSERT INTO route VALUES(19,'Birmingham Road','Acacia Avenue, Chapel Avenue, Murdoch Way, Woodall Street, Wood Green, Reedswood Gardens, Reedswood Lane, The Cloisters, The Cutting, Wood Lane, Woodbridge Close, Achilles Close');
INSERT INTO route VALUES(50,'Goscote Road','Jessie Road, The Parkway, Johns Lane, Woodlands Avenue, Woodlands Crescent, Aldis Road, Chapel Street, Regina Drive, The Alcove, The Pinfold, Charlemont Close, Chase Road, Reeves Street, The Arboretum, The Arcade, The Pines, Chatsworth Crescent');
INSERT INTO route VALUES('52A','Mosley Circular','Central Close, Central Drive, Remington Road, Reservoir Street, Telford Road, Tenbury Close, Woodruff Way, Wrekin View, Wrexham Avenue, Wych Elm Road, Wye Road');

CREATE TABLE IF NOT EXISTS bus(
	bus_id VARCHAR(2) NOT NULL,
	bus_reg VARCHAR(9) NOT NULL,
	manufacturer VARCHAR(40),
	model VARCHAR(40),
	facilties VARCHAR(40),
	PRIMARY KEY (bus_id)
)engine=innodb DEFAULT CHARSET=latin1 AUTO_INCREMENT=9;

/*Bus Querys*/

INSERT INTO bus VALUES('A1','S337 DJW','DAF','DB250','Disabled Access');
INSERT INTO bus VALUES('A2','Y150 NBV','DAF','DB320','USB and WiFi');
INSERT INTO bus VALUES('A3','F634 GTS','DAF','DB250','Disabled Access');
INSERT INTO bus VALUES('A4','G455 HGT','DAF','DB250','Disabled Access');
INSERT INTO bus VALUES('B1','J766 FUP','Ford','Proto-1','USB, WiFi and extra leg room');

CREATE TABLE IF NOT EXISTS timetable(
	timetable_id VARCHAR(6) NOT NULL,
	driver_id_fk INT(11) NOT NULL,
	bus_id_fk VARCHAR(6) NOT NULL,
	route_id_fk VARCHAR(6) NOT NULL,
	time TIME NOT NULL,
	date DATE NOT NULL,
	reverse BOOLEAN NOT NULL,
	FOREIGN KEY (driver_id_fk) REFERENCES bus_driver(ID),
	FOREIGN KEY (bus_id_fk) REFERENCES bus(bus_id),
	FOREIGN KEY (route_id_fk) REFERENCES route(route_id)
)engine=innodb DEFAULT CHARSET=latin1 AUTO_INCREMENT=9;

/*Timetable Querys*/

INSERT INTO timetable VALUES(1,'3','A2','52A','06:30:00','2018/01/24',FALSE);
INSERT INTO timetable VALUES(2,'3','A4','2','11:42:00','2018/01/25',TRUE);
INSERT INTO timetable VALUES(1,'3','A2','52A','06:30:00','2018/01/24',TRUE);
INSERT INTO timetable VALUES(2,'3','A4','2','12:42:00','2018/01/25',FALSE);
INSERT INTO timetable VALUES(3,'3','B1','2','11:42:00','2018/01/25',TRUE);

/*Setup audit table*/

CREATE TABLE IF NOT EXISTS employee_audit(
	audit_id INT AUTO_INCREMENT NOT NULL,
	employee_id VARCHAR(6) NOT NULL,
	employee_title VARCHAR(4) NOT NULL,
	employee_first_name VARCHAR(40) NOT NULL,
	employee_surname VARCHAR(40) NOT NULL,
	employee_dob DATE NOT NULL,
	employee_house_num INT,
	employee_street_name VARCHAR(40),
	employee_town VARCHAR(40),
	employee_postcode VARCHAR(7) NOT NULL,
	employee_telephone_num VARCHAR(11) NOT NULL,
	employee_country VARCHAR(40) NOT NULL,
	employee_gender VARCHAR(1) NOT NULL,
	employee_job VARCHAR(10),
	action_performed VARCHAR(20) NOT NULL,
	date_performed DATETIME NOT NULL,
	PRIMARY KEY (audit_id)
)engine=innodb DEFAULT CHARSET=latin1 AUTO_INCREMENT=9;

/*General SQL Querys*/

SELECT * FROM timetable INNER JOIN bus_driver ON employee_id = employee_id;
SELECT * FROM employee WHERE title = 'Mr' AND town = 'Walsall';
SELECT * FROM bus_driver INNER JOIN employee ON bus_driver.employee_id = employee.employee_id WHERE p_points BETWEEN 1 AND 5;
SELECT bus_id,bus_reg,manufacturer,model FROM bus WHERE manufacturer='Ford' OR model='DB250';
SELECT route_id,destination,description FROM route WHERE destination LIKE 'B%';


/*Creating Triggers (AUTOMATED)*/
DELIMITER $$
USE bus_db $$

CREATE TRIGGER after_insert
	AFTER INSERT ON employee FOR EACH ROW
	BEGIN
		INSERT INTO employee_audit (audit_id, employee_id, employee_title, employee_first_name, employee_surname, employee_dob, employee_house_num, employee_street_name, employee_town, employee_postcode, employee_telephone_num, employee_country, employee_gender, employee_job, action_performed, date_performed)
		VALUES (NULL, NEW.employee_id, NEW.title, NEW.first_name, NEW.surname, NEW.dob, NEW.house_num, NEW.street_name, NEW.town, NEW.postcode, NEW.telephone_num, NEW.country, NEW.gender, NEW.job, 'INSERT', NOW());
	END
$$

CREATE TRIGGER after_delete
	AFTER DELETE ON employee FOR EACH ROW
	BEGIN
		INSERT INTO employee_audit (audit_id, employee_id, employee_title, employee_first_name, employee_surname, employee_dob, employee_house_num, employee_street_name, employee_town, employee_postcode, employee_telephone_num, employee_country, employee_gender, employee_job, action_performed, date_performed)
		VALUES (NULL, OLD.employee_id, OLD.title, OLD.first_name, OLD.surname, OLD.dob, OLD.house_num, OLD.street_name, OLD.town, OLD.postcode, OLD.telephone_num, OLD.country, OLD.gender, OLD.job, 'DELETE', NOW());
	END
$$

CREATE TRIGGER after_update
	AFTER UPDATE ON employee FOR EACH ROW
	BEGIN
		INSERT INTO employee_audit (audit_id, employee_id, employee_title, employee_first_name, employee_surname, employee_dob, employee_house_num, employee_street_name, employee_town, employee_postcode, employee_telephone_num, employee_country, employee_gender, employee_job, action_performed, date_performed)
		VALUES (NULL, OLD.employee_id, OLD.title, OLD.first_name, OLD.surname, OLD.dob, OLD.house_num, OLD.street_name, OLD.town, OLD.postcode, OLD.telephone_num, OLD.country, OLD.gender, OLD.job, 'UPDATE', NOW());
	END
$$

DELIMITER ;

/*Audit Querys*/

INSERT INTO employee VALUES('NR1539','Mrs','Charlotte','Berry','1998/05/26','43','Lichfield Road','Lichfield','WS4 3GH','07724478953','US','F','Driver');
DELETE FROM employee WHERE employee_id='GTFD31';
UPDATE employee SET postcode = 'WS5 8GC' WHERE employee_id = 'MF0091';
SELECT * FROM employee_audit;
