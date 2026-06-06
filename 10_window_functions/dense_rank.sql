


-- DENSE_RANK(). WINDOW FUNCTION 



-- give the ranking but it does not skip the ranke 

SELECT 
  name,
  marks,
  DENSE_RANK() OVER (ORDER BY marks DESC) AS dense_rank
FROM students;

-- | name  | marks | dense_rank |
-- | ----- | ----: | ---------: |
-- | Rahul |    95 |          1 |
-- | Aman  |    90 |          2 |
-- | Ravi  |    90 |          2 |
-- | Mohan |    85 |          3 |




-- Difference b/w rank vs dense_rank

-- | marks | RANK | DENSE_RANK |
-- | ----: | ---: | ---------: |
-- |    95 |    1 |          1 |
-- |    90 |    2 |          2 |
-- |    90 |    2 |          2 |
-- |    85 |    4 |          3 |
