program lab8_c;//������� � 23
uses crt;
type data=record
          fio:string[30];
          godr,godo:integer;
          ates:record
               mat,fiz,rus:integer;
               end;
          haus:boolean;
          ekz:record
              mat,fiz,rus:integer;
              end;
          end;
var stu:data;
    files,filee:file of data;
    keys:char;
    sr:real;
procedure add(n:integer);
begin
 reset(files);rewrite(filee);
 while not eof(files) do begin read(files,stu);write(filee,stu);end;
 reset(filee);rewrite(files);
 while not eof(filee) do begin read(filee,stu);write(files,stu);end;
 for n:=1 to n do
 begin
  clrscr;
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
 close(files);close(filee);erase(filee);
end;
procedure print;
var n:byte;
begin
 writeln('      ',stu.fio);
 writeln('��� ��������..........',stu.godr);
 writeln('��� ��������� �����...',stu.godo);
 writeln('      ������ � ��������');
 writeln('����������............',stu.ates.mat);
 writeln('������................',stu.ates.fiz);
 writeln('������� ����..........',stu.ates.rus);
 writeln('      ������ �� ������������� ���������');
 writeln('����������............',stu.ekz.mat);
 writeln('������................',stu.ekz.fiz);
 writeln('������� ����..........',stu.ekz.rus);
 if stu.haus then writeln('��������� � ���������')
             else writeln('�� ��������� � ���������');
 for n:=1 to 79 do write('*');
 writeln('��� ����������� ������� Enter !');
 readln;
end;
begin
 assign(files,'c:\test\data.dat');assign(filee,'c:\test\date.dat');
 add(3);
 clrscr;
 reset(files);
 while not eof(files) do
 begin
  read(files,stu);
  sr:=(stu.ekz.mat+stu.ekz.fiz+stu.ekz.rus)/3;
 if (sr>4.5) and (((stu.ates.mat=3) and (stu.ates.fiz<>3) and (stu.ates.rus<>3)) or((stu.ates.mat<>3) and (stu.ates.fiz=3) and (stu.ates.rus<>3)) or((stu.ates.mat<>3) and (stu.ates.fiz<>3) and (stu.ates.rus=3))) then print;
 end;
 close(files);
 readln;
end.
