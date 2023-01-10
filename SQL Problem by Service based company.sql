drop table if exists car_travels;
CREATE TABLE car_travels
(CARS  VARCHAR(40),
DAYS VARCHAR(10),
CUMULATIVE_DISTANCE INT )
INSERT INTO car_travels  VALUES ('Car1','Day1',50);
INSERT INTO car_travels  VALUES ('Car1','Day2',100);
INSERT INTO car_travels  VALUES ('Car1','Day3',200);
INSERT INTO car_travels  VALUES ('Car2','Day1',0);
INSERT INTO car_travels  VALUES ('Car3','Day1',0);
INSERT INTO car_travels  VALUES ('Car3','Day2',50);
INSERT INTO car_travels  VALUES ('Car3','Day3',50);
INSERT INTO car_travels  VALUES ('Car3','Day4',100);

SELECT CARS,DAYS
,(CUMULATIVE_DISTANCE
-LAG (CUMULATIVE_DISTANCE,1,0) 
OVER(PARTITION BY CARS ORDER BY DAYS)) AS DISTANCE_TRAVELLED_PER_DAY
FROM car_travels;