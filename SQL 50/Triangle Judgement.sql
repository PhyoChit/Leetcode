SELECT 
    x, y, z,
    CASE WHEN (((x + y) > z) AND ((y + z) > x) AND ((x + z)> y) AND (x != 0) AND (y != 0) AND (z != 0)) THEN 'Yes'
         ELSE 'No' END
    AS triangle
FROM Triangle
