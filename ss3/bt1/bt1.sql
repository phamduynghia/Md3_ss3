create table color(
id int primary key auto_increment,
name varchar(100),
status bit
);

create table product(
id int primary key auto_increment,
name varchar(100),
created date
);

create table size(
id int primary key auto_increment,
name varchar(100),
status bit
);

create table product_detail(
id int primary key auto_increment,
product_id int,
foreign key (product_id) references product(id),
color_id int,
foreign key (color_id) references color(id),
size_id int,
foreign key (size_id) references size(id),
price double,
stock int,
status bit
);

insert into color values(1,'red',true),(2,'blue',true),(3,'green',true);
insert into size values(1,'X',true),(2,'M',true),(3,'L',true),(4,'XL',true),(5,'XXL',true);
insert into product values(1,'Quan dai','1990-05-12'),(2,'Ao dai','2005-10-05'),(3,'Mu phot','1995-07-07');
insert into product_detail values(1,1,1,1,1200,5,True),(2,2,1,1,1500,2,True),(3,1,2,3,500,3,True),(4,1,2,3,1600,3,False),(5,3,1,4,1200,5,True),(6,3,3,5,1200,6,True);

select * from product_detail where price>1200;
select * from color;
select * from size;
select * from product_detail where id=1;

