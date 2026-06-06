






-- RANK(). Window Function 



--= give the ranking , but if two value same it skip the next rank 


SELECT 
  name,
  marks,
  RANK() OVER (ORDER BY marks DESC) AS rank
FROM students;

-- | name  | marks | rank |
-- | ----- | ----: | ---: |
-- | Rahul |    95 |    1 |
-- | Aman  |    90 |    2 |
-- | Ravi  |    90 |    2 |
-- | Mohan |    85 |    4 |
