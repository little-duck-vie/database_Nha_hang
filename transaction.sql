-- Tạo 1 transaction khi thêm sản phẩm mới vào product
DELIMITER $$

CREATE PROCEDURE AddProduct(
    IN productname VARCHAR(100),
    IN price DECIMAL(10,2),
    IN quantity INT,
    IN categoryId INT
)
BEGIN
    START TRANSACTION;
    INSERT INTO products (CategoryId, ProductName, Price, Quantity)
    VALUES (categoryId, productname, price, quantity);
    IF price < 0 THEN
        ROLLBACK;
        SELECT 'Transaction rolled back: Invalid price';
    ELSE
        COMMIT;
        SELECT 'Transaction committed: Product added successfully';
    END IF;

END $$

DELIMITER ;

CALL AddProduct('Bún bò Huế', 50000.00, 50, 1);
