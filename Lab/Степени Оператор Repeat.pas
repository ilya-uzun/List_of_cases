program Stepeni;
var
   a, b, c : Real;
begin
   Writeln('������� ��������');
   Readln(a, b);
   repeat
      Writeln(c);
      c:= c*a;
   until c>=b
end.
