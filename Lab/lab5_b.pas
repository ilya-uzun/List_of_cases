Uses  Crt;
Const
         n = 50;    // ����� �������
Type
         TVector = array [1..n] of integer;
Var
	Vector : Tvector;
           B        :  integer;
           i, K     : Integer;
procedure print (v:Tvector);
var i:integer;
begin
         writeln('��� ������ ����� ���.');
         for i:=1 to n do
                    write (v[i], ' ');
                    writeln;
end;
begin
          ClrScr;
          Randomize;

          for i:= 1 to n do Vector[i]:=Round(Random(100))-50;
          print(Vector);
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
          for K:= n  downto  2 do
//����������� ���������� ������������� ��������
//�� �-� �������
           for i:= 1 to K-1 do
           if  Vector[i] > Vector[i+1] then
           begin
           B:= Vector [i];
           Vector [i]:= Vector [i+1];
           Vector [i+1]:= B;
           End;
{- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
           Writeln  ('��������������� ������:');
            print(Vector);
           readln;
End.     
