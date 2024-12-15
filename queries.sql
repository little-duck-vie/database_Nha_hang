use MyRestaurantDB;

# INNER JOIN
# Danh sách tất cả các sản phẩm trong đơn hàng kèm theo thông tin khách hàng và trạng thái đơn hàng.
SELECT 
    o.OrderNo,                      -- Số đơn hàng
    o.OrderStatus,                  -- Trạng thái đơn hàng
    u.FullName AS CustomerName,     -- Tên khách hàng
    u.Mobile AS CustomerMobile,     -- Số điện thoại khách hàng
    u.Email AS CustomerEmail,       -- Email khách hàng
    p.ProductName,                  -- Tên sản phẩm
    op.Quantity,                    -- Số lượng sản phẩm trong đơn hàng
    p.Price,                        -- Giá sản phẩm
    (op.Quantity * p.Price) AS TotalPrice -- Tổng tiền sản phẩm (Số lượng * Giá)
FROM 
    ORDERS o
INNER JOIN 
    USERS u ON o.UserId = u.UserId           -- Kết nối với bảng USERS (thông tin khách hàng)
INNER JOIN 
    ORDER_PRODUCTS op ON o.OrderDetailsId = op.OrderDetailsId -- Kết nối với bảng ORDER_PRODUCTS (sản phẩm trong đơn hàng)
INNER JOIN 
    PRODUCTS p ON op.ProductId = p.ProductId;  -- Kết nối với bảng PRODUCTS (sản phẩm)


# Tìm danh sách các sản phẩm trong giỏ hàng của từng người dùng.
SELECT 
    u.FullName AS CustomerName,   -- Tên khách hàng
    u.Email AS CustomerEmail,     -- Email khách hàng
    u.Mobile AS CustomerMobile,   -- Số điện thoại khách hàng
    p.ProductName,                -- Tên sản phẩm
    c.Quantity,                   -- Số lượng sản phẩm trong giỏ
    p.Price,                      -- Giá sản phẩm
    (c.Quantity * p.Price) AS TotalPrice -- Tổng tiền sản phẩm (Số lượng * Giá)
FROM 
    CARTS c
INNER JOIN 
    USERS u ON c.UserId = u.UserId         -- Kết nối với bảng USERS (thông tin khách hàng)
INNER JOIN 
    PRODUCTS p ON c.ProductId = p.ProductId;  -- Kết nối với bảng PRODUCTS (thông tin sản phẩm)



# OUTER JOIN
# Danh sách tất cả các danh mục sản phẩm và các sản phẩm tương ứng (bao gồm danh mục không có sản phẩm nào).
SELECT 
    c.FoodName AS CategoryName,  -- Tên danh mục
    p.ProductName,               -- Tên sản phẩm
    p.Price,                     -- Giá sản phẩm
    p.Quantity                   -- Số lượng sản phẩm
FROM 
    CATEGORIES c
LEFT OUTER JOIN 
    PRODUCTS p ON c.CategoryId = p.CategoryId;  -- Kết nối với bảng PRODUCTS (sản phẩm)


# Liệt kê tất cả người dùng và các đơn hàng của họ (bao gồm người dùng chưa có đơn hàng).
SELECT 
    u.FullName AS UserName,         -- Tên người dùng
    u.Email AS UserEmail,           -- Email người dùng
    o.OrderNo AS OrderNumber,      -- Số đơn hàng
    o.OrderStatus AS OrderStatus,  -- Trạng thái đơn hàng
    o.CreatedDate AS OrderDate     -- Thời gian tạo đơn hàng
FROM 
    USERS u
LEFT OUTER JOIN 
    ORDERS o ON u.UserId = o.UserId;  -- Kết nối với bảng ORDERS để lấy thông tin đơn hàng



# Sử dụng subquery trong WHERE
# Tìm tất cả các sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm.
SELECT 
    ProductName,       -- Tên sản phẩm
    Price             -- Giá sản phẩm
FROM 
    PRODUCTS
WHERE 
    Price > (SELECT AVG(Price) FROM PRODUCTS);  -- Subquery tính giá trung bình của tất cả sản phẩm


# Tìm tất cả khách hàng có giá trị đơn hàng cao nhất.
SELECT 
    u.FullName,          -- Tên khách hàng
    u.Email,             -- Email khách hàng
    SUM(op.Quantity * p.Price) AS TotalOrderValue  -- Tổng giá trị đơn hàng của khách hàng
FROM 
    USERS u
JOIN 
    ORDERS o ON u.UserId = o.UserId
JOIN 
    ORDER_PRODUCTS op ON o.OrderDetailsId = op.OrderDetailsId
JOIN 
    PRODUCTS p ON op.ProductId = p.ProductId
GROUP BY 
    u.UserId
HAVING 
    SUM(op.Quantity * p.Price) = (SELECT MAX(TotalOrderValue)
                                  FROM (SELECT SUM(op.Quantity * p.Price) AS TotalOrderValue
                                        FROM ORDERS o
                                        JOIN ORDER_PRODUCTS op ON o.OrderDetailsId = op.OrderDetailsId
                                        JOIN PRODUCTS p ON op.ProductId = p.ProductId
                                        GROUP BY o.UserId) AS OrderTotals);


# Sử dụng subquery trong FROM
# Tổng số lượng sản phẩm trong giỏ hàng của từng người dùng, cùng thông tin người dùng.
SELECT 
    u.UserId, 
    u.FullName, 
    u.Email, 
    COALESCE(cart.TotalQuantity, 0) AS TotalProductsInCart
FROM 
    USERS u
LEFT JOIN 
    (SELECT 
        c.UserId, 
        SUM(c.Quantity) AS TotalQuantity
     FROM 
        CARTS c
     GROUP BY 
        c.UserId) AS cart
ON 
    u.UserId = cart.UserId;


# Tổng số lượng sản phẩm được bán theo từng danh mục.
SELECT 
    c.FoodName AS CategoryName, 
    SUM(op.Quantity) AS TotalQuantitySold
FROM 
    ORDER_PRODUCTS op
JOIN 
    PRODUCTS p ON op.ProductId = p.ProductId
JOIN 
    CATEGORIES c ON p.CategoryId = c.CategoryId
GROUP BY 
    c.FoodName;


# Sử dụng GROUP BY và các hàm tổng hợp
# Tính tổng giá trị đơn hàng của từng khách hàng.
SELECT 
    u.FullName,                                -- Tên khách hàng
    o.UserId,                                  -- ID khách hàng
    SUM(op.Quantity * p.Price) AS TotalOrderValue  -- Tổng giá trị đơn hàng
FROM 
    ORDERS o
JOIN 
    ORDER_PRODUCTS op ON o.OrderDetailsId = op.OrderDetailsId
JOIN 
    PRODUCTS p ON op.ProductId = p.ProductId
JOIN 
    USERS u ON o.UserId = u.UserId            -- Kết hợp với bảng USERS để lấy tên khách hàng
GROUP BY 
    o.UserId, u.FullName;                     -- Nhóm theo UserId và FullName


# Tính tổng số sản phẩm bán được và giá trị bán hàng của từng danh mục.
SELECT 
    c.FoodName AS CategoryName,                      -- Tên danh mục
    SUM(op.Quantity) AS TotalQuantitySold,            -- Tổng số lượng sản phẩm bán được
    SUM(op.Quantity * p.Price) AS TotalSalesValue    -- Tổng giá trị bán hàng
FROM 
    ORDER_PRODUCTS op
JOIN 
    PRODUCTS p ON op.ProductId = p.ProductId         -- Kết hợp bảng ORDER_PRODUCTS và PRODUCTS
JOIN 
    CATEGORIES c ON p.CategoryId = c.CategoryId     -- Kết hợp với bảng CATEGORIES để lấy thông tin danh mục
GROUP BY 
    c.CategoryId, c.FoodName;                       -- Nhóm theo danh mục



