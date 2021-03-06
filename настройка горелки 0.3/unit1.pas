unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons,Variants;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    E_deltaT: TEdit;
    E_pres: TEdit;
    E_temp_gas: TEdit;
    E_con: TEdit;
    E_v: TEdit;
    E_Bpers: TEdit;
    E_tsg: TEdit;
    Image1: TImage;
    L_v_power: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    L_v_tsg: TLabel;
    Label14: TLabel;
    L_v_KPD: TLabel;
    L_v_koe: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    L_v_Vgas: TLabel;
    L_v_dlina: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure E_deltaTChange(Sender: TObject);
    procedure E_presChange(Sender: TObject);
    procedure E_temp_gasChange(Sender: TObject);
    procedure E_vChange(Sender: TObject);
    procedure E_conChange(Sender: TObject);
    procedure E_BpersChange(Sender: TObject);
    procedure E_tsgChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
 procedure TForm1.RadioButton1Change(Sender: TObject);
 begin
   if RadioButton1.Checked then begin
     E_deltaT.Visible:=false;  // Enabled если потребуется оставить но неспользовать
     E_v.Visible:=false;  // Visible убирает неспользованную область
     E_tsg.Visible:=false;
     L_v_power.Visible:=false;
     L_v_dlina.Visible:=false;
     Label10.Visible:=false;
     Label11.Visible:=false;
     Label12.Visible:=false;
     Label14.Visible:=false;
     L_v_tsg.Visible:=false;
     L_v_KPD.Visible:=false;
     end;
   end;
 procedure TForm1.RadioButton2Change(Sender: TObject);
 begin
     E_deltaT.Visible:=true;
     E_v.Visible:=true;
     E_tsg.Visible:=true;
     L_v_power.Visible:=true;
     L_v_dlina.Visible:=true;
     Label10.Visible:=true;
     Label11.Visible:=true;
     Label12.Visible:=true;
     Label14.Visible:=true;
     L_v_tsg.Visible:=true;
     L_v_KPD.Visible:=true;
   end;
procedure TForm1.Button1Click(Sender: TObject);
var
 temp, pres, Bpers, con, tsg: real;
 coef, power, kcon, torch: real;
 deltaT, v, Pnom, kpd: real;
begin
   if RadioButton1.Checked then begin
   pres:=StrToFloat(E_pres.Text);
   temp:=StrToFloat(E_temp_gas.Text);
   Bpers:=StrToFloat(E_Bpers.Text);
   con:=StrToFloat(E_con.Text);
   coef:=((Bpers+pres)/1013)*(273/(273+temp));// коэффициент перерасчёта
L_v_koe.Caption:= 'Коэффициент перерасчёта : '+FloatToStrF(coef , ffFixed ,3,2);
   kcon:=con*coef;   //Расход газа после коррекции
L_v_Vgas.Caption:= 'Расход газа после коррекции: '+FloatToStrF(kcon , ffFixed ,3,2);
   end;

    if RadioButton2.Checked then begin
    deltaT:=StrToFloat(E_deltaT.Text);
    pres:=StrToFloat(E_pres.Text);       // давление газа
    temp:=StrToFloat(E_temp_gas.Text);
    con:=StrToFloat(E_con.Text);      // расход газа
    v:=StrToFloat(E_v.Text);       // расход воздуха
    Bpers:=StrToFloat(E_Bpers.Text);  // барометическое давление
    tsg:=StrToFloat(E_tsg.Text);     // теплотворная способность
    coef:=((Bpers+pres)/1013)*(273/(273+temp));// коэффициент перерасчёта
    L_v_koe.Caption:= 'Коэффициент перерасчёта : '+FloatToStrF(coef , ffFixed ,3,2);
    kcon:=con*coef;   //Расход газа после коррекции
    L_v_Vgas.Caption:= 'Расход газа после коррекции: '+FloatToStrF(kcon , ffFixed ,3,2);
    power:=tsg*kcon;  //мощность голелки
    L_v_power.Caption:= 'Мощность горелки в кВат: '+FloatToStrF(power , ffFixed ,3,2);
    Pnom:=deltaT*1.29*1004*(v/3600)/1000;  // номинальная теплопроизводительность.
    L_v_tsg.Caption:='Номинальная теплопроизводительность:' +FloatToStrF(Pnom, ffFixed,3,2);
    torch:=0.0581*(exp(ln(power)*0.5));   // формула дленны факела
    L_v_dlina.Caption:= 'Длина факела: '+FloatToStrF(torch , ffFixed ,3,2);
    kpd:=Pnom/power*100;
    L_v_KPD.Caption:= 'КПД : '+FloatToStrF(kpd , ffFixed ,3,2);

end;
end;

procedure TForm1.E_deltaTChange(Sender: TObject); // не позваляет внести некорректные символы
var
 i: integer;
 s: string;
begin
s:=E_deltaT.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_deltaT.clear();
    E_deltaT.Text:='0';
    break;
  end;
end;
end;

procedure TForm1.E_presChange(Sender: TObject);
var
 i: integer;
 s: string;
begin
s:=E_pres.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_pres.clear();
    E_pres.Text:='0';
    break;
  end;
end;
end;

procedure TForm1.E_temp_gasChange(Sender: TObject);
var
 i: integer;
 s: string;
begin
s:=E_temp_gas.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_temp_gas.clear();
    E_temp_gas.Text:='0';
    break;
  end;
end;
end;

procedure TForm1.E_conChange(Sender: TObject);
var
 i: integer;
 s: string;
begin
s:=E_con.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_con.clear();
    E_con.Text:='0';
    break;
  end;
end;
end;

procedure TForm1.E_vChange(Sender: TObject);
var
 i: integer;
 s: string;
begin
s:=E_v.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_v.clear();
    E_v.Text:='0';
    break;
  end;
end;
end;

procedure TForm1.E_BpersChange(Sender: TObject);
var
 i: integer;
 s: string;
begin
s:=E_Bpers.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_Bpers.clear();
    E_Bpers.Text:='0';
    break;
  end;
end;
end;

procedure TForm1.E_tsgChange(Sender: TObject);
var
 i: integer;
 s: string;
begin
s:=E_tsg.text;
for i:=1 to length(s) do begin
  if not (s[i] in [#8,',','-','0'..'9'])then begin
    E_tsg.clear();
    E_tsg.Text:='0';
    break;
  end;
end;
end;

end.

