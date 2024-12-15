CREATE DATABASE IF NOT EXISTS MyRestaurantDB;
USE MyRestaurantDB;

-- Bảng người dùng
CREATE TABLE IF NOT EXISTS USERS (
    UserId INT AUTO_INCREMENT PRIMARY KEY,      -- Mã người dùng tự tăng
    FullName VARCHAR(50) NOT NULL,              -- Tên đầy đủ của người dùng
    Username VARCHAR(50) UNIQUE NOT NULL,       -- Tên đăng nhập, duy nhất
    Mobile VARCHAR(50),                         -- Số điện thoại người dùng
    Email VARCHAR(50),                          -- Email người dùng
    Address TEXT,                               -- Địa chỉ người dùng
    PostCode VARCHAR(50),                       -- Mã bưu điện
    UserPass VARCHAR(255) NOT NULL,             -- Mật khẩu của người dùng (đã mã hóa)
    ImageUrl TEXT,                              -- URL hình đại diện của người dùng
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo tài khoản
);

-- Bảng danh mục sản phẩm
CREATE TABLE IF NOT EXISTS CATEGORIES (
    CategoryId INT AUTO_INCREMENT PRIMARY KEY , -- Mã danh mục tự tăng
    FoodName VARCHAR(50) NOT NULL,             -- Tên danh mục thực phẩm
    ImageUrl VARCHAR(255),                     -- URL hình ảnh của danh mục
    IsActive BOOLEAN NOT NULL DEFAULT 1,       -- Trạng thái hoạt động (1: hoạt động, 0: không hoạt động)
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo danh mục
);

-- Bảng sản phẩm
CREATE TABLE IF NOT EXISTS PRODUCTS (
    ProductId INT AUTO_INCREMENT PRIMARY KEY , -- Mã sản phẩm tự tăng
    ProductName VARCHAR(50) NOT NULL,          -- Tên sản phẩm
    DescriptionProducts TEXT,                  -- Mô tả sản phẩm
    Price DECIMAL(18, 2) NOT NULL,             -- Giá sản phẩm (2 chữ số thập phân)
    Quantity INT NOT NULL,                     -- Số lượng sản phẩm
    ImageUrl TEXT,                             -- URL hình ảnh sản phẩm
    CategoryId INT NOT NULL,                   -- Mã danh mục (liên kết với bảng CATEGORIES)
    IsActive BOOLEAN NOT NULL DEFAULT 1,           -- Trạng thái hoạt động (1: hoạt động, 0: không hoạt động)
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo sản phẩm
);

-- Bảng phương thức thanh toán
CREATE TABLE IF NOT EXISTS PAYMENT (
    PaymentId INT AUTO_INCREMENT PRIMARY KEY , -- Mã phương thức thanh toán tự tăng
    PaymentMode VARCHAR(50) NOT NULL           -- Phương thức thanh toán (ví dụ: thẻ, tiền mặt, ví điện tử)
);

-- Bảng thông tin thanh toán của khách hàng
CREATE TABLE IF NOT EXISTS CUSTOMER_PAYMENT (
    CustomerPaymentId INT AUTO_INCREMENT PRIMARY KEY, -- Mã thanh toán của khách hàng tự tăng
    PaymentId INT NOT NULL,                           -- Mã phương thức thanh toán (liên kết với bảng PAYMENT)
    PaymentName VARCHAR(50) NOT NULL,                -- Tên phương thức thanh toán
    CardNo VARCHAR(50) NOT NULL,                     -- Số thẻ thanh toán
    ExpiryDate VARCHAR(50) NOT NULL,                 -- Ngày hết hạn của thẻ
    CvvNo INT NOT NULL,                              -- Mã CVV của thẻ
    Address TEXT                                     -- Địa chỉ thanh toán
);

-- Bảng giỏ hàng
CREATE TABLE IF NOT EXISTS CARTS (
    CartId INT AUTO_INCREMENT PRIMARY KEY ,	         -- Mã giỏ hàng tự tăng
    ProductId INT NOT NULL,                          -- Mã sản phẩm (liên kết với bảng PRODUCTS)
    Quantity INT NOT NULL ,   					     -- Số lượng sản phẩm trong giỏ hàng (phải lớn hơn 0)
    UserId INT NOT NULL                              -- Mã người dùng (liên kết với bảng USERS)
);

-- Bảng liên hệ
CREATE TABLE IF NOT EXISTS CONTACT (
    ContactId INT AUTO_INCREMENT PRIMARY KEY ,		  -- Mã liên hệ tự tăng
    ContactName VARCHAR(50) NOT NULL,                -- Tên người liên hệ
    Email VARCHAR(50) NOT NULL,                      -- Email của người liên hệ
    ContactSubject VARCHAR(200),                     -- Chủ đề liên hệ
    Message TEXT,                                    -- Nội dung tin nhắn
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo liên hệ
);

-- Bảng đơn hàng
CREATE TABLE IF NOT EXISTS ORDERS (
    OrderDetailsId INT AUTO_INCREMENT PRIMARY KEY ,  -- Mã chi tiết đơn hàng tự tăng
    OrderNo VARCHAR(255) UNIQUE NOT NULL,            -- Số đơn hàng (duy nhất)
    UserId INT NOT NULL,                             -- Mã người dùng (liên kết với bảng USERS)
    OrderStatus VARCHAR(50) NOT NULL DEFAULT 'Đang xử lý', -- Trạng thái đơn hàng ('Đang xử lý', 'Đã giao hàng', 'Hủy bỏ',...)
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo đơn hàng
);

-- Bảng sản phẩm trong đơn hàng
CREATE TABLE IF NOT EXISTS ORDER_PRODUCTS (
    OrderDetailsId INT NOT NULL,                    -- Mã chi tiết đơn hàng (liên kết với bảng ORDERS)
    ProductId INT NOT NULL,                         -- Mã sản phẩm (liên kết với bảng PRODUCTS)
    Quantity INT NOT NULL ,  					   -- Số lượng sản phẩm
    PRIMARY KEY (OrderDetailsId, ProductId)        -- Khóa chính kết hợp (OrderDetailsId và ProductId)
);

-- Bảng thanh toán của đơn hàng
CREATE TABLE IF NOT EXISTS ORDER_PAYMENT (
    OrderDetailsId INT ,		                   -- Mã chi tiết đơn hàng (liên kết với bảng ORDERS)
    PaymentId INT NOT NULL                         -- Mã phương thức thanh toán (liên kết với bảng PAYMENT)
);

-- Bảng đánh giá sản phẩm
CREATE TABLE IF NOT EXISTS REVIEWS (
    ReviewId INT AUTO_INCREMENT PRIMARY KEY ,		-- Mã đánh giá tự tăng
    UserId INT NOT NULL,                            -- Mã người dùng (liên kết với bảng USERS)
    ProductId INT NOT NULL,                         -- Mã sản phẩm (liên kết với bảng PRODUCTS)
    Rating INT NOT NULL , 							-- Đánh giá (1-5 sao)
    customerComment TEXT,                                   -- Nội dung nhận xét
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo đánh giá
);

-- Bảng mã giảm giá
CREATE TABLE IF NOT EXISTS COUPONS (
    CouponId INT AUTO_INCREMENT PRIMARY KEY ,     		   -- Mã giảm giá tự tăng
    discountCode VARCHAR(50) UNIQUE NOT NULL,               -- Mã giảm giá (duy nhất)
    DiscountPercentage DECIMAL(5, 2) NOT NULL , -- Phần trăm giảm giá (0-100%)
    ExpiryDate DATETIME NOT NULL,                   -- Ngày hết hạn
    IsActive BOOLEAN NOT NULL DEFAULT 1,            -- Trạng thái hoạt động (1: hoạt động, 0: hết hạn)
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo mã giảm giá
);

-- Bảng giao hàng
CREATE TABLE IF NOT EXISTS DELIVERY (
    DeliveryId INT AUTO_INCREMENT PRIMARY KEY,    	 -- Mã giao hàng tự tăng
    OrderDetailsId INT NOT NULL,                    -- Mã chi tiết đơn hàng (liên kết với bảng ORDERS)
    DeliveryStatus VARCHAR(50) NOT NULL DEFAULT 'Đang giao', -- Trạng thái giao hàng (Đang giao, Đã giao,Hủy)
    DeliveryDate DATETIME,                          -- Ngày dự kiến giao hàng
    ActualDeliveryDate DATETIME,                    -- Ngày thực tế giao hàng
    Address TEXT NOT NULL,                          -- Địa chỉ giao hàng
    CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Thời gian tạo đơn giao hàng
);
