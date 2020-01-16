/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

SELECT CASE             
            WHEN A + B > C AND B + C > A AND A + C > B THEN
                CASE 
                    WHEN A = B AND B = C THEN 'Equilateral'
                    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                    ELSE 'Scalene'
                END
            ELSE 'Not A Triangle'
        END
FROM TRIANGLES;

/* Above is for oracle, below is for MySQL */

SELECT IF(A+B>C AND A+C>B AND B+C>A, IF(A=B AND B=C, 'Equilateral', IF(A=B OR B=C OR A=C, 'Isosceles', 'Scalene')), 'Not A Triangle') 
FROM TRIANGLES;

-----------------------------------------------------------------
/* In oracle concat  concatenates two strings only. If you want to concatenate more than two strings,
you need to apply the CONCAT() function multiple times or use the concatenation operator (||).
*/
/* Generate the following two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, 
  immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
2. For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
  Query the number of ocurrences of each occupation in OCCUPATIONS. 
  
SELECT NAME||'('||substr(OCCUPATION,1,1)||')' FROM OCCUPATIONS ORDER BY NAME ASC;
select 'There are a total of ',count(occupation),' ', concat(lower(occupation),'s.')
from occupations 
group by occupation
order by count(occupation),occupation;

-----------------------------------------------------------------

