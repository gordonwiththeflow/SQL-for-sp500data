SELECT 
    td.*,
    CASE 
        WHEN td.close > yt.previous_close THEN 'Close Higher'
        ELSE 'Close Lower or Equal'
    END AS price_comparison
FROM 
    trading_data td
LEFT JOIN 
    trading_data yt ON td.trading_date = DATE_SUB(yt.trading_date, INTERVAL 1 DAY)
WHERE 
    td.trading_date = td.settlement_date
    AND td.close > yt.previous_close;

