-- Active: 1671169905875@@127.0.0.1@5432@sql_learning@public


-- Aggregate functionlarni biz GROOUP BY bilan yoki u siz ham ishllata olamiz.
-- Aggregate functionlarni biz GROUP BY siz ham ishlatilganda biz tableni boshqa columnlarini to'g'ridan to'g'ri ola olmaymiz.
-- Bunday holatni biz SubQuerylardan foydalanib hall qilishimiz mumkin
-- Aggregate functionlarni GROUP BY bilan ishlatganimizda esa SELECT listida faqat GROUp By da ishlatilgan ustunni , Aggregate funksiyallarni va Constantalardan foydalanishimiz mumkin.


-- Aggregation funcsiyallar nomi || Izox
-- AVG(expression)        | | Expression qaytargan qiymmatni o'rtacha miqdorini qaytaradi 

-- SUM(expression)	      | | Expression qaytargan qiymatni yig'indisini qaytaradi

-- MIN(expression)	      | | Expression qaytargan barcha qiymatlarning eng kichkinasini qaytaradi

-- MAX(expression)	      | | Expression qaytargan barcha qiymatlarning eng kattasini qaytaradi

-- COUNT(*)               | | Query qaytargan barcha recordlarni sonini qaytaradi

-- COUNT(expression)      | | Expression null bo'lmagan recordlarning sonini qaytaradi

-- COUNT(distinct column) | | Ustundagi  unique(takrorlanmas) qiymatlarni sonini qaytaradi


DROP TABLE IF EXISTS apple;
CREATE TABLE IF NOT EXISTS apple(
    year int,
    apple_variety VARCHAR, 
    number_of_trees_in_production INT,
    tons_produced FLOAT,
    harvest_day DATE,
    price_per_ton FLOAT,
    first_summer_storm DATE
);
INSERT INTO apple (year, apple_variety, number_of_trees_in_production, tons_produced, harvest_day, price_per_ton, first_summer_storm) 
VALUES (2020,	'Red Delicious',	2000,	102	,'23.06.2020'	,54.50,	'03.07.2020');

INSERT INTO apple (year, apple_variety, number_of_trees_in_production, tons_produced, harvest_day, price_per_ton, first_summer_storm) 
VALUES (2020,	'Magic Green',	700,	33	,'12.06.2020'	,62.60	,	'03.07.2020');

INSERT INTO apple (year, apple_variety, number_of_trees_in_production, tons_produced, harvest_day, price_per_ton, first_summer_storm) 
VALUES (2020,	'Red Globus',	500,	26	,'30.05.2020'	,71.50	,	'03.07.2020');

INSERT INTO apple (year, apple_variety, number_of_trees_in_production, tons_produced, harvest_day, price_per_ton, first_summer_storm) 
VALUES (2019,	'Red Delicious',	1800,	87	,'15.07.2019'	,52.25	,	'12.07.2019');


INSERT INTO apple (year, apple_variety, number_of_trees_in_production, tons_produced, harvest_day, price_per_ton, first_summer_storm) 
VALUES (2019,	'Magic Green',	500,	26	,'28.06.2019'	,59.40	,	'12.07.2019');

INSERT INTO apple (year, apple_variety, number_of_trees_in_production, tons_produced, harvest_day, price_per_ton, first_summer_storm) 
VALUES (2019,	'Red Globus',	500,	27	,'28.05.2019'	,68.00	,	'12.07.2019');

INSERT INTO
    apple (
        year,
        apple_variety,
        number_of_trees_in_production,
        tons_produced,
        harvest_day,
        price_per_ton,
        first_summer_storm
    )
VALUES (
        2018,
        'Red Delicious',
        1800,
        92,
        '2018-02-07',
        56.75,
        '2018-03-06'
    );

INSERT INTO
    apple (
        year,
        apple_variety,
        number_of_trees_in_production,
        tons_produced,
        harvest_day,
        price_per_ton,
        first_summer_storm
    )
VALUES (
        2018,
        'Red Globus',
        500,
        24,
        '2018-05-30',
        66.00,
        '2018-03-06'
    );

INSERT INTO
    apple (
        year,
        apple_variety,
        number_of_trees_in_production,
        tons_produced,
        harvest_day,
        price_per_ton,
        first_summer_storm
    )
VALUES (
        2017,
        'Red Delicious',
        1500,
        76.5,
        '2017-07-18',
        51.45,
        '2017-07-30'
    );

INSERT INTO
    apple (
        year,
        apple_variety,
        number_of_trees_in_production,
        tons_produced,
        harvest_day,
        price_per_ton,
        first_summer_storm
    )
VALUES (
        2016,
        'Red Delicious',
        1500,
        72,
        '2016-06-26',
        47.60,
        '2016-06-23'
    );
SELECT SUM(tons_produced) AS "Total_produced_all_years"
FROM    apple;

-- Sub query bilan ishlatish
SELECT * , (SELECT SUM(tons_produced) from apple) AS "Total_produced_all_years"
FROM    apple;

-- Bunday holatda bizga error qaytaradi
SELECT * , SUM(tons_produced) AS "Total_produced_all_years"
FROM    apple;

-- Count ni ishlatish
SELECT COUNT(*) AS "Years_producing_Red_Globus"
FROM    apple
WHERE apple_variety = 'Red Globus';

-- Aggragate funcsiyalarni ischida turli hil matematik amallardan foydalanish (Councat funcsiyasi bu birnechta qiymatlarni bir biriga ulab beradi - concatination)
SELECT  SUM(tons_produced) AS "Total_produced_all_years",
        concat('$ ',SUM(tons_produced * price_per_ton)) AS "Income_Revenue_all_years"
FROM  apple;

-- Aggregate funksiyalarni WHERE sharti bilan ishlatish
SELECT apple_variety,
       AVG(price_per_ton) AS "Average_price",
       MAX(price_per_ton) AS "Max_price",
       MIN(price_per_ton) AS "Min_price"
FROM   apple
WHERE  year >= 2010
GROUP BY apple_variety;


-- COUNT ni DISTINK bilan ishlatish . DISTINC bizga ustunning qiymatlarini unique (takrrlanmaydigan) holatda qaytaradi.
SELECT COUNT(DISTINCT year) AS "years harvesting before summer storms"
FROM   apple
WHERE  harvest_day < first_summer_storm