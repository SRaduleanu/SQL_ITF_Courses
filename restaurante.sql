-- number of dishes for each restaurant
select r.name as nume_restaurant, count(d.id) as numar_dishes
from restaurant r 
join dish d on r.id = d.restaurant_id
group by r.name;

-- restaurants that didn't sell anything last month
/*select r.name as nume_restaurant
from restaurant r 
join dish d on r.id = d.restaurant_id
join order_dish od on d.id = od.dish_id
join orders o on o.id = od.order_id
where o.created_on >= date_sub(current_date, interval 1 month)
group by r.name;*/

SELECT r.name as nume_restaurant
FROM restaurant r
WHERE r.id NOT IN (
    SELECT DISTINCT r.id
    FROM restaurant r
    JOIN dish d ON r.id = d.restaurant_id
    JOIN order_dish od ON d.id = od.dish_id
    JOIN orders o ON o.id = od.order_id
    WHERE o.created_on >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
);