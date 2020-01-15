/* Start with Vowels*/
/* Below code will work in sql(does'nt matter if its capital or small,
but in oracle it would display only if, its Capital*/

select distinct city 
from station 
where city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%';
____________________________________________________________________________________________

/* Start and End with Vowels*/
/* For my sql */
select distinct city from station 
where left(city,1) in ('a','e','i','o','u','A','E','I','O','U') 
and right(city, 1) in ('a','e','i','o','u','A','E','I','O','U');

/* Since Oracle don't have any function called left */
SELECT DISTINCT CITY 
FROM STATION 
WHERE (CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%') 
AND 
(CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');

/* also can be done like 
The Oracle REGEXP_LIKE() function is an advanced version of the LIKE operator. 
The REGEXP_LIKE() function returns rows that match a regular expression pattern.
The caret (^) operator matches the beginning of the line.
The dollar ($) operator matches the end of the line.
he pipe (|) operator e.g., a |b matches either a or b. 
*/

SELECT DISTINCT CITY FROM STATION WHERE REGEXP_LIKE (UPPER(city),'^[AEIOU].*[AEIOU]$');
________________________________________________________________________________________
/* not start with vowels */
SELECT DISTINCT CITY 
FROM STATION 
WHERE not REGEXP_LIKE (UPPER(city),'^[AEIOU]');
/* similary doe'snt end with */
SELECT DISTINCT CITY 
FROM STATION 
WHERE not REGEXP_LIKE (UPPER(city),'[AEIOU]$');

________________________________________________________________________________________
/*Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
Your result cannot contain duplicates. */

SELECT DISTINCT CITY 
FROM STATION 
WHERE  not REGEXP_LIKE (UPPER(city),'^[AEIOU].*[AEIOU]$');

/*Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates. */

select distinct city
  from station
where 
  substr(lower(city), 1, 1) not in ('a', 'e', 'i', 'o', 'u')
     and
  substr(lower(city), length(city), 1) not in ('a', 'e', 'i', 'o', 'u')
  order by city;
  
___________________________________________________________________________________________
Query the Name of any student in STUDENTS who scored higher than  Marks.
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
  
select name from students
where marks > 75 
order by substr(name,-3) ;

____________________________________________________________________________________________

