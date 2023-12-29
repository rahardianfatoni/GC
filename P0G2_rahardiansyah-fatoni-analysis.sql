SELECT segment.segment, SUM(sales_information.profit) AS total_profit
FROM segment
LEFT JOIN sales_information ON sales_information.segment_id = segment.segment_id
LEFT JOIN discount ON sales_information.discount_id = discount.discount_id
WHERE discount.discount_band != 'None'
GROUP BY segment;

SELECT countries.country, AVG(sales_information.sales) AS avg_sales,
MIN(sales_information.sales) AS min_sales,
MAX(sales_information.sales) AS max_sales
FROM countries
LEFT JOIN sales_information ON sales_information.country_id = countries.country_id
GROUP BY countries.country;

