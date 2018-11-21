SELECT title, count(title) AS count,
       MIN(salary) AS min, MAX(salary) AS max, AVG(salary) AS avg
  FROM demo.salary
 WHERE orgType = 'LBOE'
   AND year = 2010
 GROUP BY title;