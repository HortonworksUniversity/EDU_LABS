SELECT title, count(title) as count,
       MIN(salary) as min, MAX(salary) as max, AVG(salary) as avg
  FROM demo.salary
 where orgType = 'LBOE'
   and year = 2010
 group by title;