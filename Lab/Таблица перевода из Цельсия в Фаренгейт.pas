program Celsius_to_Fahrenheit;
var
    i, Celsius, Fahrenheit : Word;
begin
    Writeln('������� ����������� ����� �������������� �������');
    Writeln('������� � ����������');
    Writeln;
    for i := 0 to 20 do begin
        Celsius := 5 * i;
        Fahrenheit := 32 + Celsius * 9 div 5;
        Write('     C  = ', Celsius);
        Write('         F  = ', Fahrenheit);
        Writeln;
    end;
    Writeln('������� <Enter>');
    Readln;
end.