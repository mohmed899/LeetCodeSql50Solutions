-- Create Activities table
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(255)
);

-- Insert data into Activities table
INSERT INTO Activities (sell_date, product) VALUES
    ('2020-05-30', 'Headphone'),
    ('2020-06-01', 'Pencil'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'Basketball'),
    ('2020-06-01', 'Bible'),
    ('2020-06-02', 'Mask'),
    ('2020-05-30', 'T-Shirt');
	

with ctedistinct as
(
select distinct sell_date, product
from activities
)
	
	select sell_date,count(*) num_sold ,STRING_AGG(  product,', ') WITHIN GROUP (ORDER BY product)  products
	from ctedistinct 
	group by sell_date