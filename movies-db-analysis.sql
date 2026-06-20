###analysis on moviesDB###
use moviesdb;

select * from  actors;
# we have info of ____ actors________________________________________________________________________________________________1
select count(name) as Total_actors from actors;
# oldest actor_______________________________________________________________________________________________________________2
select min(birth_year) Old_actor from actors;
# youngest actor_____________________________________________________________________________________________________________3
select max(birth_year) Young_actor from actors;


### analysis on financials table ###
select * from  financials;
# Bad investments____________________________________________________________________________________________________________4
select * from financials where revenue < budget;
# Movies are good investments as per data



### analysis on languages###
select * from  languages;
# how many languages we have in this data____________________________________________________________________________________5
select count(name) as no_of_languages from languages ;

### analysis on movie_actors table ###
select * from  movie_actor;
# no of actors info we have in data__________________________________________________________________________________________6
select count(actor_id) as no_of_Actors from movie_actor;

### analysis on movies table ###
select * from  movies;
# Good and Bad IMDB Rating of Bollywood______________________________________________________________________________________7
select sum(industry='Bollywood') as no_of_Bollywood_movies from movies;
select sum(industry= 'Bollywood') as Bollywood_good_rating from movies where imdb_rating > 8;
select sum(industry= 'Bollywood') as Bollywood_good_rating from movies where imdb_rating < 8;

select sum(industry='Hollywood') as no_of_Hollywood_movies from movies;
select sum(industry= 'Hollywood') as Hollywood_good_rating from movies where imdb_rating > 8;
select sum(industry= 'Hollywood') as Hollywood_good_rating from movies where imdb_rating < 8;



### ACTUAL ANALysis###

## Highest grossing movies by revenue ##_________________________________________________________________________________8
select m.title, f.revenue, f.budget, (f.revenue - f.budget) as profit from movies m
join financials f on m.movie_id = f.movie_id
order by f.revenue desc
limit 10;

## Movies with the best ROI ##____________________________________________________________________________________________9
select m.title,f.budget,f.revenue,(f.revenue - f.budget)/f.budget as ROI
from movies m join financials f on m.movie_id= f.movie_id
order by ROI desc
limit 10;

## Average movie revenue and rating by industry ##__________________________________________________________________________10
select m.industry, avg(f.revenue) as avg_Revenue ,avg(m.imdb_rating) as avg_Rating
from movies m join financials f on m.movie_id= f.movie_id
group by m.industry
order by avg_Revenue desc;


## Most number of movies released per language ##______________________________________________________________________________11
select l.name, count(m.movie_id) as movie_count
from languages l join movies m on l.language_id = m.language_id
group by l.name
order by movie_count desc;


## Most popular industry by total revenue ##_______________________________________________________________________________________12
select m.industry, sum(f.revenue) as total_revenue
from movies m join financials f on m.movie_id = f.movie_id
group by m.industry
order by total_revenue desc;

## Rank studios by average movie rating ##__________________________________________________________________________________________13
select studio, avg(imdb_rating) as avg_rating, sum(movie_id) as movie_count 
from movies
group by studio
order by avg_rating desc;

## Number of movies released by studios over years ##_______________________________________________________________________________14
select studio, release_year, count(movie_id)as movie_count 
from movies
group by studio, release_year
order by movie_count, release_year desc;


## Total budgets and revenues grouped by currency and unit ##_______________________________________________________________________15
SELECT f.currency,
       f.unit,
       SUM(f.budget) AS total_budget,
       SUM(f.revenue) AS total_revenue,
       COUNT(f.movie_id) AS movies_count
FROM financials f
GROUP BY f.currency, f.unit
ORDER BY total_revenue DESC;

with cte as (select movie_id,  dense_rank() over (order by revenue desc) as rak from financials)
select movie_id from cte where rak = 2;