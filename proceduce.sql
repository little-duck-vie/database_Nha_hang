DELIMITER $$
Create procedure take_quanlity()
begin
    select * from products
    where Quantity >= 50;
end $$
DELIMITER ;

Call take_quanlity()