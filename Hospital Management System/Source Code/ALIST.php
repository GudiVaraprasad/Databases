<?php
include 'connection.php';
?>
<html>
 <head>
  <title>HOSPITAL MANAGEMENT SYSTEM</title>
  <link rel="stylesheet" href="css/bootstrap.css"/>
 </head> 
 <body>
<table class="table table-bordered">

<tr bgcolor=blue><td align=center><font SIZE=6 color=white>HOSPITAL
MANAGEMENT SYSTEM</font></td></tr>
<tr><td><table align=center width=750 cellspacing=0 cellpadding=5>
<tr><td align=center><a href=dlist.php>Doctors</td><td align=center><a
href=plist.php>Patients</td><td align=center><a
href=alist.php>Appointments</td>
</table></td></tr>
<tr bgcolor=red><td ><font size=4 color=white>Appointments
List</font></td></tr>
<tr><td><a href=app.php>Add New Appointments</a></td></tr>
<tr><td><table width=750 cellspacing=0 cellpadding=5>
<tr bgcolor=#ccccc><td align=center>S No</td><td align=center>Patient
Name</td><td align=center>Doctor
Name</td><td align=center>Time</td>
<td align=center>Date</td><td
align=center>Options</td></tr>
<?php
if (isset($_GET['rno'])) {

if($_GET['rno']!=null)
{
$todel=$_GET['rno'];
$ssqll="update appt SET ashow='N' where ano='$todel';";
$rss=mysqli_query($connection,$ssqll);
}
}
$ssql3="SELECT * from appt where ashow='Y'";
$rs1=mysqli_query($connection,$ssql3);
$sno=1;
while( $row=mysqli_fetch_array($rs1)) {
$ssql4="SELECT pname from patient where pno='$row[2]'";
$rs2=mysqli_query($connection,$ssql4);

$ssql5="SELECT dname from doct where dno='$row[1]'";
$rs3=mysqli_query($connection,$ssql5);

$rs22=mysqli_fetch_assoc($rs2);
$rs33=mysqli_fetch_assoc($rs3);
 echo "<tr><td>$sno</td><td>$rs22[pname]</td><td>$rs33[dname]</td><td>$row[3]</td><td>$row[5]</td><td><a
href=alist.php?rno=".$row[0].">Delete</a></td></tr>";
 $sno++;
}
if ($sno==1) echo "<tr><td align=center><font size=4 color=red>Records
Not Found</font></td></tr>";?>
</table></td></tr>
<tr><td align=center><hr></td></tr>
<tr bgcolor=red><td><font size=4 color=white>Deleted
Records</font></td></tr>
<tr><td><table width=750 cellspacing=0 cellpadding=5>
<tr bgcolor=#ccccc><td align=center>S No</td><td align=center>Patient
Name</td><td align=center>Doctor
Name</td><td align=center>Time</td>
<td align=center>Date</td><td
align=center>Options</td></tr>
<?php
$ssql6="SELECT * from appt where ashow='N'";
$rs1=mysqli_query($connection,$ssql6);

$sno=1;
while( $row=mysqli_fetch_array($rs1)) {

$ssql7="SELECT pname from patient where pno='$row[2]'";
$rs2=mysqli_query($connection,$ssql7);

$ssql8="SELECT dname from doct where dno='$row[1]'";
$rs3=mysqli_query($connection,$ssql8);

 echo "<tr><td>$sno</td><td>$rs22[pname]</td><td>$rs33[dname]</td><td>$row[3]</td><td>$row[5]</td><td><a
href=aundel.php?rno=".$row[0].">Undelete</a></td></tr>";
 $sno++;
}
if ($sno==1) echo "<tr><td align=center><font size=4 color=red>Records
Not Found</font></td></tr>";
?>
</table></td></tr>
</table>
</body>
</html> 