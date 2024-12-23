SELECT 
   FORMAT_TIMESTAMP('%Y-%U', t.refresh_date) AS Week, 
   t.refresh_date AS Day, 
   t.term AS Top_Term,
   t.rank,
   c.category AS top_rising_terms, 
   COUNT(*) AS Appearance_Count 
FROM 
   `bigquery-public-data.google_trends.top_terms` AS t
JOIN 
   `bigquery-public-data.google_trends.top_rising_terms` AS c
ON 
   t.term = c.term 
WHERE 
   t.rank <= 3 
   AND t.refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)  
GROUP BY 
   Week, Day, Top_Term, rank, top_rising_terms
ORDER BY 
   Week DESC, rank ASC; 

