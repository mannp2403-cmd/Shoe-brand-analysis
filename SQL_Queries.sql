USE shoe_capstone;

#TABLE 1
#1
SELECT ShoeName, Min_Price,Max_Price FROM table1 WHERE Category = 'Men';

#2
SELECT Category, SUM(no_of_colors) FROM table1 GROUP BY Category;

#3
SELECT ShoeName, Min_Price,Max_Price FROM table1 WHERE Category = 'Men' 
ORDER BY Min_Price,Max_Price ;

#4
 SELECT t1.ShoeName, t1.Min_Price,t1.Max_Price,t2.Color1,t2.Color2,t2.Color3
 FROM table1 AS t1 
 JOIN table2 AS t2 ON t1.ShoeName = t2.ShoeName 
 WHERE t1.Category = 'Women' AND 
 (t2.color1 = 'Black' 
 OR t2.color2 = 'Black' 
 OR t2.color3 = 'Black') ORDER BY t1.Price;

#5
 SELECT ShoeName, Min_Price,Max_Price FROM table1 WHERE Category = 'Men';


select* from table1;
#TABLE 2
#1
 SELECT ShoeName,Style_Code, count_of_sizes FROM table2;
 
#2
 SELECT ShoeName,Style_Code, color1, color2, color3, color4, color5 FROM table2;
 
#3
 SELECT ShoeName,no_of_colors FROM table1
 WHERE NO_of_colors  > 1;

#4
 SELECT Style_Code, color1, count_of_sizes FROM table2 WHERE Style_Code = 'FGC015061161A';

#5
 SELECT ShoeName,Style_Code,Color1,Color2,Color3,Color4,Color5 FROM table2 
 WHERE color1 = 'Black' 
 OR color2 = 'Black' 
 OR color3 = 'Black' 
 OR color4 = 'Black' 
 OR color5 = 'Black';

select*from table3;
#TABLE 3
#1
SELECT Brand, COUNT(Size) FROM table3 GROUP BY Brand;

#2
 SELECT ShoeName, Brand, Size FROM table3 WHERE Size = 'UK-7';
 
 #4
 SELECT ShoeName, COUNT(Size) FROM table3 GROUP BY ShoeName;
 
 #5
 SELECT ShoeName FROM table3 GROUP BY ShoeName HAVING COUNT(Size) > 6;
 
 #6
 SELECT t3.Size, t1.Category, COUNT(*) FROM table3 AS t3 
 JOIN table1 AS t1 ON t3.ShoeName = t1.ShoeName GROUP BY t3.Size, t1.Category;


select * from table1;
select* from table3;

#joins
#1
select t1.ShoeName,t1.Min_Price, t1.Max_Price , t3.Size from table1 as t1
join table3 as t3
on t1.ShoeName=t3.ShoeName;

#2
select t3.category,AVG(t1.Min_Price) as avg_min,AVG(t1.Max_Price) as avg_max 
from table1 as t1
join table3 as t3
on t1.ShoeName=t3.ShoeName
group by t3.Category;

#3
select distinct t1.ShoeName,t3.category,t1.Min_Price,t1.Max_Price from table1 as t1
join table3 as t3
on t1.ShoeName=t3.ShoeName 
where t1.Min_Price > (select AVG(t1.Min_Price) from table1 as t1);

select AVG(t1.Min_Price) from table1 as t1;

#4
select distinct t1.ShoeName,t3.category,t1.No_of_Colors from table1 as t1
join table3 as t3
on t1.ShoeName=t3.ShoeName 
where t1.No_of_Colors> (select AVG(No_of_Colors) from table1 as t1);

#5
select t1.ShoeName,t1.Min_Price,t1.Max_Price,t2.Color1,t2.Color2,t2.Color4,t2.Color5,t2.Style_Code
from table1 as t1
join table2 as t2 
on t1.ShoeName=t2.ShoeName;

select * from table2;

#6
select distinct t1.ShoeName,t3.Size,t1.Min_Price from table1 as t1
join table3 as t3
on t1.ShoeName=t3.ShoeName 
where t1.Min_Price > (select AVG(t1.Min_Price) from table1 as t1);

#7
select t1.ShoeName,t1.category,t2.Color1,t2.Color2,t2.Color3,t2.Color4,t2.Color5 from table1 as t1
join table2 as t2
where t2.Color1 != 'Not Specified'
and t2.Color2 != 'Not Specified'
and t2.Color3 != 'Not Specified'
and t2.Color4 != 'Not Specified'
and t2.Color5 != 'Not Specified';


#e-1
SELECT Brand, Category,
       COUNT(DISTINCT ShoeName) AS Total_Shoes,
       ROUND(AVG(Min_Price), 0) AS Avg_Min_Price,
       ROUND(AVG(Max_Price), 0) AS Avg_Max_Price,
       MIN(Min_Price) AS Cheapest,
       MAX(Max_Price) AS Most_Expensive
FROM table1
GROUP BY Brand, Category
ORDER BY Brand;

#e-2
SELECT ShoeName, Brand, Category,
       Min_Price, Max_Price,
CASE
    WHEN Max_Price < 3000  THEN 'Budget'
    WHEN Max_Price < 6000  THEN 'Mid-Range'
    WHEN Max_Price < 10000 THEN 'Premium'
    ELSE 'Luxury'
END AS Price_Segment
FROM table1
ORDER BY Max_Price DESC;

#e-3
SELECT Category,
       COUNT(DISTINCT ShoeName) AS Total_Shoes,
       ROUND(AVG(Min_Price), 0) AS Avg_Price,
       MIN(Min_Price) AS Cheapest,
       MAX(Max_Price) AS Most_Expensive,
       SUM(No_of_Colors) AS Total_Colors
FROM table1
GROUP BY Category;

#e-4
SELECT t3.Size, t3.Brand,
       t1.Category,
       COUNT(DISTINCT t3.ShoeName) AS Shoes_Available
FROM table3 AS t3
JOIN table1 AS t1
ON t3.ShoeName = t1.ShoeName
GROUP BY t3.Size, t3.Brand, t1.Category
ORDER BY t3.Brand, t3.Size;

#e-5
SELECT Brand, Color1 AS Color,
       COUNT(*) AS Total_Shoes
FROM table2
WHERE Color1 != ''
AND Color1 != 'Not Specified'
GROUP BY Brand, Color1
ORDER BY Brand, Total_Shoes DESC;

#e-6
SELECT ShoeName, Brand, Category,
       Min_Price, Max_Price
FROM table1
ORDER BY Max_Price DESC
LIMIT 20;

#e-7
SELECT t1.ShoeName, t1.Brand,
       t1.Category, t1.Min_Price,
       t1.Max_Price, t1.No_of_Colors,
       t2.Style_Code, t2.Count_of_Sizes,
       t2.Color1, t2.Color2, t2.Color3
FROM table1 AS t1
JOIN table2 AS t2
ON t1.ShoeName = t2.ShoeName
ORDER BY t1.Brand, t1.Category;

#e-8
SELECT Brand,
       COUNT(DISTINCT ShoeName) AS Total_Shoes,
       ROUND(AVG(Max_Price), 0) AS Avg_Price,
       MIN(Min_Price) AS Min_Price,
       MAX(Max_Price) AS Max_Price,
       SUM(No_of_Colors) AS Total_Colors
FROM table1
GROUP BY Brand
ORDER BY Total_Shoes DESC;