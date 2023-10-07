/*1.查询课程表中的课程号和课程名称。*/
select cid,cname
from C
/*2.查询学生表中的全体学生记录。*/
select *
from S
/*3.查询学生表的全体学生的姓名和入校年份。*/
select sname,entrydate
from S
/*
4.查询学生表中全体学生的姓名及入校年份，为无标题列加标题。
*/
select sname "姓名",entrydate "入校年份"
from S
/*
5.查询学生表中全体学生的姓名、性别及出生年份，添加标题为birth*/
select sname "姓名",sex "性别", birthday "birth"
from S
/*
6.查询选修了课程的学生学号。*/
select sid
from sc
group by Sid
/*
7.查询教师表中的前3条记录。*/
select top 3 * from T
/*
8.查询课程表中的前30%的记录。*/
select top 30 PERCENT * from C
/*
9.查询工龄小或等于35年的教师信息。*/
select * 
from T
where datediff(yy,worktime,GETDATE())<35
/*
10.查询工作时间在1990-2003年的教师编号、姓名和工作时间。*/
select Tid,name,worktime
from T
where (datepart(yy,T.worktime)) between 1990 and 2003
/*
11.查询系别为计算机系、软件的教师。
*/
select *
from T
where T.department in ('计算机系','软件')

/*
12.查询学生表中姓刘的学生的信息。
*/
select *
from S
where sname like '刘%'
/*
13.查询课程表的“C语言”的课程号。
*/
select cid
from c
where cname ='c语言'
/*
14.查询选课表中没有得分的考生号。
*/
select sid
from SC
where score is null
/*
15.查询男教师的基本信息，按职称降序排列。
*/
select *
from T
order by title desc
/*
16.查询教师表中信息，按职称降序排序，工作时间升序排序。
*/
select *
from T
order by title desc,worktime asc
/*
17.查询学生表中学生总数。
*/
select count(*) '学生总数'
from s

/*
18.查询学生的平均年龄。
*/
select AVG(age) '学生平均年龄'
from S
/*
19.查询选课表中，单门课程选课人数3人以上的各个课程号和相应的选课人数。
*/
select cid,count(sid) "StuNum"
from SC
group by Cid
having count(sid)>3
/*
20.创建选课表的一个副本。
*/
select *
into sc2
from sc
/*
21.查询姓张或姓刘的学生信息，按姓名排序。
*/
select *
from S
where sname in('张%','刘%')
order by sname
/*
22.查询选课表中每个学生的总分数，并按分数降序排序。
*/
select Sid,sum(score) "score"
from SC
group by Sid
order by sum(score) desc
/*
23.查询列表中使用系统函数(显示学生的学号、姓名、性别、入学年份、年级(学号前4位)、班级(学号第5-6))
*/
select sid,sname,sex,datepart(yy,entrydate) 'EntryYear',SUBSTRING(sid,1,4) 'Grade',SUBSTRING(sid,5,2) 'Class'
from S
/*
24. 查询所有张，王，李，赵姓的教师信息
*/
select *
from T
where name like '张%' or name like '王%' or name like '李%' or name like '赵%'

/*
25.查询db_课程信息，(默认为通配符，这里 用escape)
*/
select *
from C
where cname like 'db_' escape'_'