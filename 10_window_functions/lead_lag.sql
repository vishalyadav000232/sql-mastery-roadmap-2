-- LAG() gives previous row value.



SELECT 
  student_id,
  payment_date,
  amount,
  LAG(amount) OVER (
    PARTITION BY student_id
    ORDER BY payment_date
  ) AS previous_payment
FROM payments;


-- | student_id | amount | previous_payment |
-- | ---------: | -----: | ---------------: |
-- |          1 |    500 |             NULL |
-- |          1 |    700 |              500 |
-- |          1 |   1000 |              700 |
-- -- 



-- LEAD()

-- LEAD() gives next row value.


SELECT 
  student_id,
  payment_date,
  amount,
  LEAD(amount) OVER (
    PARTITION BY student_id
    ORDER BY payment_date
  ) AS next_payment
FROM payments;