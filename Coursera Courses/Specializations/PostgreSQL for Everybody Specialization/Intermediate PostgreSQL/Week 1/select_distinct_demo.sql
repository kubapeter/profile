-- Create table
DROP TABLE IF EXISTS racing;

CREATE TABLE racing (
  make VARCHAR, 
  model VARCHAR, 
  year INTEGER, 
  price INTEGER
);

INSERT INTO racing (make, model, year, price) 
  VALUES 
  ('Nissan', 'Stanza', 1990, 2000), 
  ('Dodge', 'Neon', 1995, 800), 
  ('Dodge', 'Neon', 1998, 2500), 
  ('Dodge', 'Neon', 1999, 3000), 
  ('Ford', 'Mustang', 2001, 1000), 
  ('Ford', 'Mustang', 2005, 2000), 
  ('Subaru', 'Impreza', 1997, 1000), 
  ('Mazda', 'Miata', 2001, 5000), 
  ('Mazda', 'Miata', 2001, 3000), 
  ('Mazda', 'Miata', 2001, 2500), 
  ('Mazda', 'Miata', 2002, 5500), 
  ('Opel', 'GT', 1972, 1500), 
  ('Opel', 'GT', 1969, 7500), 
  ('Opel', 'Cadet', 1973, 500)
;


-- SELECT and DISTINCT

-- no duplicate rows
SELECT DISTINCT make 
  FROM racing;

SELECT DISTINCT model 
  FROM racing;

-- no duplicate (make, model) pairs
SELECT DISTINCT make, model
  FROM racing;


--Can have duplicates in the make column
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing;
  
-- Must include the DISTINCT column in ORDER BY
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing
  ORDER BY model, year;
  
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing
  ORDER BY model, year DESC;
  
SELECT DISTINCT ON (model) 
    make, 
    model, 
    year 
  FROM racing
  ORDER BY model, year DESC 
  LIMIT 2;
  
  
-- GROUP BY

-- Just look around a bit
SELECT * 
  FROM pg_timezone_names 
  LIMIT 20;
  
SELECT COUNT(*)
  FROM pg_timezone_names;
  
SELECT DISTINCT is_dst
  FROM pg_timezone_names;

-- Count with GROUP BY
SELECT 
    COUNT(is_dst), 
    is_dst
  FROM pg_timezone_names
  GROUP BY is_dst;
  
SELECT 
    COUNT(abbrev), 
    abbrev
  FROM pg_timezone_names

-- Filter with WHERE and HAVING
SELECT 
    COUNT(abbrev) AS ct, 
    abbrev
  FROM pg_timezone_names
  WHERE is_dst = 't'
  GROUP BY abbrev
    HAVING COUNT(abbrev) > 10;
  
SELECT 
    COUNT(abbrev) AS ct, 
    abbrev
  FROM pg_timezone_names
  GROUP BY abbrev
    HAVING COUNT(abbrev) > 10;
    
SELECT 
    COUNT(abbrev) AS ct, 
    abbrev
  FROM pg_timezone_names
  GROUP BY abbrev
    HAVING COUNT(abbrev) > 10
  ORDER BY COUNT(abbrev) DESC;


-- SUBQUERIES 

-- Look at racing table
SELECT * 
  FROM racing;
  
-- Find the highest number of makes
SELECT COUNT(make), make
  FROM racing
  GROUP BY make
  ORDER BY COUNT(make) DESC
  LIMIT 1;

-- Show only those rows where the make is the highest through the table
SELECT * 
  FROM racing
  WHERE make = 
    (
    SELECT make
      FROM racing
      GROUP BY make
      ORDER BY COUNT(make) DESC
      LIMIT 1
    );
