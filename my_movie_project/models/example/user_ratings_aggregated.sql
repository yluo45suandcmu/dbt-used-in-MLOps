-- models/user_ratings_aggregated.sql

WITH user_info AS (
    SELECT *
    FROM {{ ref('user_information') }}
),
user_ratings AS (
    SELECT *
    FROM {{ ref('user_rating_data') }}
)

SELECT
    ui.user_id,
    ui.age,
    ui.occupation,
    ui.gender,
    ur.TimeStamp,
    ur.UserID,
    ur.Title,
    ur.Rating
FROM user_info ui
JOIN user_ratings ur ON ui.user_id = ur.UserID
