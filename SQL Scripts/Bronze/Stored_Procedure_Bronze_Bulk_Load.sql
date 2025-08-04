EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE 
        @start_time DATETIME, 
        @end_time DATETIME, 
        @batch_start_time DATETIME, 
        @batch_end_time DATETIME; 

    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '====================================================================';
        PRINT '>> [BRONZE LAYER LOAD STARTED] Time: ' + CONVERT(VARCHAR, @batch_start_time, 120);
        PRINT '====================================================================';

        -- CRM Tables
        PRINT '--- [SOURCE: CRM] --------------------------------------------------';

        -- bronze.crm_cust_info
        SET @start_time = GETDATE();
        PRINT '>> Loading [bronze.crm_cust_info] from cust_info.csv';
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\ADMIN\Downloads\DataWarehouse\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '   ✅ Load completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds.';

        -- bronze.crm_prd_info
        SET @start_time = GETDATE();
        PRINT '>> Loading [bronze.crm_prd_info] from prd_info.csv';
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\ADMIN\Downloads\DataWarehouse\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '   ✅ Load completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds.';

        -- bronze.crm_sales_details
        SET @start_time = GETDATE();
        PRINT '>> Loading [bronze.crm_sales_details] from sales_details.csv';
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\ADMIN\Downloads\DataWarehouse\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '   ✅ Load completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds.';

        -- ERP Tables
        PRINT '--- [SOURCE: ERP] --------------------------------------------------';

        -- bronze.erp_cust_az12
        SET @start_time = GETDATE();
        PRINT '>> Loading [bronze.erp_cust_az12] from CUST_AZ12.csv';
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\ADMIN\Downloads\DataWarehouse\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '   ✅ Load completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds.';

        -- bronze.erp_loc_a101
        SET @start_time = GETDATE();
        PRINT '>> Loading [bronze.erp_loc_a101] from LOC_A101.csv';
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\ADMIN\Downloads\DataWarehouse\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '   ✅ Load completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds.';

        -- bronze.erp_px_cat_g1v2
        SET @start_time = GETDATE();
        PRINT '>> Loading [bronze.erp_px_cat_g1v2] from PX_CAT_G1V2.csv';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\ADMIN\Downloads\DataWarehouse\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '   ✅ Load completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds.';

        SET @batch_end_time = GETDATE();
        PRINT '====================================================================';
        PRINT '>> [BRONZE LAYER LOAD COMPLETED] Time: ' + CONVERT(VARCHAR, @batch_end_time, 120);
        PRINT '   ⏱️ Total Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds.';
        PRINT '====================================================================';

    END TRY
    BEGIN CATCH
        PRINT '====================================================================';
        PRINT '❌ [ERROR] Bronze Layer Load Failed!';
        PRINT '   Error Message : ' + ERROR_MESSAGE();
        PRINT '   Error Number  : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT '   Error State   : ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '====================================================================';
    END CATCH
END;

