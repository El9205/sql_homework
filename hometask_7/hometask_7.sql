-- ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.

select user_id default from orders o
where user_id is not null

-- �������� ������ ������� products � �������� catalogs, ������� ������������� ������.


select id, name, (select name from catalogs where id=catalog_id) as catalog_name from products p;

/*(�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). 
���� from, to � label �������� ���������� �������� �������, ���� name � �������. 
�������� ������ ������ flights � �������� ���������� �������.*/

select id, (select name from cities where lable = f.`from`), (select name from cities where lable = f.`to`) from flights f
