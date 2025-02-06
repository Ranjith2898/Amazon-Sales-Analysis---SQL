SELECT * FROM amazon.amazondata;
use amazon;

ALTER TABLE amazondata
ADD timeofday VARCHAR(10);

ALTER TABLE amazondata
ADD dayname VARCHAR(10);

ALTER TABLE amazondata
ADD monthname VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;

UPDATE amazondata
SET timeofday = 
    CASE
        WHEN TIME(Time) BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN TIME(Time) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END;
    
UPDATE amazondata
SET dayname = DAYNAME(STR_TO_DATE(Date, '%m/%d/%Y'));

UPDATE amazondata
SET monthname = MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y'));





