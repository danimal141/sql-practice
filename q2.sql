WITH age_groups AS (
    SELECT
        CASE
            WHEN substr(date(), 1, 4) - birth BETWEEN 10 AND 19 THEN '10代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 20 AND 29 THEN '20代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 30 AND 39 THEN '30代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 40 AND 49 THEN '40代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 50 AND 59 THEN '50代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 60 AND 69 THEN '60代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 70 AND 79 THEN '70代'
            WHEN substr(date(), 1, 4) - birth  BETWEEN 80 AND 89 THEN '80代'
        ELSE 'その他'
        END AS era
    FROM users
    WHERE is_deleted = 0
)

SELECT
    era,
    COUNT(*)
FROM age_groups
GROUP BY era
ORDER BY era
