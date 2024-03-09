create table department_data(
	department_id Number(5) primary key not null,
	department_name character(50) not null,
	location Character(50) not null
);


insert into department_data values(1,'Management','London');
insert into department_data values(2,'Engineering','Cardiff');
insert into department_data values(3,'Research & Developement','Edinburgh');
insert into department_data values(4,'Sales','Belfast');


create table employee_data(
	employee_id Number(10) primary key not null,
	employee_name Character(50) not null,
	job_title Character(50) not null,
	manager_id Number(10) null,
	date_hired date not null,
	salary Number(10) not null,
	department_id Number(5) not null,
	foreign key (department_id) references department_data(department_id)
);

insert into employee_data values(90001,'John Smith','CEO',null,'01-Jan-95',100000,1);
insert into employee_data values(90002,'Jimmy Willis','Manager',90001,'23-Sep-03',52500,4);
insert into employee_data values(90003,'Roxy Jones','Salesperson',90002,'11-Feb-17',35000,4);
insert into employee_data values(90004,'Selwyn Field','Salesperson',90003,'20-May-15',32000,4);
insert into employee_data values(90005,'David Hallett','Engineer',90006,'17-Apr-18',40000,2);
insert into employee_data values(90006,'Sarah Phelps','Manager',90001,'21-Mar-15',45000,2);
insert into employee_data values(90007,'Louise Harper','Engineer',90006,'01-Jan-13',47000,2);
insert into employee_data values(90008,'Tima Hart','Engineer',90009,'28-Jul-14',45000,3);
insert into employee_data values(90009,'Gus Jones','Manager',90001,'15-May-18',50000,3);
insert into employee_data values(90010,'Mildred Hall','Secretary',90001,'12-Oct-96',35000,1);

select * from employee_data;
select * from department_data;
