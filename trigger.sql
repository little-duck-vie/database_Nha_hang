-- tạo 1 trigger khi thêm vào users
DELIMITER $$
Create trigger contact_insert
    after insert on users
    for each row
BEGIN
    INSERT INTO contact(ContactName,Email,CreatedDate)
    VALUES(NEW.FullName,NEW.Email,NEW.CreatedDate);
END$$
DELIMITER ;

-- tạo 1 trigger khi thêm customer_payment
DELIMITER $$
Create trigger payment_insert
    after insert on customer_payment
    for each row
BEGIN
    INSERT INTO payment(paymentid, paymentmode)
    VALUES(NEW.PaymentId,NEW.PaymentName);
END$$
DELIMITER ;