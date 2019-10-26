SELECT
  pq.id,
  pq.title,
  pq.accepted_answer_id,
  pq.answer_count,
  pq.creation_date AS question_date,
  pq.favorite_count question_fav_count,
  pq.owner_display_name,
  pq.owner_user_id,
  pq.score,
  pq.view_count,
  pq.tags,
  pa.creation_date AS answer_date,
  EXTRACT(YEAR FROM pq.creation_date) date_year,
  EXTRACT(WEEK FROM pq.creation_date) date_week,
  EXTRACT(HOUR FROM pq.creation_date) date_hour,
  IF(pq.answer_count > 0,1,0) as has_answers,
  if(pq.accepted_answer_id is not null, 1,0) as has_accepted,
  TIMESTAMP_DIFF(pa.creation_date, pq.creation_date, HOUR) time_to_answer
FROM
  `bigquery-public-data.stackoverflow.posts_questions` AS pq
LEFT JOIN
  `bigquery-public-data.stackoverflow.posts_answers` AS pa
ON
  pq.accepted_answer_id = pa.id