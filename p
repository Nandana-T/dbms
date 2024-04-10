 PROCEDURES
SET SERVEROUTPUT ON;

--1)
--DECLARE
--    message varchar(20):='hello, world!';
--BEGIN
--    dbms_output.put_line(message);
--END;
--/



--2)
--DECLARE
--    SUBTYPE name is char(10);
--    SUBTYPE message is varchar(50);
--    salutation name;
--    greetings message;
--BEGIN
--    salutation := 'Reader';
--    greetings := 'welcome to PL/SQL programming!';
--    dbms_output.put_line('Hello ' || salutation || greetings);
--END;
--/



--3)
--BEGIN
--    dbms_output.put_line(10 + 5);
--END;
--/



--4)
--CREATE TABLE CUSTOMERS_SAMPLE
--(
--    ID INT NOT NULL,
--    NAME VARCHAR (20) NOT NULL,
--    AGE INT NOT NULL,
--    ADDRESS CHAR (25),
--    SALARY DECIMAL (18, 2),
--    PRIMARY KEY (ID)
--);
--
--INSERT INTO CUSTOMERS_SAMPLE (ID,NAME,AGE,ADDRESS,SALARY)
--VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );
--INSERT INTO CUSTOMERS_SAMPLE (ID,NAME,AGE,ADDRESS,SALARY)
--VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );
--INSERT INTO CUSTOMERS_SAMPLE (ID,NAME,AGE,ADDRESS,SALARY)
--VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
--INSERT INTO CUSTOMERS_SAMPLE (ID,NAME,AGE,ADDRESS,SALARY)
--VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 );
--INSERT INTO CUSTOMERS_SAMPLE (ID,NAME,AGE,ADDRESS,SALARY)
--VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );
--INSERT INTO CUSTOMERS_SAMPLE (ID,NAME,AGE,ADDRESS,SALARY)
--VALUES (6, 'Komal', 22, 'MP', 4500.00 );

--DECLARE
--    c_id customers_sample.id%type := 1;
--    c_name customers_sample.name%type;
--    c_age customers_sample.age%type;
--    c_addr customers_sample.address%type;
--    c_sal customers_sample.salary%type;
--
--BEGIN
--    select name,age,address,salary into c_name, c_age, c_addr, c_sal
--    from customers_sample
--    where id = c_id;
--
--    dbms_output.put_line
--    ('customer ' || c_name || ' who is ' || c_age || 'yrs old and
from ' || c_addr || ' earns ' || c_sal || ' rupees' );
--
--END;
--/



--5)
--DECLARE
--    a number := 15;
--    b number := 4;
--    c number := 10;
--BEGIN
--    if ( a < b ) and ( a < c ) then
--        dbms_output.put_line ( a || ' is the samllest');
--    elsif ( b < c ) then
--        dbms_output.put_line ( b || ' is the smallest');
--    else
--        dbms_output.put_line ( c || ' is the smallest');
--    end if;
--END;
--/



--6)
--DECLARE
--    PROCEDURE compare (value varchar, pattern varchar) is
--    BEGIN
--        IF value LIKE pattern THEN
--            dbms_output.put_line ('True - pattern matches');
--        ELSE
--            dbms_output.put_line ('False - pattern does not match');
--        END IF;
--    END;
--
--BEGIN
--    compare('Zara Ali', 'Z%A_i');
--    compare('Nuha Ali', 'Z%A_i');
--END;
--/



--7)
--DECLARE
--    n INT := &n;
--BEGIN
--    if (n between 10 and 20) then
--        dbms_output.put_line('Yes');
--    else
--        dbms_output.put_line('No');
--    end if;
--END;
--/



--8)
--DECLARE
--    c_id customers_sample.id%type := &c_id;
--    c_sal customers_sample.salary%type;
--BEGIN
--    select salary into c_sal
--    from customers_sample
--    where id = c_id;
--
--    if ( c_sal < 2000 ) then
--        update customers_sample
--        set salary = salary + 1000 where id=c_id;
--        dbms_output.put_line('Salary Updated!');
--    end if;
--END;
--/



--9)
--DECLARE
--    i number(3);
--    j number(3);
--BEGIN
--    i := 2;
--    LOOP
--        j := 2;
--        LOOP
--            exit when ((mod(i,j)=0) or (j=i));
--            j := j+1;
--        END LOOP;
--    if ( j = i ) then
--        dbms_output.put_line( i || ' is prime');
--    end if;
--    i := i+1;
--    exit when i=50;
--    end loop;
--END;
--/



--10) / 11)
--CREATE OR REPLACE PROCEDURE findmin(x IN number, y IN number, z IN
number, a OUT number) IS
--BEGIN
--    a := least(x,y,z);
--END;
--/
----execute(create) the procedure first then execute the query below!
--DECLARE
--    x number := &x;
--    y number := &y;
--    z number := &z;
--    a number;
--BEGIN
--    findmin(x,y,z,a);
--    dbms_output.put_line('Minimum is ' || a);
--END;
--/
--(OR)--
--DECLARE
--    a number := &a;
--    b number := &b;
--    c number := &c;
--    d number;
--
--PROCEDURE findMin(a IN number, b IN number, c IN number, d OUT number) IS
--BEGIN
--    d := least(a,b,c);
--END;
--
--BEGIN
--    findMin(a, b, c, d);
--    dbms_output.put_line(' Minimum : ' || d);
--    END;
--/



--12)
--CREATE OR REPLACE PROCEDURE square(x IN OUT number) IS
--BEGIN
--    x := x*x;
--END;
--/
----execute(create) the procedure first then execute the query below!
--DECLARE
--    x number := &x;
--BEGIN
--    square(x);
--    dbms_output.put_line('Square is ' || x);
--END;
--/



--13)
--CREATE OR REPLACE FUNCTION total_customers
--RETURN number IS
--    total number := 0;
--BEGIN
--    select count(*) into total
--    from customers_sample;
--
--    return total;
--END;
--/
--
--DECLARE
--    c number(2);
--BEGIN
--    c := total_customers();
--    dbms_output.put_line( 'Total no. of customers: '|| c );
--END;
--/



--14)
--CREATE OR REPLACE FUNCTION find_Min(x IN number, y IN number)
--RETURN number IS
--    z number;
--BEGIN
--    z := least(x,y);
--    return z;
--END;
--/
--DECLARE
--    x number := &x;
--    y number := &y;
--    z number;
--BEGIN
--    z := find_Min(x,y);
--    dbms_output.put_line('Min is ' || z);
--END;
--/



--15)
--CREATE OR REPLACE FUNCTION factorial(x IN number)
--RETURN number is
--    f number;
--BEGIN
--    IF x=0 THEN
--        f := 1;
--    ELSE
--        f := x*factorial(x-1);
--    END IF;
--    return f;
--END;
--/
--DECLARE
--    x int := &x;
--    f number;
--BEGIN
--    f := factorial(x);
--    dbms_output.put_line('Factorial of ' || x || ': ' || f);
--END;
--/



--16)
--create table country
--(
--    country_id int,
--    country_name varchar(15)
--);
--insert into country values (19, 'China');
--insert into country values (24, 'India');
--insert into country values (9, 'Indonesia');
--insert into country values (37, 'Iran');
--select * from country;

--DECLARE
--    c_name country.country_name%type;
--
--    CURSOR c_country is
--        select country_name from country
--        where country_name like 'I%';
--
--BEGIN
--    OPEN c_country;
--    LOOP
--        FETCH c_country into c_name;
--        EXIT WHEN c_country%notfound;
--
--        dbms_output.put_line(c_name);
--    END LOOP;
--    CLOSE c_country;
--END;
--/



--17)
--create table event
--(
--    event_id int,
--    event_name varchar(30),
--    event_details varchar(70),
--    event_date date
--);
--insert into event values(8, 'Hiroshima', 'The United States dropped
an atomic bomb on the..', TO_DATE('06-08-1945', 'DD-MM-YYYY'));
--insert into event values(20, 'Premier League starts', 'The first
season ended(as it did 11 times subsequent..', TO_DATE('15-08-1992',
'DD-MM-YYYY'));
--insert into event values(22, 'Coup attempt in Russia', 'The 1991
Soviet coup of etat attempt, also known as..', TO_DATE('19-08-1991',
'DD-MM-YYYY'));
--insert into event values(83, 'Slavery abolished', 'The disgrace of
slavery was officially abolished on the..', TO_DATE('01-08-1834',
'DD-MM-YYYY'));
--insert into event values(98, 'The Economist launched', 'The bible of
absolute truth on earth was launched on..', TO_DATE('05-08-1843',
'DD-MM-YYYY'));
--select * from event;
--
--DECLARE
--    e_id event.event_id%type;
--    e_name event.event_name%type;
--    e_details event.event_details%type;
--    e_date event.event_date%type;
--
--    CURSOR  c_event is
--        select event_id, event_name, event_details, event_date from event
--        where EXTRACT(MONTH from event_date)=8;
--
--BEGIN
--    open c_event;
--    LOOP
--        FETCH c_event into e_id, e_name, e_details, e_date;
--        EXIT WHEN c_event%notfound;
--
--        dbms_output.put_line(e_id || '  ' || e_name || '  ' ||
e_details || '  ' || e_date);
--    END LOOP;
--    close c_event;
--END;
--/
