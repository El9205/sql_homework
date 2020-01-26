/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
который больше всех общался с нашим пользователем.*/

select count(*), from_user_id, to_user_id from messages
where to_user_id = 1  and (from_user_id in (SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved' -- Р�Р” РґСЂСѓР·РµР№, Р·Р°СЏРІРєСѓ РєРѕС‚РѕСЂС‹С… СЏ РїРѕРґС‚РІРµСЂРґРёР»
  union
  SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved'))
group by from_user_id
order by count(*) desc
limit 1

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

select count(*), media_id from likes l
where media_id in (select id from media m where user_id in (select user_id from profiles p
where (select year(curdate())-year(birthday))<10))

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select count(*), 'male' from likes l
where media_id in (select id from media m where user_id in (select user_id from profiles p
where gender = 'm'))
union
select count(*), 'fmale' from likes l
where media_id in (select id from media m where user_id in (select user_id from profiles p
where gender = 'f'))


