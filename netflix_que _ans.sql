SELECT * FROM netfix_1

-- 15 Business Problems & Solutions

--1. Count the number of Movies vs TV Shows

SELECT type, COUNT (*) AS total_content
FROM netfix_1
GROUP BY type;



--2. Find the most common rating for movies and TV shows
SELECT * FROM netfix_1

SELECT type, rating,
COUNT (*)  
FROM netfix_1
GROUP BY type,rating;


--3. List all movies released in a specific year (e.g., 2020)
SELECT  title
FROM netfix_1
WHERE type = 'movies' AND release_year = 2020

--4. Find the top 5 countries with the most content on Netflix

SELECT country, COUNT(*) AS content_count
FROM netfix_1
GROUP BY country
ORDER BY content_count DESC
LIMIT 5;


--5. Identify the longest movie
SELECT * FROM netfix_1

SELECT title, duration
FROM netfix_1
ORDER BY duration DESC

--6. Find content added in the last 5 years
SELECT title, date_added
FROM netfix_1
WHERE TO_DATE(date_added, 'Month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years';



--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT * FROM netfix_1
SELECT title,director,type
FROM netfix_1
where director= 'Rajiv Chilaka' 

--8. List all TV shows with more than 5 seasons
SELECT title, type, duration
FROM netfix_1
WHERE type = 'TV Show' 
AND CAST(SUBSTRING(duration FROM '^\d+') AS INTEGER) > 5;


--9. Count the number of content items in each genre

SELECT listed_in, COUNT (*) AS content_count
FROM netfix_1
GROUP BY listed_in



--10.Find each year and the average numbers of content release in India on netflix. 
--return top 5 year with highest avg content release!

SELECT * FROM netfix_1
SELECT 
    release_year AS year,
    COUNT(*) AS total_releases,
    COUNT(*) / COUNT(DISTINCT release_year) AS avg_releases
FROM netfix_1
WHERE country = 'India'
GROUP BY release_year
ORDER BY avg_releases DESC
LIMIT 5;

--11. List all movies that are documentaries
SELECT  type , listed_in
FROM netfix_1
WHERE type = 'Movie' AND listed_in LIKE '%Documentaries%';


12. Find all content without a director
SELECT  director , listed_in
FROM netfix_1
WHERE director IS NULL OR director = '';


--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT * 
FROM netfix_1
WHERE type = 'Movie'
  AND casts LIKE '%Salman Khan%'
  AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT casts, country
FROM netfix_1
WHERE type = 'Movie'
AND country = 'India'
LIMIT 10;

SELECT 
    UNNEST(STRING_TO_ARRAY(casts, ', ')) AS actor, 
    COUNT(*) AS movie_count
FROM netfix_1
WHERE type = 'Movie' 
  AND country = 'India'
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;


  SELECT *FROM netfix_1
--15.
--Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.

SELECT 
    CASE 
        WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
        ELSE 'Good'
    END AS category,
    COUNT(*) AS content_count
FROM netfix_1
GROUP BY category;

