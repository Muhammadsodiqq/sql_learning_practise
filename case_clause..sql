-- sqlda case bu qisqacha qilib aytganda shart berish uchun ishlatiladi

CREATE TABLE people(
    name VARCHAR,
    height FLOAT, 
    weight FLOAT,
    age INT,
    smoke BOOLEAN
);
 
INSERT INTO  people(name, height, weight, age, smoke) VALUES ('John',	1.85	,92	,62	,false);
INSERT INTO  people(name, height, weight, age, smoke) VALUES ('Mary'	,1.65	,58	,35	,false);
INSERT INTO  people(name, height, weight, age, smoke) VALUES ('Peter',	1.78	,104	,54	,true);
INSERT INTO  people(name, height, weight, age, smoke) VALUES ('Sean',1.94,	89,	34,	true);
INSERT INTO  people(name, height, weight, age, smoke) VALUES ('Tim',1.68	,97,	76	,false);



SELECT name,
  CASE
    WHEN weight / height ^ 2 < 18.5 THEN 'Underweight'
    WHEN weight / height ^ 2 BETWEEN 18.5 AND 25 THEN 'Normal Weight'
    WHEN weight / height ^ 2 BETWEEN 25 AND 30 THEN 'Overweight'
    WHEN weight / height ^ 2 > 30 THEN 'Obese'
  END as status
FROM people

SELECT name
FROM people
ORDER BY CASE
    WHEN weight / height ^ 2 > 30 THEN 1
    WHEN smoke = TRUE THEN 2 
    WHEN weight / height ^ 2 BETWEEN 25 AND 30 THEN 3
    ELSE 4
END

SELECT name,
CASE
    WHEN weight / height ^ 2 > 30 THEN 1
    WHEN smoke = TRUE THEN 2 
    WHEN weight / height ^ 2 BETWEEN 25 AND 30 THEN 3
    ELSE 4
END
FROM people;