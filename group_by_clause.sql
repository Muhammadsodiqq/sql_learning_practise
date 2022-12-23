-- Active: 1671798586429@@127.0.0.1@5432@sql_learning@public

-- GROUP BY {{column}} - bu ushbu {{column}} 'bo\'yicha' gruppalangan holda olib kelib beradi. 
-- GROUP BY ni ishlatganimizda biz SELECT listda Aggregate functionallardan ham foydalana olamiz. 
-- Aggregate functionlarni biz GROUP BY siz ham ishlatishimiz mumkin lekin u holda biz tableni boshqa columnlarini to'g'ridan to'g'ri ola olmaymiz.
-- Bunday holatni biz SubQuerylardan foydalanib hall qilishimiz mumkin
-- GROUP BY ni ishlatganimizda biz SELECT listida faqat GROUP By da foydalangan columnlarni , aggregate functionlarni va constantalarni olishimiz mumkin. 
-- Boshqa Columnlarga murojaat qilish muammosini esa WINDOW FUNCTIONS bilan hal qila olamiz

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

SELECT year,
      SUM(tons_produced) AS Total_apple_produced
FROM  apple 
GROUP BY year;

SELECT  year, AVG(price_per_ton) as avg_price_ton
FROM apple 
WHERE extract(MONTH from  first_summer_storm) = 7
GROUP BY year ORDER BY year DESC;


SELECT apple_variety,
    AVG ((tons_produced * price_per_ton/number_of_trees_in_production)) as avg_dollar_per_tree,
    MAX ((tons_produced * price_per_ton/number_of_trees_in_production)) as max_dollar_per_tree,
    MIN ((tons_produced * price_per_ton/number_of_trees_in_production)) as min_dollar_per_tree
FROM apple
GROUP BY apple_variety;
;
