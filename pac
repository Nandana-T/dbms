
--problem sheet on cursors

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
end… Read more
12:53
PACKAGE
CREATE OR REPLACE PACKAGE BODY cust_sal AS
PROCEDURE find_sal(c_id customers.id%TYPE) IS
c_sal customers.salary%TYPE;
BEGIN
SELECT salary INTO c_sal
FROM customers
WHERE id = c_id;
dbms_output.put_line('Salary: '|| c_sal);
END find_sal;
END cust_sal;
/
DECLARE
code customers.id%type := &cc_id;
BEGIN
cust_sal.find_sal(code);
END;
/

CREATE OR REPLACE PACKAGE c_package AS
-- Adds a customer
PROCEDURE addCustomer(c_id customers.id%type,
c_name customerS.No.ame%type,
c_age customers.age%type,
c_addr customers.address%type,
c_sal customers.salary%type);
-- Removes a customer
PROCEDURE delCustomer(c_id customers.id%TYPE);
--Lists all customers
PROCEDURE listCustomer;
END c_package;
/
CREATE OR REPLACE PACKAGE BODY c_package AS
PROCEDURE addCustomer(c_id cu… Read more
12:54
raw.githubusercontent.com
https://raw.githubusercontent.com/Nandana-T/dbms/main/file
raw.githubusercontent.com
curl https://raw.githubusercontent.com/Nandana-T/dbms/main/file | clip
13:08
pc - procedures and cursor
13:09
pe - package and exception
13:09
trigger
13:09
Duvarakesh
SET SERVEROUTPUT ON;


CREATE OR REPLACE PACKAGE C_PACKAGE
AS
    PROCEDURE GET_SALARY(CUST_ID IN CUSTOMERSs.ID%TYPE);
    PROCEDURE DISPLAY_CONTENTS;
    FUNCTION SQUARE_NUMBER(X INTEGER) RETURN INTEGER;
END C_PACKAGE;
/


CREATE OR REPLACE PACKAGE BODY C_PACKAGE
AS
    PROCEDURE GET_SALARY(CUST_ID IN CUSTOMERSs.ID%TYPE)
    AS
        CUST_SALARY CUSTOMERSs.SALARY%TYPE;
    BEGIN
        SELECT SALARY
            INTO CUST_SALARY
        FROM CUSTOMERSs
        WHERE ID = CUST_ID;
        DBMS_OUTPUT.PUT_LINE('The Salary of '||CUST_ID||' is '||' '||CUST_SALARY);
    END;
    
    
    PROCEDURE DISPLAY_CONTENTS
    AS
        CURSOR CUST_CURSOR IS
            SELECT *
            FROM CUSTOMERSs;
        REC CUST_CURSOR%ROWTYPE;
    BEGIN
        OPEN CUST_CURSOR;
        LOOP
            FETCH CUST_CURSOR
                INTO REC;
            EXIT WHEN CUST_CURSOR%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(REC.ID||' '||REC.NAME||' '||REC.AGE||' '||REC.ADDRESS||' '||REC.SALARY);
        END LOOP;
    END;
    
    FUNCTION SQUARE_NUMBER(X INTEGER)
    RETURN INTEGER AS
    BEGIN
        RETURN X*X;
    END;
END C_PACKAGE;
/



DECLARE
    CUST_ID CUSTOMERSs.ID%TYPE := 1;
    X INTEGER := 25;
BEGIN
    C_PACKAGE.GET_SALARY(CUST_ID);
    C_PACKAGE.DISPLAY_CONTENTS;
    X := C_PACKAGE.SQUARE_NUMBER(X);
    DBMS_OUTPUT.PUT_LINE('The Square the given number is '||X);
END;
/
