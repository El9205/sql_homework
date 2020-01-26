-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select user_id default from orders o
where user_id is not null

-- Выведите список товаров products и разделов catalogs, который соответствует товару.


select id, name, (select name from catalogs where id=catalog_id) as catalog_name from products p;

/*(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.*/

select id, (select name from cities where lable = f.`from`), (select name from cities where lable = f.`to`) from flights f
