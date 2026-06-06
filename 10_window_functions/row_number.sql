



--- ROW_NUMBER(). Window function 

-- give   a unique  number in every row 
-- Even two value are same , numbers will be different 

SELECT 
  name,
  marks,
  ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_no
FROM students;

-- | name  | marks | row_no |
-- | ----- | ----: | -----: |
-- | Rahul |    95 |      1 |
-- | Aman  |    90 |      2 |
-- | Ravi  |    90 |      3 |
