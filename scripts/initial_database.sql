/*
=============================================================
Create Database and Schemas
=============================================================

Script Purpose:
    This script initializes the DataWarehouse project environment.
    It creates the 'DataWarehouse' database and establishes the
    Bronze, Silver, and Gold schemas used in the Medallion
    Architecture for data warehousing.

    Schema Overview:
    - bronze : Stores raw data imported from source systems.
    - silver : Stores cleaned, validated, and transformed data.
    - gold   : Stores business-ready data optimized for reporting
               and analytical queries.

WARNING:
    If the 'DataWarehouse' database already exists, this script
    will delete and recreate it. Executing this script will
    permanently remove all existing database objects and data.

    Ensure that any important data has been backed up before
    running this script in a production or shared environment.
*/
USE master;
GO

----------------------------------------------------------
-- Check if the DataWarehouse database already exists
----------------------------------------------------------
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    -- Close all active connections to the database
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Delete the existing database
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas for all three layer
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
