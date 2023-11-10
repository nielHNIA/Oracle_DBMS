---q1---

SELECT c.CHANNEL_ID, s.PROD_ID, 
   sum(s.amount_sold) "SALES_TOTAL"
   FROM  SALES s, channels c 
   where s.CHANNEL_ID = c.CHANNEL_ID
   GROUP BY c.CHANNEL_ID, s.PROD_ID;




DROP MATERIALIZED VIEW sales_chan_prod_mv;

drop dimension sales_dim;

---q2---
create materialized view sales_chan_prod_mv refresh force on demand
enable query REWRITE as SELECT s.CHANNEL_ID, s.PROD_ID, 
   sum(s.amount_sold) "SALES_TOTAL"
   FROM  SALES s
   GROUP BY s.CHANNEL_ID, s.PROD_ID;




--q3 Write a query to return sales total grouped by channel description and product name--
    select c.channel_desc as channel_description, p.prod_name as productions,
   tso_char(sum(s.amount_sold), 'L9,999,999.99') as total_sales 
   from sales s, channels c, products p
   where s.channel_id = c.channel_id and s.prod_id = p.prod_id
   group by channel_desc, prod_name;
   
    

--q5 Create an appropriate Dimensional object to allow Q3 to use the Materialised View SALES_CHAN_PROD_MV   

CREATE DIMENSION sales_dim
  level sale is (sales.amount_sold)
  LEVEL channel IS (channels.channel_id)
  LEVEL channeldesc IS (channels.channel_desc)
  
  HIERARCHY sale_rollup
  (
   sale child of
   channel child of 
   channeldesc
    
  
   JOIN KEY (sales.channel_id) references channel
   
  )
  ATTRIBUTE sale determines
  (sales.amount_sold)
  ATTRIBUTE channeldesc determines 
  (channels.channel_desc)

  ;
  
SELECT * FROM USER_DIMENSIONS;

EXECUTE DBMS_DIMENSION.DESCRIBE_DIMENSION('sales_dim');




---q7
SELECT decode(channel_desc, NULL, 'All Channels',channel_desc) as channels,category,country,total_sales   FROM (SELECT c.channel_desc ,
            Decode(Grouping(p.prod_category), 1, 'All products ', p.prod_category) as category,                      
            Decode(Grouping(sh.country_name), 1, 'Total in France and Italy ', sh.country_name) as country,   
        to_char(sum(s.amount_sold), 'L9,999,999.99') as total_sales
        FROM
            sales       s,
            channels    c,
            products    p,
            shcountries sh,
            customers cust

 

        WHERE
                s.channel_id = c.channel_id
            AND s.prod_id = p.prod_id 
            AND s.cust_id = cust.cust_id            
            AND sh.country_id = cust.country_id           
            AND prod_category NOT IN ( 'Peripherals and Accessories', 'Hardware', 'Photo' )
            AND country_name IN ( 'France', 'Italy' )
GROUP BY

 

    rollup(channel_desc, prod_category, 
    country_name)
    order by 1);






