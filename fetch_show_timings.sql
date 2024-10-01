SELECT M.movie_name, S.show_time, S.screen_type
FROM Show S
JOIN Movie M ON S.movie_id = M.movie_id
JOIN Theatre T ON S.theatre_id = T.theatre_id
WHERE T.theatre_name = 'PVR: Nexus'
  AND S.show_date = '2024-04-25';
