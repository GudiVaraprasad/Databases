<?php
error_reporting(1);
$rno=$_GET["rno"];
 require('connection.php');
 $ssqll2="update appt set ashow='Y' where ano='$rno'";
 $ss2=mysqli_query($connection,$ssqll2);
 header('location:alist.php');
 ?>