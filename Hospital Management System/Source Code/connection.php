<?php 
session_start();
$connection = mysqli_connect('localhost', 'root', '');
$select_db = mysqli_select_db($connection, 'hospital');
 
if($_SESSION['admin']=="")
{
header('index.php');
}
 
?>
<h3 style="background:#990000;padding:20px;color:#FFFFFF;margin:0px">
	<span>Hello Admin - Yaswanth !</span>
	<span style="float:right"><a style="color:#FFFFFF" href="logout.php">Logout</a></span>
</h3>