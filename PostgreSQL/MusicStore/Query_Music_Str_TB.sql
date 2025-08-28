/* Set -1 (Easy) */
/* Q1: Who is the senior most employee based on job title? */

SELECT last_name, first_name, title, 
FROM employee
ORDER BY levels DESC
LIMIT 1

/* Q2: Which countries have the most Invoices? */

SELECT COUNT(*) AS Qty_Invoice, billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY Qty_Invoice DESC


/* Q3: What are top 3 values of total invoice? */

SELECT invoice_id, customer_id, total 
FROM invoice
ORDER BY total DESC


/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

SELECT billing_city, billing_country, SUM(total) AS invoice_total
FROM invoice
GROUP BY billing_city, billing_country
ORDER BY invoice_total DESC
LIMIT 1;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

SELECT cu.customer_id, first_name, last_name, SUM(total) AS total_spent FROM customer cu
JOIN invoice inv ON cu.customer_id = inv.customer_id
GROUP BY cu.customer_id
ORDER BY total_spent DESC
LIMIT 1;

/* Set 2 - Moderate */

/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

/*Method 1 */

SELECT DISTINCT email,first_name, last_name
FROM customer cu
JOIN invoice inv ON cu.customer_id = inv.customer_id
JOIN invoiceline il ON inv.invoice_id = il.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track 
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;


/* Method 2 */

SELECT DISTINCT email,first_name, last_name, genre.name 
FROM customer cu

JOIN invoice inv ON inv.customer_id = cu.customer_id
JOIN invoice_line il ON il.invoice_id = inv.invoice_id
JOIN track ON track.track_id = il.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;


/* Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS no_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY no_of_songs DESC
LIMIT 10;


/* Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT name AS track_name, milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;


/* Set 3 - Advance */

/* Q9: Find how much amount spent by each customer on artists? Write a query to return customer name, 
artist name and total spent */

/* Using CTE */

WITH best_artist AS (
	SELECT ar.name AS artist_name, ar.artist_id, 
	SUM(il.quantity*il.unit_price)AS total
	FROM artist ar
	JOIN album al ON ar.artist_id = al.artist_id
	JOIN track tr ON tr.album_id = al.album_id
	JOIN invoice_line il ON il.track_id = tr.track_id
	GROUP BY 2
	ORDER BY 3 DESC Limit 1 )
	
SELECT cu.customer_id, cu.first_name, cu.last_name, ba.artist_name, SUM(il.quantity*il.unit_price)
AS total_spent FROM customer cu 
JOIN invoice inv ON inv.customer_id = cu.customer_id
JOIN invoice_line il ON inv.invoice_id = il.invoice_id
JOIN track ON track.track_id = il.track_id
JOIN album ON album.album_id = track.album_id
JOIN best_artist ba ON  ba.artist_id = album.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC

/* Q10: We want to find out the most popular music Genre for each country. We determine the most 
popular genre as the genre with the highest amount of purchases. Write a query that returns each 
country along with the top Genre. For countries where the maximum number of purchases is shared 
return all Genres. */

/* Using CTE */

WITH popular_genre AS (	SELECT  gn.genre_id,gn.name AS genre_Name, COUNT(il.quantity) AS Qty_Purchase, cu.country,
	ROW_NUMBER() OVER(PARTITION BY cu.country ORDER BY COUNT(il.quantity) DESC) AS RowNum
	FROM genre gn
	JOIN track tr ON tr.genre_id = gn.genre_id
	JOIN invoice_line il ON il.track_id = tr.track_id
	JOIN invoice inv ON inv.invoice_id = il.invoice_id
	JOIN customer cu ON cu.customer_id = inv.customer_id
	GROUP BY 1,2,4
	ORDER BY 4 ASC)
SELECT * FROM popular_genre WHERE RowNum = 1


/* Using Recursive */

	WITH RECURSIVE genre_sales_per_country AS
		(SELECT COUNT(*) AS qty_purchased_per_genre, cu.country, gn.name, gn.genre_id
		FROM invoice_line il
		JOIN invoice inv ON inv.invoice_id = il.invoice_id
		JOIN customer cu ON cu.customer_id = inv.customer_id
		JOIN track ON track.track_id = il.track_id
		JOIN genre gn ON gn.genre_id = track.genre_id
		GROUP BY 2,3,4
		ORDER BY 2),
		max_purchase_per_country AS (SELECT MAX(qty_purchased_per_genre) AS 
		max_qty_purchase, country FROM genre_sales_per_country
		GROUP BY 2
		ORDER BY 2
		)
	SELECT genre_sales_per_country.* FROM genre_sales_per_country
	JOIN max_purchase_per_country

/* Q11: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

/* Using Recursive */

WITH RECURSIVE music_spent_per_country AS (SELECT cu.first_name, cu.last_name, SUM(inv.total) AS customer_total, cu.country, 
	cu.customer_id 	FROM customer cu
 	JOIN invoice inv ON inv.customer_id = cu.customer_id
	GROUP BY 4,5
	ORDER BY 1 DESC),
max_music_spent_per_country AS (SELECT country, MAX(customer_total) AS max_spent FROM music_spent_per_country 
GROUP BY 1)
SELECT msc.first_name, msc.last_name, msc.country, mms.max_spent FROM 
music_spent_per_country msc JOIN max_music_spent_per_country mms
ON msc.country = mms.country
WHERE msc.customer_total=mms.max_spent
ORDER BY 4 DESC

/*Using CTE */
WITH music_spent_per_country AS (SELECT SUM(inv.total) AS customer_total, cu.country, 
	cu.customer_id, cu.first_name, cu.last_name,
	ROW_NUMBER() OVER(PARTITION BY cu.country ORDER BY SUM(inv.total) DESC)
	AS RowNum FROM customer cu
 	JOIN invoice inv ON inv.customer_id = cu.customer_id
	GROUP BY 3,4,5
	ORDER BY 1 DESC)
SELECT * FROM music_spent_per_country  WHERE RowNum = 1 






