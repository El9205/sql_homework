use vk;

 -- ii. �������� ������, ������������ ������ ���� (������ firstname) ������������� ��� ���������� � ���������� �������
 
SELECT distinct firstname FROM users
order by firstname;

/*iii. �������� ������, ���������� ������������������ ������������� ��� ���������� (���� is_active = true). 
 * ��� ������������� �������������� �������� ����� ���� � ������� profiles �� ��������� �� ��������� = false (��� 0)
 * 
 */

-- alter table profiles add is_active bool default false;  - �������� �����, ��� ������������� ���������� ����.

update profiles
set 
	is_active = true
where (select year(curdate())-year(birthday))<18; 


-- iv. �������� ������, ��������� ��������� ��� �������� (���� ����� �����������)
delete from messages
where created_at<(select now());



