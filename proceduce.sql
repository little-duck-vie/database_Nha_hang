-- Tạo 1 procedure tính tổng số tiền trả cho mỗi đơn hàng
DELIMITER $$
CREATE PROCEDURE CALCULATE_TOTAL(
    IN order_id int
)
BEGIN
    DECLARE total decimal(10,2);

    SELECT SUM(o.quantity * p.price) INTO total
    FROM order_products o
    JOIN products p ON o.ProductId = p.ProductId
    WHERE o.OrderDetailsId = order_id;

    SELECT total AS total_amount;
end $$

DELIMITER  ;

CALL CALCULATE_TOTAL(2)