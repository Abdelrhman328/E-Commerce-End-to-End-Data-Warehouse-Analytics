USE E_Commerce_Warehouse
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE NAME = 'Bronze')
BEGIN
    EXEC ('CREATE SCHEMA Bronze')
END
GO

IF OBJECT_ID('Bronze.Customers', 'U') IS NOT NULL
    DROP TABLE Bronze.Customers;
CREATE TABLE Bronze.Customers(
    customerId              NVARCHAR(100),
    customerUniqueId        NVARCHAR(100),
    customerZipCodePrefix   NVARCHAR(20),
    customerCity            NVARCHAR(255),
    customerState           NVARCHAR(10)
)
PRINT('Table Customers Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.Geolocation', 'U') IS NOT NULL
    DROP TABLE Bronze.Geolocation;
CREATE TABLE Bronze.Geolocation(
    geolocationZipCodePrefix NVARCHAR(50),
    geolocationLat           FLOAT,
    geolocationLng           FLOAT,
    geolocationCity          NVARCHAR(100),
    geolocationState         NVARCHAR(100)
)
PRINT('Table Geolocation Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.orderItems', 'U') IS NOT NULL
    DROP TABLE Bronze.orderItems;
CREATE TABLE Bronze.orderItems(
    orderId             NVARCHAR(100),
    orderItemId         INT,
    productId           NVARCHAR(100),
    sellerId            NVARCHAR(100),
    shippingLimitDate   NVARCHAR(50),
    price               FLOAT,
    freightValue        FLOAT
)
PRINT('Table orderItems Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.orderPayments', 'U') IS NOT NULL
    DROP TABLE Bronze.orderPayments;
CREATE TABLE Bronze.orderPayments(
    orderId                 NVARCHAR(100),
    paymentSequential       INT,
    paymentType             NVARCHAR(50),
    paymentInstallments     INT,
    paymentValue            FLOAT
)
PRINT('Table orderPayments Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.orderReviews', 'U') IS NOT NULL
    DROP TABLE Bronze.orderReviews;
CREATE TABLE Bronze.orderReviews(
    reviewId                NVARCHAR(MAX),
    orderId                 NVARCHAR(MAX),
    reviewScore             NVARCHAR(MAX),
    reviewCommentTitle      NVARCHAR(MAX),
    reviewCommentMessage    NVARCHAR(MAX),
    reviewCreationDate      NVARCHAR(MAX),
    reviewAnswerTimeStamp   NVARCHAR(MAX)
);
PRINT('Table orderReviews Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.Orders', 'U') IS NOT NULL
    DROP TABLE Bronze.Orders;
CREATE TABLE Bronze.Orders(
    orderId                     NVARCHAR(100),
    customerId                  NVARCHAR(100),
    orderStatus                 NVARCHAR(50),
    orderPurchaseTimestamp      NVARCHAR(50),
    orderApprovedAt             NVARCHAR(50),
    orderDeliveredCarrierDate   NVARCHAR(50),
    orderDeliveredCustomerDate  NVARCHAR(50),
    orderEstimatedDeliveryDate  NVARCHAR(50)
)
PRINT('Table Orders Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.Products', 'U') IS NOT NULL
    DROP TABLE Bronze.Products;
CREATE TABLE Bronze.Products(
    productId                   NVARCHAR(100),
    productCategoryName         NVARCHAR(255),
    productNameLength           INT,
    productDescriptionLength    INT,
    productPhotosQty            INT,
    productWeightG              INT,
    productLengthCm             INT,
    productHeightCm             INT,
    productWidthCm              INT
)
PRINT('Table Products Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.Sellers', 'U') IS NOT NULL
    DROP TABLE Bronze.Sellers;
CREATE TABLE Bronze.Sellers(
    sellerId            NVARCHAR(100),
    sellerZipCodePrefix NVARCHAR(100),
    sellerCity          NVARCHAR(100),
    sellerState         NVARCHAR(100)
)
PRINT('Table Sellers Created Successfully (Bronze)')
GO

IF OBJECT_ID('Bronze.Translation', 'U') IS NOT NULL
    DROP TABLE Bronze.Translation;
CREATE TABLE Bronze.Translation(
    productCategoryName        NVARCHAR(255),
    productCategoryNameEnglish NVARCHAR(255)
)
PRINT('Table Translation Created Successfully (Bronze)')
GO

PRINT('All Tables Created Successfully in Bronze Layer')