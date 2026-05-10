/*
==========================================================================================================
E-COMMERCE DATA WAREHOUSE SETUP
==========================================================================================================
Script Purpose:
This script initializes the core architecture for E-Commerce Data Warehouse
It performes the Following actions:
	1. Check for the existence of 'E_Commerce_Warehouse' Datebase & Drop it to ensure a clean state
	2. Create a A New 'E_Commerce_Warehouse' Database With A Medallion Architecture Schemas:
		- Bronze : For Raw Data
		- Silver : For Cleaning and Processed data
		- Gold : For Create the Schemas for the tables
WARINING:
This Script Contains destructive operations.
if database already exists, it will be permanently deleted with all Tables, Views and Data
PLEASE: Notice This and Have a Backup Before Executing.
BY \ Abdelrahman Ahmed
==========================================================================================================
*/

USE master;
GO



IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'E_Commerce_Warehouse')
BEGIN 
	ALTER DATABASE E_Commerce_Warehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE E_Commerce_Warehouse;
END
GO


--Create Warehouse--

USE master;
GO
CREATE DATABASE E_Commerce_Warehouse
GO
USE E_Commerce_Warehouse
GO
--Create Medallion Architecture Schemas For Data Organization--
CREATE SCHEMA Bronze;
GO
CREATE SCHEMA Silver;
GO
CREATE SCHEMA Gold;