program Tutor2;
var
A, B, Summa, Raznost : integer ;

begin
    Write('������� �������� ������ �����  �>');
    Readln(A);
    Write('������� �������� ������ �����  �>');
    Readln(B);
    Summa  := A+B;
    Raznost := A-B;
    Writeln ('����� ����� ', A, ' � ', B, ' = ', Summa);
    Write ('�������� ����� ', A, ' � ', B, ' = ', Raznost);
    Readln();
End.