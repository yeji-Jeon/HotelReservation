<?php
ini_set("display_errors",1);
require_once 'jq-config.php';
// include the jqGrid Class
require_once ABSPATH."php/PHPSuito/jqGrid.php";
// include the driver class
require_once ABSPATH."php/PHPSuito/DBdrivers/jqGridPdo.php";
// Connection to the server
$conn = new PDO(DB_DSN,DB_USER,DB_PASSWORD);
// Tell the db that we use utf-8
$conn->query("SET NAMES utf8");

// Create the jqGrid instance
$grid = new jqGridRender($conn);
// Write the SQL Query
$grid->SelectCommand = 'SELECT CustomerID, CompanyName, Phone, PostalCode, City FROM customers';
// Set the table to where you add the data
// Set output format to json
$grid->dataType = 'json';
// Enjoy
$grid->queryGrid();

