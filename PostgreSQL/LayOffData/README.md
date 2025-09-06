This folder contains Data Cleaning and Exploratory Data Analysis on global layoff data.

Layoff Dataset SQL Analysis

This project explores a dataset containing details of global company layoffs, including:

Company information (name, industry, country, stage)

Layoff details (total employees laid off, percentage laid off, date, year)

Financials (funds raised in millions)

Key Objectives

Perform data cleaning (remove duplicates, fix date formats, handle NULL values).

Conduct Exploratory Data Analysis (EDA) to understand:

Trends of layoffs by year, industry, and country.

Relationship between funds raised and layoffs.

Companies that completely shut down (percentage_laid_off = 1).

Use SQL Window Functions (RANK(), DENSE_RANK(), ROW_NUMBER()) to analyze:

Top companies by layoffs.

Yearly rankings of layoffs.

Duplicate handling.

Insights (Brief)

Fundraising does not guarantee stability — many highly funded companies still laid off employees.

Some companies shut down completely despite raising millions.

Layoffs are concentrated in tech, finance, and consumer service industries.

Tools Used :

MySQL Workbench for querying.

Dataset: [Layoffs SQL file provided]

