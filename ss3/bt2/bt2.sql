CREATE TABLE customers(
cid INT PRIMARY KEY AUTO_INCREMENT,
cName VARCHAR(255),
cAge INT
);

CREATE TABLE orders(
oId INT PRIMARY KEY AUTO_INCREMENT,
cId INT NOT NULL,
FOREIGN KEY (cId) REFERENCES customers(cid),
oDate DATETIME ,
oTotalPrice DOUBLE
);

CREATE TABLE products(
pId INT PRIMARY KEY AUTO_INCREMENT,
pName VARCHAR(255),
pPrice DOUBLE
);

CREATE TABLE orderDetail(
oId INT,
FOREIGN KEY (oId) REFERENCES orders(oId),
pId INT,
FOREIGN KEY (pId) REFERENCES products(pId),
odQuantity INT
);

insert into customers values (1,'Minh Quan',10),(2,'Ngoc Anh',20),(3,'Hong Ha',50);
insert into orders values (1,1,'2006-03-21 00:00:00',150000),(2,2,'2006-03-23 00:00:00',200000),(3,1,'2006-03-16 00:00:00',170000);
insert into products values (1,'May giat', 300),(2,'Tu lanh',500),(3,'Dieu hoa',700),(4,'Quat',100),(5,'Bep dien',200),(6,'May hut mui',500);
insert into orderDetail values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select oId,oDate,oTotalPrice from orders;
select customers.cName,products.pName from customers join orders on customers.cid = orders.cId
join orderDetail on orderDetail.oId = orders.oId
join products on orderDetail.pId = products.pId;

select customers.cName from customers 
where cid not in (select cid from orders);

select orders.oId,orders.oDate,sum(orderDetail.odQuantity * products.pPrice)
from orders join orderDetail on orders.oId = orderDetail.oId
join products on orderDetail.pId = products.pId
group by orders.oId,orders.oDate;