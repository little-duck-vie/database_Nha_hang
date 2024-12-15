DELIMITER $$
Create trigger orders_insert
    after insert on carts
    for each row
BEGIN
    INSERT INTO carts(ProductId,Quantity,UserId)
    VALUES(NEW.ProductId,NEW.Quantity,NEW.UserId);
END$$
DELIMITER ;