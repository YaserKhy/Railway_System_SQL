REM   Script: Railway SQL PROJECT
REM   SQL CODE FOR RAILWAY PROJECT T5 BOOTCAMP

create table Train (    
  train_ID INT NOT NULL,    
  speed FLOAT,    
  seats_each_trailer INT,    
  number_of_trailers INT,    
  maximum_travelers INT GENERATED ALWAYS AS (seats_each_trailer * number_of_trailers),   
  primary key (train_ID)   
);

create table Station (    
    station_ID int not null,    
    station_name varchar(255),  
    primary key (station_ID)    
);

CREATE TABLE Train_Station (   
    train_ID INT,   
    station_ID INT,  
    availability varchar(255),  
    PRIMARY KEY (train_ID, station_ID),   
    FOREIGN KEY (train_ID) REFERENCES Train(train_ID),   
    FOREIGN KEY (station_ID) REFERENCES station(station_ID)   
);

CREATE TABLE Schedule (    
    trip_ID int not null,    
    departure_city varchar(255),    
    arrival_city varchar(255),    
    departure_time timestamp not null,    
    distance float not null,    
    price int not null,    
    station_ID int not null, 
    train_ID int not null,    
    primary key (trip_ID),    
    foreign key (station_ID) references station(station_ID), 
    foreign key (train_ID) references train(train_ID) 
);

create table Traveler(    
    traveler_ID int not null,    
    name varchar(255) not null,    
    phone_number varchar(255) not null unique,    
    gender varchar(255),    
    age int not null,    
    primary key (traveler_ID)    
);

create table Ticket(   
    ticket_ID int not null,   
    trip_ID int not null,   
    traveler_ID int not null,   
    primary key (ticket_ID),   
    foreign key (trip_ID) references Schedule(trip_ID),   
    foreign key (traveler_ID) references Traveler(traveler_ID)   
);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (1,210,40,5);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (2,200,45,7);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (3,170,55,6);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (4,190,35,4);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (5,250,60,6);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (6,185,45,8);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (7,190,70,7);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (8,165,60,5);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (9,220,65,4);

insert into train (train_ID,speed,seats_each_trailer,number_of_trailers) values (10,190,50,5);

insert into station (station_ID,station_name) values (1,'Riyadh');

insert into station (station_ID,station_name) values (2,'Dammam');

insert into station (station_ID,station_name) values (3,'Jeddah');

insert into station (station_ID,station_name) values (4,'Makkah');

insert into station (station_ID,station_name) values (5,'Taif');

insert into station (station_ID,station_name) values (6,'Tabuk');

insert into station (station_ID,station_name) values (7,'Qassim');

insert into station (station_ID,station_name) values (8,'Hail');

insert into station (station_ID,station_name) values (9,'Jazan');

insert into station (station_ID,station_name) values (10,'Madinah');

insert into Train_Station (train_ID,station_ID,availability) values (1,4,'Yes');

insert into Train_Station (train_ID,station_ID,availability) values (1,3,'No');

insert into Train_Station (train_ID,station_ID,availability) values (3,7,'Yes');

insert into Train_Station (train_ID,station_ID,availability) values (4,5,'Yes');

insert into Train_Station (train_ID,station_ID,availability) values (2,2,'No');

insert into Train_Station (train_ID,station_ID,availability) values (6,9,'No');

insert into Train_Station (train_ID,station_ID,availability) values (7,10,'Yes');

insert into Train_Station (train_ID,station_ID,availability) values (8,1,'No');

insert into Train_Station (train_ID,station_ID,availability) values (9,4,'Yes');

insert into Train_Station (train_ID,station_ID,availability) values (10,2,'Yes');

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (1,'Riyadh','Dammam',TIMESTAMP '2024-03-01 15:30:00',150,100,1,3);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (2,'Qassim','Jeddah',TIMESTAMP '2024-03-05 20:00:00',1000,150,7,6);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (3,'Makkah','Madinah',TIMESTAMP '2024-02-02 10:00:00',600,200,4,9);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (4,'Dammam','Riyadh',TIMESTAMP '2024-03-04 21:30:00',150,100,2,10);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (5,'Jazan','Riyadh',TIMESTAMP '2024-03-07 17:00:00',1200,300,9,5);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (6,'Madinah','Makkah',TIMESTAMP '2024-02-05 10:00:00',600,200,10,7);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (7,'Makkah','Tabuk',TIMESTAMP '2024-02-02 14:00:00',1600,300,4,1);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (8,'Taif','Jeddah',TIMESTAMP '2024-01-03 11:00:00',200,150,5,2);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (9,'Hail','Riyadh',TIMESTAMP '2024-01-18 19:00:00',1300,300,8,4);

insert into Schedule (trip_ID,departure_city,arrival_city,departure_time,distance,price,station_ID,train_ID) values (10,'Jeddah','Makkah',TIMESTAMP '2024-02-21 15:00:00',100,150,3,8);

insert into traveler values (100,'Khalid Ahmad','0512345678','Male',19);

insert into traveler values (101,'Dalal Saad','0598765432','Female',29);

insert into traveler values (102,'Salma Ali','0514725836','Female',23);

insert into traveler values (103,'Basim Fahad','0511122233','Male',32);

insert into traveler values (104,'Layla Abdullah','0515948723','Female',30);

insert into traveler values (105,'Marwa Salim','0510121021','Female',25);

insert into traveler values (106,'Rayyan Mansour','0510001101','Male',27);

insert into traveler values (107,'Mona Rashid','0511447788','Female',41);

insert into traveler values (108,'Abdullah Naser','0517776665','Male',35);

insert into traveler values (109,'Mohammad Bader','0516565655','Male',33);

insert into ticket values (1001,2,109);

insert into ticket values (1002,1,105);

insert into ticket values (1003,7,102);

insert into ticket values (1004,3,107);

insert into ticket values (1005,4,100);

insert into ticket values (1006,8,104);

insert into ticket values (1007,5,106);

insert into ticket values (1008,6,101);

insert into ticket values (1009,1,103);

insert into ticket values (1010,4,108);

select * from train;

select station_ID, station_name from station;

select * from schedule where trip_ID = 2;

select * from traveler;

select t.ticket_ID, t.trip_ID, t.traveler_ID, s.departure_city, s.arrival_city, s.departure_time, s.distance, s.price, s.station_ID, s.train_ID from ticket t join schedule s on t.trip_ID = s.trip_ID where TRUNC(s.departure_time) = DATE '2024-03-07';

select * from ticket where traveler_ID = 102;

select t.train_ID, t.station_ID, t.availability, s.trip_ID, s.departure_city, s.arrival_city, s.departure_time, s.distance, s.price from train_station t join schedule s on t.train_ID = s.train_ID where t.availability = 'Yes' AND TRUNC(s.departure_time) = DATE '2024-02-02';

select s.trip_ID, t.maximum_travelers available_seats from schedule s join train t on s.train_ID = t.train_ID order by s.trip_ID;

select trip_ID, departure_city, arrival_city from schedule;

select sum(s.price) total_revenue from ticket t join schedule s on t.trip_ID = s.trip_ID where s.departure_time BETWEEN DATE '2024-03-04' AND DATE '2024-03-08';

select AVG(speed) as Average_Speed from train;

select departure_city, count(departure_city) as Number_of_departure_trips from schedule group by departure_city;

select arrival_city, count(arrival_city) as Number_of_arrival_trips from schedule group by arrival_city;

select * from schedule order by departure_time;

select train_ID, SUM(distance) total_distance from schedule group by train_ID;

select trip_ID, count(ticket_ID) number_of_tickets from ticket group by trip_ID order by number_of_tickets DESC;

