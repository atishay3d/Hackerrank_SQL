/* Start with Vowels*/
/* Below code will work in sql(does'nt matter if its capital or small,
but in oracle it would display only if, its Capital*/

select distinct city 
from station 
where city like 'A%' or city like 'E%' or city like 'I%' or city like 'O%' or city like 'U%';

