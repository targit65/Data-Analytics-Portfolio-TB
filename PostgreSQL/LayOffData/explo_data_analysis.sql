-- Exploratory Data Analysis

SELECT * 
FROM layoff_stage2;

SELECT * FROM 
layoff_stage2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT * FROM 
layoff_stage2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, total_laid_off
FROM layoff_stage2
WHERE total_laid_off = (SELECT MAX(total_laid_off) FROM layoff_stage2);

SELECT company, total_laid_off
FROM layoff_stage2
WHERE total_laid_off = (SELECT MIN(total_laid_off) FROM layoff_stage2 WHERE total_laid_off IS NOT NULL);

SELECT company, SUM(total_laid_off) AS sum_total_laid
FROM layoff_stage2
GROUP BY 1
ORDER BY 2 DESC;

-- Maximum laidoff dome BY AMAZONE

SELECT industry, SUM(total_laid_off) AS sum_total_laid
FROM layoff_stage2
GROUP BY industry
ORDER BY 2 DESC;

-- Maximun laidoff seen in CONSUMER industry

SELECT company, SUM(funds_raised_millions) AS sum_funds
FROM layoff_stage2
GROUP BY company
ORDER BY 2 DESC;

-- Maximum Fund raised by Netflix

SELECT industry, SUM(funds_raised_millions) AS sum_funds
FROM layoff_stage2
GROUP BY industry
ORDER BY 2 DESC;

-- Maximum Fund raised from Media industry.

SELECT MIN(`date`), MAX(`date`)
FROM layoff_stage2;

-- Period From: 11-03-2020 to: 06-03-2023

SELECT country, SUM(total_laid_off) AS sum_total_laid
FROM layoff_stage2
GROUP BY 1
ORDER BY 2 DESC;

-- Maximum laidoff taken place in US.


SELECT country, SUM(funds_raised_millions) AS sum_funds
FROM layoff_stage2
GROUP BY 1
ORDER BY 2 DESC;

-- Maximum Funds raised from US.

SELECT `date`, SUM(total_laid_off)
FROM layoff_stage2
GROUP BY `date`
ORDER BY 2 DESC;

-- Maximum Laidoff taken place on 04-01-2023

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoff_stage2
GROUP BY 1
ORDER BY 2 DESC;
-- Maximum Laidoff (160661) taken place in the YEAR 2022.

SELECT stage, SUM(total_laid_off)
FROM layoff_stage2
GROUP BY 1
ORDER BY 2 DESC;
-- Maximum Laidoff (204132) taken place in the Stage Post-IPO.


SELECT stage, SUM(funds_raised_millions)
FROM layoff_stage2
GROUP BY 1
ORDER BY 2 DESC;
-- Maximum Fund Raised (1004572)m in the Stage Post-IPO.

SELECT substr(`date`,1,7) AS month_laidoff, SUM(total_laid_off)
FROM layoff_stage2
WHERE substr(`date`,1,7) IS NOT NULL
GROUP BY 1
ORDER BY 1 ASC;

WITH month_total_cte AS
	(SELECT substr(`date`,1,7) AS month_laidoff, SUM(total_laid_off) AS sum_laidoff
	FROM layoff_stage2
	WHERE substr(`date`,1,7) IS NOT NULL
	GROUP BY 1
	ORDER BY 1 ASC
	)
SELECT month_laidoff, sum_laidoff, SUM(sum_laidoff)
OVER(ORDER BY month_laidoff) AS cumil_total
FROM month_total_cte
;
-- Cumilitative Laidoff shown after each month

SELECT YEAR(`date`) AS year_laidoff, company, SUM(total_laid_off)
FROM layoff_stage2
WHERE company IS NOT NULL
GROUP BY 1, 2
ORDER BY 1 DESC;

WITH company_year_cte(company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`) ,  SUM(total_laid_off)
FROM layoff_stage2
WHERE company IS NOT NULL
GROUP BY 1, 2
ORDER BY 2 DESC
), COMPANY_YEAR_RANK AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off) AS ranking
FROM company_year_cte
WHERE years IS NOT NULL
)
SELECT *
FROM COMPANY_YEAR_RANK;


WITH laidoff_table_cte(company, laidoff_year, total_laidoff) AS
(SELECT company, year(`date`) AS laidoff_year, SUM(total_laid_off)
FROM layoff_stage2
GROUP BY 1, 2
ORDER BY 2 ),
laidoff_rank_table AS
(SELECT *, 
DENSE_RANK() OVER(PARTITION BY laidoff_year ORDER BY total_laidoff DESC) AS rank_position
FROM laidoff_table_cte
WHERE laidoff_year IS NOT NULL
)
SELECT *
FROM laidoff_rank_table
WHERE rank_position <= 10;






