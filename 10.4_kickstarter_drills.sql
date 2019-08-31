  --1. Write a query that returns a list of all the unique values in the 'country' field.
  SELECT DISTINCT(country)
  FROM ksprojects;
  
  
  --2. How many unique values are there for the main_category field? What about for the category field?
  SELECT COUNT (DISTINCT main_category) AS count_maincat, COUNT(DISTINCT category)  AS count_cat
  FROM ksprojects;
  --ANSWER: 15 in main_category, 158 in category
  
   
  --3. Get a list of all the unique combinations of main_category and category fields, sorted A to Z by
  --   main_category.
  SELECT DISTINCT main_category, category
  FROM ksprojects
  ORDER BY main_category;
  
  
  --4. How many unique categories are in each main_category?
  SELECT DISTINCT main_category, COUNT(DISTINCT category)
  FROM ksprojects
  GROUP BY main_category;
  
  
  --5. Write a query that returns the average number of backers per main_category, rounded to the 
  --   nearest whole number and sorted from high to low.
  SELECT DISTINCT main_category, ROUND(AVG(backers),0) AS avg_backers
  FROM ksprojects
  GROUP BY main_category
  ORDER BY avg_backers DESC;
  
  
  --6. Write a query that shows, for each category, how many campaigns were successful and the 
  --   average difference per project between dollars pledged and the goal.
  SELECT DISTINCT category, COUNT(pledged >= goal) AS num_success, AVG(pledged - goal) AS avg_difference
  FROM ksprojects
  GROUP BY category;
  
  
  --7. Write a query that shows, for each main category, how many projects had zero backers for
  --   that category and the largest goal amount for that category (also for projects with zero backers).
  SELECT DISTINCT main_category, COUNT(backers = 0) AS num_zerobackers, MAX(goal) AS max_goal
  FROM ksprojects
  GROUP BY main_category;
  
  
  --8. For each category, find the average USD per backer, and return only those results for which the 
  --   average USD per backer is < $50, sorted high to low. 
  SELECT DISTINCT category, AVG(usd_pledged/NULLIF(backers,0)) AS avg_pledged
  FROM ksprojects
  GROUP BY category
  HAVING AVG(usd_pledged/NULLIF(backers,0)) < 50
  ORDER BY avg_pledged DESC;
  
  
  --9. Write a query that shows, for each main_category, how many successful projects had between 5 and 
  --   10 backers.
  SELECT COUNT(pledged >= goal) AS num_success, main_category
  FROM ksprojects
  WHERE backers BETWEEN 5 AND 10
  GROUP BY main_category;
  
  
  --10. Get a total of the amount ‘pledged’ for each type of currency grouped by its respective currency.
  --    Sort by ‘pledged’ from high to low.
  SELECT SUM(pledged) AS sum_pledged, currency
  FROM ksprojects
  GROUP BY currency
  ORDER BY sum_pledged DESC;
  
  
  --11. Excluding Games and Technology records in the main_category field, return the total of all backers
  --    for successful projects by main_category where the total was more than 100,000. Sort by 
  --    main_category from A to Z.
  SELECT SUM(backers) AS total_backers, main_category
  FROM ksprojects
  WHERE main_category != 'Games' AND main_category != 'Technology' AND pledged>=goal
  GROUP BY main_category
  HAVING SUM(backers)>100000
  ORDER BY main_category;
  
  
  