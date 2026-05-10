/*
	=========================================================================================================================================
	Stored Procedure: Bronze.load_Bronze
	Description:
		- Load raw data from CSV Files To Bronze Layer
		- Perfom Valitation to ensure row counts match the Expected Values
		- Tracks duration per Table
		- Handels errors Using Try___ Catch
    Note: Orders Review Table Is Upload as a NVARCHAR to upload Successfully.
	Active : EXEC Bronze.load_Bronze;
	By\ Abdelrahman Ahmed
	=========================================================================================================================================
*/
USE E_Commerce_Warehouse
GO

CREATE OR ALTER PROCEDURE Bronze.load_Bronze AS
BEGIN
    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @row_count INT

    -----------------------------------------------------------
    -- 1: Customers
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.Customers;
        BULK INSERT Bronze.Customers
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_customers_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\customers_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 99441 
            PRINT 'Error: Customers count mismatch. Expected 99441, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'Customers loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Customers Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 2: Geolocation
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.Geolocation;
        BULK INSERT Bronze.Geolocation
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_geolocation_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\geolocation_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 1000163
            PRINT 'Error: Geolocation count mismatch. Expected 1000163, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'Geolocation loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Geolocation Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 3: Order Items
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.orderItems;
        BULK INSERT Bronze.orderItems
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_order_items_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\order_items_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 112650
            PRINT 'Error: orderItems count mismatch. Expected 112650, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'orderItems loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'orderItems Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 4: Order Payments
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.orderPayments;
        BULK INSERT Bronze.orderPayments
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_order_payments_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\order_payments_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 103886
            PRINT 'Error: orderPayments count mismatch. Expected 103886, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'orderPayments loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'orderPayments Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 5: Order Reviews
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.orderReviews;
        BULK INSERT Bronze.orderReviews
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_order_reviews_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\order_reviews_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 99225 -- do this to take the data and will solve in Silver Layer
            PRINT 'Error: orderReviews count mismatch. Expected 99225, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'orderReviews loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'orderReviews Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 6: Orders
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.Orders;
        BULK INSERT Bronze.Orders
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_orders_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\orders_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 99441
            PRINT 'Error: Orders count mismatch. Expected 99441, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'Orders loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Orders Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 7: Products
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.Products;
        BULK INSERT Bronze.Products
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_products_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\products_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 32951
            PRINT 'Error: Products count mismatch. Expected 32951, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'Products loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Products Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 8: Sellers
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.Sellers;
        BULK INSERT Bronze.Sellers
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\olist_sellers_dataset.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\sellers_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 3095
            PRINT 'Error: Sellers count mismatch. Expected 3095, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'Sellers loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Sellers Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

    -----------------------------------------------------------
    -- 9: Translation
    -----------------------------------------------------------
    BEGIN TRY
        SET @start_time = GETDATE()
        TRUNCATE TABLE Bronze.Translation;
        BULK INSERT Bronze.Translation
        FROM 'D:\Olist_Project\Olist_E-Commerce_Dataset\product_category_name_translation.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK,
            ERRORFILE = 'D:\Olist_Project\Error_File\translation_errors.log',
            MAXERRORS = 100
        );
        SET @row_count = @@ROWCOUNT;
        IF @row_count <> 71
            PRINT 'Error: Translation count mismatch. Expected 71, but got ' + CAST(@row_count AS VARCHAR);
        ELSE
        BEGIN
            SET @end_time = GETDATE()
            PRINT 'Translation loaded successfully in ' + CAST(DATEDIFF(second, @start_time, @end_time) AS VARCHAR) + ' seconds.';
        END
    END TRY
    BEGIN CATCH
        PRINT 'Translation Table: FAILED. Error: ' + ERROR_MESSAGE();
    END CATCH

END
GO
EXEC Bronze.load_Bronze