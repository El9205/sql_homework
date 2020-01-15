use vk;

 -- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
 
SELECT distinct firstname FROM users
order by firstname;

/*iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
 * При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0)
 * 
 */

-- alter table profiles add is_active bool default false;  - оставляю здесь, как подтверждение добавления поля.

update profiles
set 
	is_active = true
where (select year(curdate())-year(birthday))<18; 


-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
delete from messages
where created_at<(select now());



