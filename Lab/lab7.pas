program lab7;// ������� � 23
type man=record
         fio:record fameli,name,och:string[15];end;
         date:record day,mes,god:integer;end;
         godpos:integer;
         many:integer;
         adres:record ul:string[15];
                      dom,kv:integer;end;
         end;
var sot:array [1..20] of man;
    n:integer;
    symb:string[1];
procedure vvod;
begin
  for n:=1 to 20 do
  begin
    writeln('������ ������ �� ���������a �����:',n);
    write('�������:');
    readln(sot[n].fio.fameli);
    write('���:');
    readln(sot[n].fio.name);
    write('��������:');
    readln(sot[n].fio.och);
    writeln('���� ��������:');
    write('����:');
    readln(sot[n].date.day);
    write('�����:');
    readln(sot[n].date.mes);
    write('���:');
    readln(sot[n].date.god);
    write('��� ����������� � �����:');
    readln(sot[n].godpos);
    write('���������� �����:');
    readln(sot[n].many);
    writeln('����� ����������:');
    write('�����:');
    readln(sot[n].adres.ul);
    write('����� ����:');
    readln(sot[n].adres.dom);
    write('����� ��������:');
    readln(sot[n].adres.kv);
  end;
end;
procedure list(n:integer);
          begin
               writeln('--------------------------------------------------------------------------------');
               write(sot[n].fio.fameli,' ',sot[n].fio.name,' ',sot[n].fio.och);
                             writeln('  ���� �������� ',sot[n].date.day,'/',sot[n].date.mes,'/',sot[n].date.god);
               writeln;
          end;
begin
vvod; //��������� ����� �������� ������
writeln('����������� ��� � ���� �������� �����������,/n� ������� ������ ����� ������ 20, � ������ ������� ������ 5');
writeln(' ');
for n:=1 to 20 do begin
if (sot[n].adres.dom<20) and (sot[n].adres.kv>5) then list(n);
end;
end.
