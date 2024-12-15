UPDATE orders
set OrderStatus = 'Đã giao hàng'
where OrderDetailsId = 3;

UPDATE products
set Quantity = Quantity - 1
where ProductId = 3;

ROLLBACK;
