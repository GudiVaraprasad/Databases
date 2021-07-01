set serveroutput on

 -- Reversing a string --
declare
	str1 varchar2(20):='&str';
	str2 varchar2(20);
	len number;
	i number;
begin
	len:=length(str1);
	for i in reverse 1..len
	loop
		str2:=str2 || substr(str1,i,1);
	end loop;
	dbms_output.put_line('Reverse of the input String is : '||str2);
end;
/


 -- Palindrome or not --
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


 -- Fibonacci series --
DECLARE
	first number:=0;
	second number:=1;
	third number;
	n number:=&n;
	i number;
begin
	dbms_output.put_line('Fibonacci series is : ');
	dbms_output.put_line(first);
	dbms_output.put_line(second);	
	for i in 2..n
	loop
		third:=first+second;
		first:=second;
		second:=third;
		dbms_output.put_line(third);
	end loop;
end;
/


 -- Prime Number or not --
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


 -- Armstrong Number or not --
declare
    n number;
    s number;
    r number;
    len number;
    m number;
begin
	n:=&n;
	s:=0;
    m:=n;
    len:=length(to_char(n));
    while n>0
    loop
        r:=mod(n,10);
        s:=s+power(r,len);
        n:=trunc(n/10);
    end loop;
    if m=s
    then
        dbms_output.put_line('Entered number '||n||' is an Armstrong Number');
    else
        dbms_output.put_line('Entered number '||n||' is not an Armstrong Number');
    end if; 
end;
/