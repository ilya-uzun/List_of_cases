program lab8_a;   //������� � 23
// ������ � ������������ 
uses crt;
type data=record
          fio:string[30];
          godr,godo:integer;
          ates:record // re�ord ������ 
               mat,fiz,rus:integer;
               end;
          haus:boolean;
          ekz:record
              mat,fiz,rus:integer;
              end;
          end;
var stu:data;
    files:file of data;
    ifile:textfile;
    keys,b:char;
    a:string;
    cr,er:integer;  {counter}
procedure vvod;
begin
  writeln('      ������ ������ �� ����������t');
   write('������� ��� ��������..');readln(stu.fio);
   write('��� ��������..........');readln(stu.godr);
   write('��� ��������� �����...');readln(stu.godo);
   writeln('      ������ � ��������');
   write('����������.....');readln(stu.ates.mat);
   write('������.........');readln(stu.ates.fiz);
   write('������� ����...');readln(stu.ates.rus);
   writeln('��������� �� � ��������� (1-��/2-���)');
   keys:=readkey;if keys='1' then stu.haus:=true
                             else stu.haus:=false;
   writeln('      ������ �� ������������� ���������');
   write('����������.....');readln(stu.ekz.mat);
   write('������.........');readln(stu.ekz.fiz);
   write('������� ����...');readln(stu.ekz.rus);
   write(files,stu);
end;
procedure vvod1(const a:string);
var temp:string;
    temp1:char;
begin
case cr of
0: begin stu.fio:=a; cr:=cr+1; end;
1: begin temp:=copy(a,length(a)-4,5); val(temp,stu.godr,er);  cr:=cr+1; end;
2: begin temp:=copy(a,length(a)-4,5); val(temp, stu.godo,er);  cr:=cr+1; end;
3: begin   cr:=cr+1; end;
4: begin temp:=copy(a,length(a)-1,2); val(temp, stu.ates.mat,er);  cr:=cr+1; end;
5: begin temp:=copy(a,length(a)-1,2); val(temp, stu.ates.fiz,er);  cr:=cr+1; end;
6: begin temp:=copy(a,length(a)-1,2); val(temp, stu.ates.rus,er);  cr:=cr+1; end;
7: begin if a='��������� � ���������.' then stu.haus:=true;  cr:=cr+1; end;
8: begin cr:=cr+1; end;
9: begin temp:=copy(a,length(a)-1,2); val(temp, stu.ekz.mat,er);  cr:=cr+1; end;
10: begin temp:=copy(a,length(a)-1,2); val(temp, stu.ekz.fiz,er);  cr:=cr+1; end;
11: begin temp:=copy(a,length(a)-1,2); val(temp, stu.ekz.rus,er); write(files,stu); cr:=0; end;
else  write('error||||||',cr,er);
end;
if er<>0 then write('error',cr,er);

end;
begin
 assign(files,'c:\test\data.dat');
  assign(ifile,'c:\test\input.txt');
 rewrite(files);
  reset(ifile);
 writeln('������ �� ����� ����� 1 ��� ���� 2?');
 keys:=readkey;
 if keys='1' then
 while (not seekeof(ifile)) do
 begin
 readln(ifile, a);
 vvod1(a);

//write(a);
 end
 else
 begin
 repeat;
  clrscr;
  vvod;
  clrscr;
  writeln('      ������ �� ����������� �������');
  writeln('1-�������� ������');
  writeln('2-�����');
  writeln('      (������� 1 ��� 2)');
  keys:=readkey;
 until keys='2';
 end;

 close(files);
 close(ifile);
 readln;
end.            
