-- ADD YOUR SQL QUERY HERE
SELECT 
    it.investor_id,
    s.sector_name,
    ROUND(
        100.0 * SUM(it.no_of_shares) / SUM(SUM(it.no_of_shares)) OVER (PARTITION BY it.investor_id),
        2
    ) AS percentage
FROM investor_transactions it
JOIN sectors s 
    ON it.sector_id = s.sector_id
GROUP BY it.investor_id, s.sector_name;
