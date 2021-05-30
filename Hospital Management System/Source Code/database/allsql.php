mysqli_query($connection, "update appt SET ashow='N' where ano='$todel'");

mysqli_query($connection, "SELECT * from appt where ashow='Y'");

mysqli_query($connection, "SELECT pname from patient where pno='$row[2]'");

mysqli_query($connection, "SELECT dname from doct where dno='$row[1]'");

mysqli_query($connection, "SELECT * from appt where ashow='N'");

mysqli_query($connection, "SELECT dname from doct where dno='$row[1]'");

mysqli_query($connection, "SELECT * from patient where pshow='Y' order by pname;");

mysqli_query($connection, "SELECT * from doct where dshow='Y' order by dname;");

mysqli_query($connection, "insert into appt(adoctor,apatient,atime,adate,ashow)values('".$doc."','".$pat."','".$tim."','".$dat."','Y')");

mysqli_query($connection, "update appt set ashow='Y' where ano='$rno'");


mysqli_query($connection, "update doct SET dshow='N' where dno='$todel' ;");

mysqli_query($connection, "SELECT * from doct where dshow='N' order by dname;");

mysqli_query($connection, "SELECT * from doct where dno='".$rno."'");

mysqli_query($connection, "insert into doct(dname,dspec,dshow) values('".$name."','".$spec."','Y')");

mysqli_query($connection, "update doct set dshow='Y' where dno='$rno'");

mysqli_query($connection, "update doct set dname='".$name."',dspec='".$spec."' where dno='".$rno."'");


mysqli_query($connection, "update Patient SET pshow='N' where pno='$todel' ;");

mysqli_query($connection, "SELECT * from patient where pshow='N' order by pname;");

mysqli_query($connection, "SELECT * from patient where pno='".$rnooo."'");

mysqli_query($connection, "insert into patient(pname,paddr,psex,pshow) values('".$name."','".$addr."','".$sex."','Y')");

mysqli_query($connection, "update Patient set pshow='Y' where pno='$rno'");

mysqli_query($connection, "update patient set pname='".$name."',psex='".$sex."',paddr='".$addr."' where pno='".$rno."'");