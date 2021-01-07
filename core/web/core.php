<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once ('libs/MysqliDb.php');
$mysqli = new mysqli ('127.0.0.1', 'dopegg', 'FhAtrm/jYFrEu81H454QjN4+', 'dopegg');
$db = new MysqliDb ($mysqli);