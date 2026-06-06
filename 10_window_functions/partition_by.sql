


-- PARTITION BY  window function 


-- PARTITION BY divides data into groups.

-- It works like GROUP BY, but does not reduce rows.

SELECT 
  student_name,
  shift,
  marks,
  RANK() OVER (
    PARTITION BY shift
    ORDER BY marks DESC



  ) AS shift_rank
FROM students;


-- | student | shift   | marks | shift_rank |
-- | ------- | ------- | ----: | ---------: |
-- | Rahul   | Morning |    95 |          1 |
-- | Aman    | Morning |    90 |          2 |
-- | Ravi    | Evening |    96 |          1 |
-- | Mohan   | Evening |    85 |          2 |
