-- Data Cleaning

SELECT * from layoffs;

-- Remove duplicates
-- Standarise Data
-- Remove null values
-- Remove Column or Row



CREATE TABLE layoff_stage
LIKE layoffs;

INSERT layoff_stage
SELECT * FROM layoffs;

SELECT * FROM layoff_stage;

SHOW TABLES;

SELECT * FROM layoff_stage;

WITH duplicate_cte AS
(
SELECT * , 
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, `date`, stage, country) 
AS row_num FROM layoff_stage
)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1;
    

select version();

WITH duplicate_cte AS
(
SELECT * , 
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, `date`, stage, country) 
AS row_num FROM layoff_stage
)
SELECT * 
FROM duplicate_cte 
WHERE row_num = 2;

select * 
FROM layoff_stage
where company = "Casper";

CREATE table layoff_stage2
LIKE layoff_stage;

ALTER table layoff_stage2
ADD column row_num INT;

INSERT into layoff_stage2
SELECT *,
row_number() OVER(partition by company, location, industry, total_laid_off, percentage_laid_off,
 `date`, stage, country, funds_raised_millions)
 AS rownum FROM layoffs;
 select * from layoff_stage2; 
 
SELECT * from layoff_stage2
WHERE row_num >1;


SELECT * from layoff_stage2
where company = 'Cazoo';

SELECT * from layoff_stage2
where company = 'Hibob';

DELETE 
FROM  layoff_stage2
WHERE row_num >1;

select * from layoff_stage2 
where row_num > 1;

SET SQL_SAFE_UPDATES = 0;
DELETE 
FROM  layoff_stage2
WHERE row_num >1;

select * from layoff_stage2 
where row_num = 1;

SET SQL_SAFE_UPDATES = 1;

-- Next Step: Standardizing Data

UPDATE layoff_stage2
SET company = trim(company);

SELECT distinct company
FROM layoff_stage2
order by 1 DESC;

SELECT * 
FROM layoff_stage2
WHERE industry LIKE 'Crypt%';

SET SQL_SAFE_UPDATES =0;

UPDATE layoff_stage2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT *
FROM layoff_stage2
WHERE industry LIKE 'Crypto%';

UPDATE layoff_stage2
SET industry = TRIM(industry);
SELECT  industry
FROM layoff_stage2;

SELECT *
FROM layoff_stage2;

SELECT DISTINCT location
FROM layoff_stage2;

SELECT DISTINCT country
FROM layoff_stage2
order by 1;

UPDATE layoff_stage2
SET country = TRIM(country);

SELECT DISTINCT country
FROM layoff_stage2
order by 1;

UPDATE layoff_stage2
SET country = TRIM(TRAILING '.' FROM country);

SELECT DISTINCT country
FROM layoff_stage2
order by 1;

SELECT `date`, str_to_date(`date`, '%m/%d/%Y') 
AS lay_date
FROM layoff_stage2;

UPDATE layoff_stage2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

SELECT `date` 
FROM layoff_stage2;

ALTER TABLE layoff_stage2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoff_stage2;

SELECT `date`, YEAR(`date`), MONTH(`date`), DAY(`date`) 
FROM layoff_stage2; 



SELECT * 
FROM layoff_stage2
WHERE industry IS NULL
OR industry = '';

SELECT * 
FROM layoff_stage2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoff_stage2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM layoff_stage2;

ALTER TABLE layoff_stage2
DROP COLUMN row_num;






