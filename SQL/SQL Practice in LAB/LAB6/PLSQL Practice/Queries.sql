set serveroutput on

declare
n number :=&n;
begin
if mod(n,2)=0
then
	dbms_output.put_line('Entered number is even');
end if;
end;
/

declare
num1 number :=&num1;
num2 number :=&num2;
num3 number :=&num3;
begin
if num1>num2 and num1>num3 then
dbms_output.put_line(num1||' is greater.');
elsif num2>num1 and num2>num3 then
dbms_output.put_line(num2||' is greater.');
else
dbms_output.put_line(num3||' is greater.');
end if;
end;
/

declare
n number;
fact number :=1;
i number;
begin
n :=&n;
for i in 1..n
loop
fact :=fact*i;
end loop;
dbms_output.put_line('Factorial for '||n||' is = '||fact);
end;
/

declare
	n number;
	i number;
 
begin
	n:=&n;
	
	for i in 1..10
	loop
		dbms_output.put_line(n||' x '||i||' = '||n*i);
	end loop;
end;
/

declare
	n number;
	i number;
	flag number;
 
begin
	i:=2;
	flag:=1;
	n:=&n;
 
	for i in 2..n/2
	loop
		if mod(n,i)=0
		then
			flag:=0;
			exit;
		end if;
	end loop;
 
	if flag=1
	then
		dbms_output.put_line('Entered number '||n||' is prime.');
	else
		dbms_output.put_line('Entered number '||n||' is not a prime.');
	end if;
end;
/

DECLARE 
string varchar2(50):='&string';
counter int:=length(string);
BEGIN
LOOP exit 
WHEN counter=0;
exit 
WHEN not(substr(string,counter,1)=substr(string,((length(string)+1)-counter),1));
counter:=counter-1;
END LOOP;
IF counter=0 THEN dbms_output.put_line(string||' is a Palindrome.');
ELSE dbms_output.put_line(string||' is not a Palindrome.');
END IF;
END;
/

declare
n number;
i number;
rev number:=0;
r number;
begin
n:=&n;
dbms_output.put_line('Entered Original number = '||n);
while n>0
loop
r:=mod(n,10);
rev:=(rev*10)+r;
n:=trunc(n/10);
end loop;
dbms_output.put_line('After reversing the number = '||rev);
end;
/