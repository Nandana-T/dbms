This trigger execute BEFORE to convert ename field lowercase to uppercase.
CREATE or REPLACE TRIGGER trg1
    BEFORE
    INSERT ON emp1
    FOR EACH ROW
BEGIN
    :new.ename := upper(:new.ename);
END;
/
Restriction to Deleting Trigger
This trigger is preventing to deleting row.
Delete Trigger Example
CREATE or REPLACE TRIGGER trg1
    AFTER
    DELETE ON emp1
    FOR EACH ROW
BEGIN
    IF :old.eno = 1 THEN
        raise_application_error(-20015, 'You can't delete this row');
    END IF;
END;
/
Delete Trigger Result
SQL>delete from emp1 where eno = 1;
Error Code: 20015
Error Name: You can't delete this row

Create a table as follows:
CREATE TABLE orders
( order_id number(5),
  quantity number(4),
  cost_per_item number(6,2),
  total_cost number(8,2),
  create_date date,
  created_by varchar2(10)
);

1.Write PL/SQL program to execute a trigger before inserting a record into the orders table, to update the date when the insertion was done and the person who inserted the record.
CREATE OR REPLACE TRIGGER orders_before_insert
BEFORE INSERT
   ON orders
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing INSERT into table
   SELECT user INTO v_username
   FROM dual;

   -- Update create_date field to current system date
   :new.create_date := sysdate;

   -- Update created_by field to the username of the person performing the INSERT
   :new.created_by := v_username;

END;

/

2.Write PL/SQL program to execute a trigger before updating a record into the orders table, to update the date when the insertion was done and the person who inserted the record.
3.CREATE OR REPLACE TRIGGER orders_before_update
4.BEFORE UPDATE
5.   ON orders
6.   FOR EACH ROW
7.
8.DECLARE
9.   v_username varchar2(10);
10.
11.BEGIN
12.
13.   -- Find username of person performing UPDATE on the table
14.   SELECT user INTO v_username
15.   FROM dual;
16.
17.   -- Update updated_date field to current system date
18.   :new.updated_date := sysdate;
19.
20.   -- Update updated_by field to the username of the person performing the UPDATE
21.   :new.updated_by := v_username;
22.
23.END;
24./
3. 
Create a table orders. After inserting or updating into orders, create a new table   (orders_audit order_id,quantity,cost_per_item,total_cost,username) and insert the same values into the order-audit table along with the user who has inserted or updated the record.

CREATE TABLE orders
( order_id number(5),
  quantity number(4),
  cost_per_item number(6,2),
  total_cost number(8,2)
);

CREATE OR REPLACE TRIGGER orders_after_insert
AFTER INSERT
   ON orders
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing the INSERT into the table
   SELECT user INTO v_username
   FROM dual;

   -- Insert record into audit table
   INSERT INTO orders_audit
   ( order_id,
     quantity,
     cost_per_item,
     total_cost,
     username )
   VALUES
   ( :new.order_id,
     :new.quantity,
     :new.cost_per_item,
     :new.total_cost,
     v_username );

END;

/

4. Create a table orders. Before deleting into orders, create a new table( order_id, quantity, cost_per_item, total_cost, delete_date, deleted_by )and insert the same values into the order-audit table along with the user and date on which the deletion has been made.
 
CREATE OR REPLACE TRIGGER orders_before_delete
BEFORE DELETE
   ON orders
   FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN

   -- Find username of person performing the DELETE on the table
   SELECT user INTO v_username
   FROM dual;

   -- Insert record into audit table
   INSERT INTO orders_audit
   ( order_id,
     quantity,
     cost_per_item,
     total_cost,
     delete_date,
     deleted_by )
   VALUES
   ( :old.order_id,
     :old.quantity,
     :old.cost_per_item,
     :old.total_cost,
      sysdate,
      v_username );

END;

/

Example
The following example illustrates the concept. This program asks for a customer ID, when the user enters an invalid ID, the exception invalid_id is raised.
DECLARE 
   c_id customers.id%type := &cc_id; 
   c_name customerS.Name%type; 
   c_addr customers.address%type;  
   -- user defined exception 
   ex_invalid_id  EXCEPTION; 
BEGIN 
   IF c_id <= 0 THEN 
      RAISE ex_invalid_id; 
   ELSE 
      SELECT  name, address INTO  c_name, c_addr 
      FROM customers 
      WHERE id = c_id;
      DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name);  
      DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr); 
   END IF; 

EXCEPTION 
   WHEN ex_invalid_id THEN 
      dbms_output.put_line('ID must be greater than zero!'); 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!');  
END; 
/
 
