-- INSERT dữ liệu vào bảng USERS
INSERT INTO USERS (fullName, Username, Mobile, Email, Address, PostCode, UserPass, ImageUrl) 
VALUES 
('Nguyễn Văn An', 'nguyenvanan', '0912345678', 'nguyenvanan@gmail.com', '123 Đường Lê Lợi', '700000', 'password123', NULL),
('Trần Thị Bình', 'tranthibinh', '0923456789', 'tranthibinh@gmail.com', '456 Đường Trần Hưng Đạo', '700001', 'password456', NULL),
('Lê Văn Cường', 'levancuong', '0934567890', 'levancuong@gmail.com', '789 Đường Nguyễn Trãi', '700002', 'password789', NULL),
('Phạm Thị Dung', 'phamthidung', '0945678901', 'phamthidung@gmail.com', '321 Đường Hai Bà Trưng', '700003', 'password101', NULL),
('Hoàng Văn Én', 'hoangvanen', '0956789012', 'hoangvanen@gmail.com', '654 Đường Hoàng Diệu', '700004', 'password102', NULL),
('Võ Thị Quỳnh', 'vothiquynh', '0967890123', 'vothiquynh@gmail.com', '987 Đường Lý Thường Kiệt', '700005', 'password103', NULL),
('Đặng Văn Giang', 'dangvangiang', '0978901234', 'dangvangiang@gmail.com', '543 Đường Nguyễn Huệ', '700006', 'password104', NULL),
('Bùi Thị Hương', 'buithihuong', '0989012345', 'buithihuong@gmail.com', '876 Đường Quang Trung', '700007', 'password105', NULL),
('Ngô Văn Tới', 'ngovanitoi', '0990123456', 'ngovanitoi@gmail.com', '210 Đường Lạc Long Quân', '700008', 'password106', NULL),
('Đỗ Thị Khánh Huyền', 'dothikhanhhuyen', '0901234567', 'dothikhanhhuyen@gmail.com', '432 Đường Phan Chu Trinh', '700009', 'password107', NULL);

-- INSERT dữ liệu vào bảng CATEGORIES
INSERT INTO CATEGORIES (FoodName, ImageUrl, IsActive) 
VALUES 
('Bánh Pizza', NULL, 1),
('Bánh Mì Kẹp', NULL, 1),
('Mì Ý', NULL, 1),
('Salad Rau', NULL, 1),
('Sushi Nhật', NULL, 1),
('Bánh Sandwich', NULL, 1),
('Tráng Miệng', NULL, 1),
('Súp Nóng', NULL, 1),
('Bít Tết', NULL, 1),
('Đồ Uống', NULL, 1);

-- INSERT dữ liệu vào bảng PRODUCTS
INSERT INTO PRODUCTS (ProductName, DescriptionProducts, Price, Quantity, ImageUrl, CategoryId, IsActive) 
VALUES 
('Pizza Hải Sản', 'Bánh pizza hải sản thơm ngon', 150000, 100, NULL, 1, 1),
('Burger Gà', 'Bánh mì kẹp gà giòn', 80000, 200, NULL, 2, 1),
('Mì Ý Carbonara', 'Mì Ý sốt kem phô mai', 120000, 150, NULL, 3, 1),
('Salad Trộn', 'Salad rau củ tươi', 70000, 120, NULL, 4, 1),
('Sushi Cá Hồi', 'Sushi cá hồi tươi ngon', 130000, 180, NULL, 5, 1),
('Sandwich Thịt Nguội', 'Bánh sandwich thịt nguội', 60000, 130, NULL, 6, 1),
('Bánh Socola', 'Bánh ngọt socola đậm vị', 50000, 80, NULL, 7, 1),
('Súp Bí Đỏ', 'Súp bí đỏ bổ dưỡng', 40000, 90, NULL, 8, 1),
('Bít Tết Bò', 'Thịt bò bít tết mềm ngon', 190000, 50, NULL, 9, 1),
('Trà Chanh', 'Trà chanh mát lạnh', 30000, 300, NULL, 10, 1);

-- INSERT dữ liệu vào bảng PAYMENT
INSERT INTO PAYMENT (PaymentMode) 
VALUES 
('Thẻ MB Bank'),
('Thẻ TP Bank'),
('Thẻ Vietcombank'),
('Thẻ Agribank'),
('Chuyển Khoản'),
('Google Pay'),
('Apple Pay'),
('Thẻ Quà Tặng'),
('Thanh Toán Bằng Mã QR'),
('Khác');

-- INSERT dữ liệu vào bảng CUSTOMER_PAYMENT
INSERT INTO CUSTOMER_PAYMENT (PaymentId, paymentName, CardNo, ExpiryDate, CvvNo, Address) 
VALUES 
(1, 'Thẻ MB Bank', '1111222233334444', '12/25', 123, '123 Đường Lê Lợi'),
(2, 'Thẻ TP Bank', '2222333344445555', '11/24', 234, '456 Đường Trần Hưng Đạo'),
(3, 'Thẻ Vietcombank', '3333444455556666', '10/23', 345, '789 Đường Nguyễn Trãi'),
(4, 'Thẻ Agribank', '4444555566667777', '09/22', 456, '321 Đường Hai Bà Trưng'),
(5, 'Thẻ MB Bank', '5555666677778888', '08/26', 567, '654 Đường Hoàng Diệu'),
(6, 'Thẻ TP Bank', '6666777788889999', '07/27', 678, '987 Đường Lý Thường Kiệt'),
(7, 'Thẻ Vietcombank', '7777888899990000', '06/28', 789, '543 Đường Nguyễn Huệ'),
(8, 'Thẻ Agribank', '8888999900001111', '05/29', 890, '876 Đường Quang Trung'),
(9, 'Thẻ MB Bank', '9999000011112222', '04/30', 901, '210 Đường Lạc Long Quân'),
(10, 'Thẻ TP Bank', '0000111122223333', '03/31', 123, '432 Đường Phan Chu Trinh');

-- INSERT dữ liệu vào bảng CARTS
INSERT INTO CARTS (ProductId, Quantity, UserId) 
VALUES 
(1, 2, 1),
(2, 1, 2),
(3, 3, 3),
(4, 1, 4),
(5, 2, 5),
(6, 4, 6),
(7, 1, 7),
(8, 2, 8),
(9, 1, 9),
(10, 5, 10);

-- INSERT dữ liệu vào bảng CONTACT
INSERT INTO CONTACT (ContactName, Email, ContactSubject, Message) 
VALUES 
('Nguyễn Văn An', 'nguyenvanan@gmail.com', 'Vấn đề đơn hàng', 'Tôi gặp vấn đề với đơn hàng của mình.'),
('Trần Thị Bình', 'tranthibinh@gmail.com', 'Hỏi về sản phẩm', 'Bạn có thể cho tôi thêm thông tin về sản phẩm không?'),
('Lê Văn Cường', 'levancuong@gmail.com', 'Lỗi thanh toán', 'Thanh toán của tôi không thành công.'),
('Phạm Thị Dung', 'phamthidung@gmail.com', 'Phản hồi', 'Dịch vụ rất tốt!'),
('Hoàng Văn Én', 'hoangvanen@gmail.com', 'Khiếu nại', 'Sản phẩm bị hỏng khi giao đến.'),
('Võ Thị Quỳnh', 'vothiquynh@gmail.com', 'Góp ý', 'Vui lòng bổ sung thêm các phương thức thanh toán.'),
('Đặng Văn Giang', 'dangvangiang@gmail.com', 'Câu hỏi', 'Đơn hàng của tôi khi nào sẽ được giao?'),
('Bùi Thị Hương', 'buithihuong@gmail.com', 'Đánh giá', 'Chất lượng thực phẩm rất tuyệt!'),
('Ngô Văn Tới', 'ngovantoi@gmail.com', 'Giao hàng chậm', 'Đơn hàng của tôi bị giao trễ.'),
('Đỗ Thị Khánh Huyền', 'dothikhanhhuyen@gmail.com', 'Hoàn tiền', 'Tôi muốn yêu cầu hoàn tiền.');
-- INSERT dữ liệu vào bảng ORDERS
INSERT INTO ORDERS (OrderNo, UserId, OrderStatus) 
VALUES 
('DH001', 1, 'Đang xử lý'),
('DH002', 2, 'Đã giao hàng'),
('DH003', 3, 'Hủy bỏ'),
('DH004', 4, 'Đang xử lý'),
('DH005', 5, 'Đang xử lý'),
('DH006', 6, 'Đã giao hàng'),
('DH007', 7, 'Đang xử lý'),
('DH008', 8, 'Hủy bỏ'),
('DH009', 9, 'Đã giao hàng'),
('DH010', 10, 'Đang xử lý');

-- INSERT dữ liệu vào bảng ORDER_PRODUCTS
INSERT INTO ORDER_PRODUCTS (OrderDetailsId, ProductId, Quantity) 
VALUES 
(1, 1, 2),
(1, 2, 1),
(2, 3, 4),
(2, 4, 2),
(3, 5, 1),
(4, 6, 3),
(5, 7, 2),
(6, 8, 5),
(7, 9, 1),
(8, 10, 2);

-- INSERT dữ liệu vào bảng ORDER_PAYMENT
INSERT INTO ORDER_PAYMENT (OrderDetailsId, PaymentId) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- INSERT dữ liệu vào bảng REVIEWS
INSERT INTO REVIEWS (UserId, ProductId, Rating, customerComment) 
VALUES 
(1, 1, 5, 'Sản phẩm rất ngon và chất lượng!'),
(2, 2, 4, 'Hương vị tốt nhưng giá hơi cao.'),
(3, 3, 5, 'Món ăn này quá tuyệt vời!'),
(4, 4, 3, 'Rau chưa tươi lắm, cần cải thiện.'),
(5, 5, 5, 'Cực kỳ hài lòng, sushi ngon tuyệt!'),
(6, 6, 4, 'Sandwich ổn nhưng bánh hơi khô.'),
(7, 7, 5, 'Bánh ngọt này thực sự rất ngon!'),
(8, 8, 4, 'Súp hơi lạt nhưng trình bày đẹp.'),
(9, 9, 5, 'Bít tết cực ngon, đáng tiền!'),
(10, 10, 3, 'Trà hơi ngọt so với khẩu vị.');

-- INSERT dữ liệu vào bảng COUPONS
INSERT INTO COUPONS (discountCode, DiscountPercentage, ExpiryDate, IsActive) 
VALUES 
('GiamGia10', 10.00, '2024-12-31', 1),
('GiamGia20', 20.00, '2024-11-30', 1),
('GiamGia30', 30.00, '2024-10-31', 0),
('GiamGia40', 40.00, '2024-09-30', 1),
('GiamGia50', 50.00, '2024-08-31', 1),
('GiamGia60', 60.00, '2024-07-31', 1),
('GiamGia70', 70.00, '2024-06-30', 1),
('GiamGia80', 80.00, '2024-05-31', 0),
('GiamGia90', 90.00, '2024-04-30', 1),
('GiamGia100', 100.00, '2024-03-31', 0);

-- INSERT dữ liệu vào bảng DELIVERY
INSERT INTO DELIVERY (OrderDetailsId, DeliveryStatus, DeliveryDate, ActualDeliveryDate, Address) 
VALUES 
(1, 'Đang giao', '2024-12-01', NULL, '123 Đường Lê Lợi'),
(2, 'Đã giao', '2024-12-02', '2024-12-03', '456 Đường Trần Hưng Đạo'),
(3, 'Hủy', NULL, NULL, '789 Đường Nguyễn Trãi'),
(4, 'Đang giao', '2024-12-04', NULL, '321 Đường Hai Bà Trưng'),
(5, 'Đang giao', '2024-12-05', NULL, '654 Đường Hoàng Diệu'),
(6, 'Đã giao', '2024-12-06', '2024-12-07', '987 Đường Lý Thường Kiệt'),
(7, 'Đang giao', '2024-12-07', NULL, '543 Đường Nguyễn Huệ'),
(8, 'Hủy', NULL, NULL, '876 Đường Quang Trung'),
(9, 'Đã giao', '2024-12-08', '2024-12-09', '210 Đường Lạc Long Quân'),
(10, 'Đang giao', '2024-12-09', NULL, '432 Đường Phan Chu Trinh');
