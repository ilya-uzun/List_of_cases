program lab5;// ������� 23
uses  crt;
const n=4;
type matriz=array[1..n,1..n] of integer; 
var i,j,k:integer;
    mas:matriz;
    mas1:matriz:=((4,3,2,1),(1,4,3,2),(2,1,4,3),(3,2,1,4));
    v:char;
procedure vvod(var vmas:matriz);
         begin
          clrscr;
           writeln('������ �������� ������� , ����������� [',n,',',n,']');
           for i:=1 to n do
            for j:=1 to n do
             begin
              write('������� ������� [',i,',',j,']=');
              readln(vmas[i,j]);
             end;
         end;
  
procedure print(vmas:matriz);
         begin
          writeln('��� ������ ����� ���.');
             for i:=1 to n do
              begin
               for j:=1 to n do
               begin
               write(' ',vmas[i,j],' ');
               end;
               writeln;
              end;
         end;
begin
 writeln ('������������ �������� ������� y/n');
 readln(v);
 if  v='y' then mas:=mas1
 else vvod(mas);
 print(mas);
 for i:=1 to n do // ���������� ������ ����������� �������
  for j:=1 to n-1 do // �������
   begin
   k:=mas[i,j];
   mas[i,j]:=mas[i,j+1];
   mas[i,j+1]:=k;
   end;
 print(mas);
 writeln('��������� ��������� , ������� Enter.');
 readln;
end.       
