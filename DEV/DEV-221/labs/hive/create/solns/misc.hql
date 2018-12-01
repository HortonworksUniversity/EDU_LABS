
CREATE EXTERNAL TABLE customer_with_pk (
     cust_id int, fname string, lname string, state char(2),
     PRIMARY KEY (cust_id) )
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\t'
  STORED AS TEXTFILE
  LOCATION '/user/user1/sampledata/customer_with_pk/';
  
  
update customer set fname = 'Earl' where cust_id = 222;

delete from customer where cust_id = 222;

insert into customer values (101010101, 'Newfirst', 'Newlast', 'NC');
select * from customer where cust_id = 101010101;


insert into customer values (202020202, 'Newfirst', 'Newlast', 'NC');
insert into customer values (303030303, 'Newfirst', 'Newlast', 'NC');
select * from customer where fname = 'Newfirst';
  
  
CREATE TABLE IF NOT EXISTS managed_customer STORED AS ORC AS select * from customer;

select * from managed_customer;

drop table managed_customer;

