drop table if exists dependent;
drop table if exists works_on;
drop table if exists employee;
drop table if exists project;
drop table if exists dept_locations;
drop table if exists department;

create table department (
	dname varchar(16) not null,
	dnumber int not null,
	mgr_ssn int not null,
	mgr_start_date date not null,
	primary key(dnumber)
)type=innodb;

create table dept_locations (
	dnumber int not null,
	dlocation varchar(16) not null,
	primary key(dnumber, dlocation),
	foreign key(dnumber) references department(dnumber)
)type=innodb;

create table employee (
	fname varchar(16) not null,
	minit varchar(1) not null,
	lname varchar(32) not null,
	ssn int not null,
	bdate date not null,
	address varchar(32),
	sex char(1) not null check(value in ('M', 'F')),
	salary int not null,
	super_ssn int,
	dno int not null,
	primary key(ssn),
	foreign key(dno) references department(dnumber),
	foreign key(super_ssn) references employee(ssn)
)type=innodb;

create table dependent (
	essn int not null,
	dependent_name varchar(16) not null,
	sex char(1) not null check(value in ('M', 'F')),
	bdate date not null,
	relationship varchar(12) not null,
	primary key(essn, dependent_name),
	foreign key(essn) references employee(ssn)
)type=innodb;

create table project (
	pname varchar(16) not null,
	pnumber int not null,
	plocation varchar(16) not null,
	dnum int not null,
	primary key(pnumber),
	foreign key(dnum, plocation) references dept_locations(dnumber, dlocation)
)type=innodb;
	
create table works_on (
	essn int not null,
	pno int not null,
	hours float(6,2),
	primary key(essn, pno),
	foreign key(essn) references employee(ssn),
	foreign key(pno) references project(pnumber)
)type=innodb;

insert into department values('Research', 5, 333445555, '1988-05-22');
insert into department values('Administration', 4, 987654321, '1995-01-01');
insert into department values('Headquarters', 1, 888665555, '1981-06-19');
insert into dept_locations values(1, 'Houston');
insert into dept_locations values(4, 'Stafford');
insert into dept_locations values(5, 'Bellaire');
insert into dept_locations values(5, 'Sugarland');
insert into dept_locations values(5, 'Houston');
insert into project values('ProductX', 1, 'Bellaire', 5);
insert into project values('ProductY', 2, 'Sugarland', 5);
insert into project values('ProductZ', 3, 'Houston', 5);
insert into project values('Computerization', 10, 'Stafford', 4);
insert into project values('Reorganization', 20, 'Houston', 1);
insert into project values('Newbenefits', 30, 'Stafford', 4);

insert into employee values('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
insert into employee values('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);
insert into employee values('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);
insert into employee values('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);
insert into employee values('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);
insert into employee values('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);
insert into employee values('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);
insert into employee values('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice Houston, TX', 'F', 25000, 333445555, 5);

insert into dependent values(333445555, 'Alice', 'F', '1986-04-05', 'Daughter');
insert into dependent values(333445555, 'Theodore', 'M', '1983-10-25', 'Son');
insert into dependent values(333445555, 'Joy', 'F', '1958-05-03', 'Spouse');
insert into dependent values(987654321, 'Abner', 'M', '1942-02-28', 'Spouse');
insert into dependent values(123456789, 'Michael', 'M', '1988-01-04', 'Son');
insert into dependent values(123456789, 'Alice', 'F', '1988-12-30', 'Daughter');
insert into dependent values(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

insert into works_on values(123456789, 1, 32.5);
insert into works_on values(123456789, 2, 7.5);
insert into works_on values(666884444, 3, 40.0);
insert into works_on values(453453453, 1, 20.0);
insert into works_on values(453453453, 2, 20.0);
insert into works_on values(333445555, 2, 10.0);
insert into works_on values(333445555, 3, 10.0);
insert into works_on values(333445555, 10, 10.0);
insert into works_on values(333445555, 20, 10.0);
insert into works_on values(999887777, 30, 30.0);
insert into works_on values(999887777, 10, 10.0);
insert into works_on values(987987987, 10, 35.0);
insert into works_on values(987987987, 30, 5.0);
insert into works_on values(987654321, 30, 20.0);
insert into works_on values(987654321, 20, 15.0);
insert into works_on values(888665555, 20, NULL);
