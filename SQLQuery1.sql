/*1.��ѯ�γ̱��еĿγ̺źͿγ����ơ�*/
select cid,cname
from C
/*2.��ѯѧ�����е�ȫ��ѧ����¼��*/
select *
from S
/*3.��ѯѧ�����ȫ��ѧ������������У��ݡ�*/
select sname,entrydate
from S
/*
4.��ѯѧ������ȫ��ѧ������������У��ݣ�Ϊ�ޱ����мӱ��⡣
*/
select sname "����",entrydate "��У���"
from S
/*
5.��ѯѧ������ȫ��ѧ�����������Ա𼰳�����ݣ���ӱ���Ϊbirth*/
select sname "����",sex "�Ա�", birthday "birth"
from S
/*
6.��ѯѡ���˿γ̵�ѧ��ѧ�š�*/
select sid
from sc
group by Sid
/*
7.��ѯ��ʦ���е�ǰ3����¼��*/
select top 3 * from T
/*
8.��ѯ�γ̱��е�ǰ30%�ļ�¼��*/
select top 30 PERCENT * from C
/*
9.��ѯ����С�����35��Ľ�ʦ��Ϣ��*/
select * 
from T
where datediff(yy,worktime,GETDATE())<35
/*
10.��ѯ����ʱ����1990-2003��Ľ�ʦ��š������͹���ʱ�䡣*/
select Tid,name,worktime
from T
where (datepart(yy,T.worktime)) between 1990 and 2003
/*
11.��ѯϵ��Ϊ�����ϵ������Ľ�ʦ��
*/
select *
from T
where T.department in ('�����ϵ','���')

/*
12.��ѯѧ������������ѧ������Ϣ��
*/
select *
from S
where sname like '��%'
/*
13.��ѯ�γ̱�ġ�C���ԡ��Ŀγ̺š�
*/
select cid
from c
where cname ='c����'
/*
14.��ѯѡ�α���û�е÷ֵĿ����š�
*/
select sid
from SC
where score is null
/*
15.��ѯ�н�ʦ�Ļ�����Ϣ����ְ�ƽ������С�
*/
select *
from T
order by title desc
/*
16.��ѯ��ʦ������Ϣ����ְ�ƽ������򣬹���ʱ����������
*/
select *
from T
order by title desc,worktime asc
/*
17.��ѯѧ������ѧ��������
*/
select count(*) 'ѧ������'
from s

/*
18.��ѯѧ����ƽ�����䡣
*/
select AVG(age) 'ѧ��ƽ������'
from S
/*
19.��ѯѡ�α��У����ſγ�ѡ������3�����ϵĸ����γ̺ź���Ӧ��ѡ��������
*/
select cid,count(sid) "StuNum"
from SC
group by Cid
having count(sid)>3
/*
20.����ѡ�α��һ��������
*/
select *
into sc2
from sc
/*
21.��ѯ���Ż�������ѧ����Ϣ������������
*/
select *
from S
where sname in('��%','��%')
order by sname
/*
22.��ѯѡ�α���ÿ��ѧ�����ܷ���������������������
*/
select Sid,sum(score) "score"
from SC
group by Sid
order by sum(score) desc
/*
23.��ѯ�б���ʹ��ϵͳ����(��ʾѧ����ѧ�š��������Ա���ѧ��ݡ��꼶(ѧ��ǰ4λ)���༶(ѧ�ŵ�5-6))
*/
select sid,sname,sex,datepart(yy,entrydate) 'EntryYear',SUBSTRING(sid,1,4) 'Grade',SUBSTRING(sid,5,2) 'Class'
from S
/*
24. ��ѯ�����ţ���������յĽ�ʦ��Ϣ
*/
select *
from T
where name like '��%' or name like '��%' or name like '��%' or name like '��%'

/*
25.��ѯdb_�γ���Ϣ��(Ĭ��Ϊͨ��������� ��escape)
*/
select *
from C
where cname like 'db_' escape'_'