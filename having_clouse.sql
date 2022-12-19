-- Active: 1671169905875@@127.0.0.1@5432@sql_learning@public

-- SQL da HAVING bu GROUP BY bandining bir qismi bo'lib u GROUp BY orqali GURUHLANGAN recordlarni filter qilish uchun ishlatiladi. 
-- HAVING ni WHERE dan farqi shundaki biz HAVING bilan filterlaganimizda aggregate funksiyalardan foydalana olamiz


-- GROUP BY mavzusida yaratgan apple table imizdan foydalanib having ni ishlatish uchun misol ko'ramiz.
SELECT year,
       SUM(tons_produced) AS Total_apple_produced
FROM   apple
WHERE year > 2017
GROUP  BY year
HAVING SUM ( tons_produced ) > 100