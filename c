-problem sheet on cursors

--employee table creation
create table employee(
e_id NUMBER(6) not null,
f_nmae varchar2(25),
l_name varchar2(25),
pn varchar2(20),
h_date date,
j_id varchar2(20),
salary NUMBER(8,2),
c_pct number(2,2),
m_id number(6),
d_id number(4),
primary key(e_id)
);

--- data import to employee table

--= p1
set SERVEROUTPUT on
declare
CURSOR e is
select * from employee;
begin
for i in e loop
dbms_output.put_line('id :' ||i.e_id ||' Name :'||i.f_nmae||' '||i.l_name||' salary :'||i.salary);
end loop;
end;
/

---using procedure
set SERVEROUTPUT on
declare
procedure display is
CURSOR e is
select * from employee;
begin
for i in e loop
dbms_output.put_line('id :' ||i.e_id ||' Name :'||i.f_nmae||' '||i.l_name||' salary :'||i.salary);
end loop;
end;
begin
display;
end;
/

---p2
declare
a number := &a;
PROCEDURE changes(x in number)
is
cursor e is SELECT salary from employee
where d_id = x for update;
begin
for i in e loop
if i.salary > 90000 then
    i.salary := i.salary+i.salary*0.12;
ELSE
    i.salary := i.salary+i.salary*0.20;
end if;
update employee
set salary = i.salary
where CURRENT of e;
end loop;
end;

begin
changes(a);
end;
/

select * from employee;

--- p3
set SERVEROUTPUT on
declare
a employee.e_id%type := &a;
n employee.f_nmae%type;
nl employee.l_name%type;
begin
select f_nmae,l_name into n,nl
from employee
where e_id = a;
dbms_output.put_line(n||' '||nl);
exception
    when NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('NO RECORD FOUND');
END;
/

--p4
SET SERVEROUTPUT on
DECLARE
    x number:=&x;
    CURSOR E IS SELECT SALARY FROM EMPLOYEES
    WHERE DEPARTMENT_ID=x FOR UPDATE;
BEGIN
    FOR I IN E LOOP
        IF SALARY>=90000 THEN   
            I.SALARY:=I.SALARY+I.SALARY*0.12;
        ELSE  
            I.SALARY:=I.SALARY+I.SALARY*0.20;
        END IF;
    UPDATE EMPLOYEES
    SET SALARY=I.SALARY
    WHERE CURRENT OF E;
    END LOOP;
END;
/
