unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, Buttons;

type TKub=class(TImage)
Public
 Najat:Boolean;
 OldLeft,OldTop:Integer;
 Znachenie:integer;
end;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Pole: TImage;
    Korob: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Image2: TImage;
    Panel1: TPanel;
    Image3: TImage;
    Im1: TLabel;
    Im3: TLabel;
    Im2: TLabel;
    Edit1: TEdit;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    RG1: TRadioGroup;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
	
    function ProverkaDljaCveta(sum:integer):Integer;
    procedure cifri(num:integer;nomer:integer;igrok:Integer);
    function Shirina(Str:String):integer;
    procedure podgotovkaKartinki(Str:String; var Kar:tbitmap);
    procedure BrositKubiki;
    procedure ClickKub1(Sender:TObject);
    procedure ClickKub(Sender:TObject; Najatie:Boolean);
    Procedure KorobRastonovka;
    function PodschetOchkov(Punct:Integer):Integer;
	
    Function Kub1_6 (Tip:Integer):Integer;
    function Kub8_10_11 (Tip:Integer):Integer;
    function Kub9_12 (Tip:Integer):Integer;
    function Kub13_14 (Tip:Integer):Integer;
    Function Kub15():Integer;
    Function Kub16():Integer;
    function Kub17():Integer;
	
    Procedure Smenaigroka;
    procedure VistovitCveta;
    procedure SprjatatKubiki;
	
	procedure NovajaIgra;
    procedure Obnulitmassivi;
	
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    
    procedure Im1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4Click(Sender: TObject);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    
    procedure Image7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
	  
	procedure HodKomputera;
    Procedure Najatie(x:Integer);  
    procedure HodKomputera_Shans;
    Procedure Zaderjka;
    function Proverka_KajdiyRaz : Integer;
    function Proverka_NeKajdiyRaz :Integer;

    procedure SobiraemBolshoy_Malenkiy(Tip:integer);
    procedure SoberaemOdinakovie(Tip:integer);
    procedure SoberaemFaul_DvePari(Tip,x1,x2:integer);
    procedure SoberaemEralash;
    procedure HodKomputera3;

    procedure NajatBrosok;
    procedure RG1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Sobiraem:Integer;
  end;

var
  Form1: TForm1;
  Knop,s1,s2,s3,s4,s5,s6,s7,s8,s9,s0,st,ramka,vich,jach,setka,Ok,Knopochki,Bros,Now:TBitmap;
  Kubik:TKub;
  oldZ:integer;
  Igroki:Array [1..3] of Integer; //0-игрок, 1-комп
  Mas:Array [1..18,0..3] of Integer;
  Ochki:Array [1..18,1..3] of Integer;
  Nom,OldNom,OldOldNom,Igr,KolIgr:Integer;
  cvet:Integer;
  NomBroska:integer;
  Hod:Integer;
  NameLabel:String;
  Game:String; // End-конец игры Game-игра идет

  KubCifra:Array[1..5]of Integer;
  KubImja:Array[1..5]of Tkub;
  Soberal:Integer;
implementation

{$R *.dfm}

Procedure TForm1.ClickKub1(Sender:TObject);
Var Kub:TKub;
Begin
Kub:=TKub(Sender);
If Kub.Najat then
  Begin
  kub.Najat:=False;
  Kub.Left:=Kub.OldLeft;
	Kub.Top:=Kub.OldTop;
  end
else kub.Najat:=True;
KorobRastonovka;
Zaderjka;
end;


function TForm1.Shirina(Str:String):integer;
Var kol,w,i:integer; s:Char;
Begin
Kol:=length(str);
w:=0;
For i:=1 to kol do
  begin
  s:=str[i];
  case s of
    '1':w:=w+10;
    '2':W:=W+11;
    '3':W:=W+11;
    '4','5','6','7','8','9','0':W:=W+12;
    '-':W:=W+7;
    end;
  end;
Result:=W;
end;

procedure TForm1.podgotovkaKartinki(Str:String;var Kar:tbitmap);
Var kol,w,i:integer; s:Char;
Begin
Kol:=length(str);
w:=0;
For i:=1 to kol do
  begin
  s:=str[i];
  case s of
    '1':Begin
        kar.Canvas.Draw(w,0,s1);
        w:=w+10;
        end;
    '2':Begin
        kar.Canvas.Draw(w,0,s2);
        W:=W+11;
        end;
    '3':Begin
        kar.Canvas.Draw(w,0,s3);
        W:=W+11;
        end;
    '4':Begin
        kar.Canvas.Draw(w,0,s4);
        W:=W+12;
        end;
    '5':Begin
        kar.Canvas.Draw(w,0,s5);
        W:=W+12;
        end;
    '6':Begin
        kar.Canvas.Draw(w,0,s6);
        W:=W+12;
        end;
    '7':Begin
        kar.Canvas.Draw(w,0,s7);
        W:=W+12;
        end;
    '8':Begin
        kar.Canvas.Draw(w,0,s8);
        W:=W+12;
        end;
    '9':Begin
        kar.Canvas.Draw(w,0,s9);
        W:=W+12;
        end;
    '0':Begin
        kar.Canvas.Draw(w,0,s0);
        W:=W+12;
        end;
    '-':Begin
        kar.Canvas.Draw(w,0,st);
        W:=W+7;
        end;
    end;
  end;
end;

procedure Tform1.cifri(num:integer;nomer:integer;igrok:integer);
Var w,x,y:Integer; pol:TBitmap;
Begin
x:=igrok*60;
y:=(nomer-1)*30;
If num=0 then Image1.Canvas.Draw(x,y,vich)
else
  Begin
  w:=Shirina(IntToStr(num));
  pol:=TbitMap.Create;
  pol.Height:=16;
  pol.Width:=w;
  podgotovkaKartinki(IntToStr(num),pol);
  Image1.Canvas.Draw(x,y,ramka);
  Image1.Canvas.Draw(x+Round((60-w)/2),y+7,pol);
  pol.Free;
  end;
End;

procedure TForm1.FormCreate(Sender: TObject);
var i,j:Integer; Kub:TKub;
begin
Game:='End';

ramka:=TBitMap.Create;
ramka.LoadFromFile('Data/ramka.bmp');
ramka.Width:=60;
ramka.Height:=30;
s1:=TBitMap.Create;
s1.LoadFromFile('Data/1.bmp');
s1.Width:=10;
s1.Height:=16;
s2:=TBitMap.Create;
s2.LoadFromFile('Data/2.bmp');
s2.Width:=11;
s2.Height:=16;
s3:=TBitMap.Create;
s3.LoadFromFile('Data/3.bmp');
s3.Width:=11;
s3.Height:=16;
s4:=TBitMap.Create;
s4.LoadFromFile('Data/4.bmp');
s4.Width:=12;
s4.Height:=16;
s5:=TBitMap.Create;
s5.LoadFromFile('Data/5.bmp');
s5.Width:=12;
s5.Height:=16;
s6:=TBitMap.Create;
s6.LoadFromFile('Data/6.bmp');
s6.Width:=12;
s6.Height:=16;
s7:=TBitMap.Create;
s7.LoadFromFile('Data/7.bmp');
s7.Width:=12;
s7.Height:=16;
s8:=TBitMap.Create;
s8.LoadFromFile('Data/8.bmp');
s8.Width:=12;
s8.Height:=16;
s9:=TBitMap.Create;
s9.LoadFromFile('Data/9.bmp');
s9.Width:=12;
s9.Height:=16;
s0:=TBitMap.Create;
s0.LoadFromFile('Data/0.bmp');
s0.Width:=12;
s0.Height:=16;
st:=TBitMap.Create;
st.LoadFromFile('Data/-.bmp');
st.Width:=12;
st.Height:=16;
vich:=TBitMap.Create;
vich.LoadFromFile('Data/vich.bmp');
vich.Width:=60;
vich.Height:=30;

setka:=TBitMap.Create;
setka.LoadFromFile('Data/setka.bmp');
setka.Width:=60;
setka.Height:=540;

jach:=TBitMap.Create;
jach.LoadFromFile('Data/jach.bmp');
jach.Width:=120;
jach.Height:=24;

Knop:=TBitMap.Create;
Knop.LoadFromFile('Data/knop.bmp');
Knop.Width:=360;
Knop.Height:=540;

Ok:=TBitMap.Create;
Ok.LoadFromFile('Data/ok.bmp');
Ok.Width:=48;
Ok.Height:=24;

Knopochki:=TBitMap.Create;
Knopochki.LoadFromFile('Data/Knopochki.bmp');
Knopochki.Width:=96;
Knopochki.Height:=24;

Bros:=TBitMap.Create;
Bros.LoadFromFile('Data/Knopka.bmp');
Bros.Width:=580;
Bros.Height:=134;

Now:=TBitMap.Create;
Now.LoadFromFile('Data/Nov.bmp');
Now.Width:=210;
Now.Height:=100;

For i:=1 to 5 do
  Begin
  Kubik:=Tkub.Create(Self);
  Kubik.Parent:=Form1;
  Kubik.Name:='k'+IntToStr(i);
  Kubik.Najat:=False;
  Kubik.Width:=58;
  Kubik.Height:=58;
  Kubik.OnClick:=ClickKub1;
  Kubik.Transparent:=True;
  Kubik.Picture.LoadFromFile('Data/k'+IntToStr(i)+'.bmp');
  end;
Kub:=TKub(FindComponent('k1'));
Kub.OldLeft:=Pole.Left+7+25;
Kub.OldTop:=Pole.Top+7+5;
Kub.Left:=Kub.OldLeft;
Kub.Top:=Kub.OldTop;
Kub:=TKub(FindComponent('k2'));
Kub.OldLeft:=Pole.Left+7+25+46;
Kub.OldTop:=Pole.Top+7+5+56+5;
Kub.Left:=Kub.OldLeft;
Kub.Top:=Kub.OldTop;
Kub:=TKub(FindComponent('k3'));
Kub.OldLeft:=Pole.Left+7+25+56+37;
Kub.OldTop:=Pole.Top+7+5;
Kub.Left:=Kub.OldLeft;
Kub.Top:=Kub.OldTop;
Kub:=TKub(FindComponent('k4'));
Kub.OldLeft:=Pole.Left+7+25+46+56+36;
Kub.OldTop:=Pole.Top+7+5+56+5;
Kub.Left:=Kub.OldLeft;
Kub.Top:=Kub.OldTop;
Kub:=TKub(FindComponent('k5'));
Kub.OldLeft:=Pole.Left+7+25+56+37+56+37;
Kub.OldTop:=Pole.Top+7+5;
Kub.Left:=Kub.OldLeft;
Kub.Top:=Kub.OldTop;

SprjatatKubiki;
NovajaIgra;

Igroki[1]:=0;
Igroki[2]:=1;
Im2.Caption:= 'Комп 2';
Igroki[3]:=1;
Im3.Caption:= 'Комп 3';
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
knop.Free;
ramka.Free;
s1.Free;
s2.Free;
s3.Free;
s4.Free;
s5.Free;
s6.Free;
s7.Free;
s8.Free;
s9.Free;
s0.Free;
st.Free;
vich.Free;
setka.Free;
jach.Free;
Ok.Free;
Knopochki.Free;
Bros.Free;
Now.Free;

For i:=1 to 5 do
  begin
  (FindComponent('k'+IntToStr(i)) as TKub).Free;
  end;
end;

function tForm1.ProverkaDljaCveta(sum:integer):Integer;
Begin
If sum>0 Then Result:=2
else result:=5;
End;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var sum:integer;
begin
sum:=0;
If (x>=0) and (x<=60) then
  Nom:=(y div 30)+1
else Nom:=0;

If (Nom<>OldNom) then
  Begin
  If (OldNom>0) and (Mas[OldNom,Igr]=0) then
    Image1.Canvas.CopyRect(Bounds(0,(OldNom-1)*30,60,30),knop.Canvas,Bounds(0,(Oldnom-1)*30,60,30));
  If (Nom>0) and (Mas[Nom,Igr]=0) then
    begin
    sum:=PodschetOchkov(Nom);
    cvet:=ProverkaDljaCveta(sum);
    Image1.Canvas.CopyRect(Bounds(0,(nom-1)*30,60,30),knop.Canvas,Bounds((cvet-1)*60,(nom-1)*30,60,30));
    end;
  OldNom:=Nom;
  End;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
If (Nom<>0) and (Mas[Nom,Igr]=0) Then
  Begin
  OldOldNom:=Nom;
  Image1.Canvas.CopyRect(Bounds(0,(nom-1)*30,60,30),knop.Canvas,Bounds(cvet*60,(nom-1)*30,60,30));
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
var sum,i,prov,och:Integer;
begin
If NomBroska=0 then
  Begin
  If mas[nom,igr]=0 then
    begin
    sum:=PodschetOchkov(Nom);
    cvet:=ProverkaDljaCveta(sum);
    Image1.Canvas.CopyRect(Bounds(0,(nom-1)*30,60,30),knop.Canvas,Bounds((cvet-1)*60,(nom-1)*30,60,30));
    end;
  exit;
  end;
If (Nom<>0) and (Mas[nom,igr]=0) then
  Begin
  If OldOldNom=Nom Then
    Begin
    Image1.Canvas.CopyRect(Bounds(0,(nom-1)*30,60,30),knop.Canvas,Bounds(180,(nom-1)*30,60,30));
    Mas[Nom,Igr]:=1;
    sum:=PodschetOchkov(Nom);
    Cifri(sum,Nom,igr);
    Ochki[nom,igr]:=Sum;

    For i:=1 to 6 do
      Begin
      prov:=0;
      if Mas[i,Igr]=0 then break;
      prov:=1;
      end;
    If prov=1 then
      Begin
      och:=0;
      For i:=1 to 6 do
       och:=och+Ochki[i,igr];
      Ochki[7,igr]:=och;
      Cifri(och,7,igr);
      end;
    SmenaIgroka;
    end;
  end;
end;

procedure TForm1.BrositKubiki;
var i,n:integer; Kub:TKub;
begin
Game:='Game';
Randomize;
If NomBroska=0 then
For i:=1 to 5 do
  Begin
  (FindComponent('k'+IntToStr(i)) as TKub).Left:=(FindComponent('k'+IntToStr(i)) as TKub).OldLeft;
  (FindComponent('k'+IntToStr(i)) as TKub).Top:=(FindComponent('k'+IntToStr(i)) as TKub).OldTop;
  End;

For i:=1 to 5 do
  Begin
  Kub:=TKub(FindComponent('k'+IntToStr(i)));
  If Kub.Najat=False then
    Begin
    n:=Random(6)+1;
    Kub.Znachenie:=n;
    Kub.Picture.LoadFromFile('Data/k'+IntToStr(n)+'.bmp');
    end;
  end;
Inc(NomBroska);
If NomBroska<4 then
  Begin
  If NomBroska=1 then Label4.Caption:='Вы бросили кубики '+IntToStr(NomBroska)+' раз'
  else Label4.Caption:='Вы бросили кубики '+IntToStr(NomBroska)+' раза'
  end
 else
  Begin
  NomBroska:=1;
  Label4.Caption:='Вы бросили кубики '+IntToStr(NomBroska)+' раз';
  end;
If NomBroska=3 then Image5.Visible:=false;
If Igroki[igr]=1 then
  Begin
  Application.ProcessMessages;
  HodKomputera3;
	end;
end;

procedure TForm1.ClickKub(Sender:TObject; Najatie:Boolean);
Var Kub:TKub;
Begin
Kub:=TKub(Sender);
If Kub.Najat<>Najatie then
	Begin
	Kub.Najat:=Najatie;
	If Najatie=False then
		Begin
		Kub.Left:=Kub.OldLeft;
		Kub.Top:=Kub.OldTop;
		end;
	KorobRastonovka;
	Zaderjka;
	end;
end;

Procedure TForm1.KorobRastonovka;
Var Kub:TKub; i,n,z:Integer;
Begin
n:=0;
  For z:=1 to 6 do
    Begin
    For i:=1 to 5 do
      Begin
      Kub:=TKub(FindComponent('k'+IntToStr(i)));
      If Kub.Najat=True then
        Begin
        If Kub.Znachenie=z then
          Begin
          inc(n);
          Kub.Left:=Korob.Left+9+58*(n-1);
          Kub.Top:=Korob.Top+9;
          end;
        end;
      end;
    end;
end;

Function TForm1.Kub1_6 (Tip:Integer):Integer;
var sum,i:integer;
Begin
sum:=-4*Tip;
For i:=1 to 5 do
  Begin
  If (FindComponent('k'+IntToStr(i)) as TKub).Znachenie=Tip then
    sum:=sum+Tip;
  End;
Result:=Sum;
end;

function TForm1.Kub8_10_11 (Tip:Integer):Integer;
var i,j,kol:Integer;
Begin
For i:=6 downto 1 do
  Begin
  Kol:=0;
  For j:=1 to 5 do
    Begin
    If (FindComponent('k'+IntToStr(j)) as TKub).Znachenie=i then inc(Kol);
    end;
  If Kol>=Tip then
    Begin
    If NomBroska=1 then Result:=(i*Tip)*2
    else Result:=(i*Tip);
    exit;
    end;
  end;
Result:=0;
end;

function TForm1.Kub9_12 (Tip:Integer):Integer;
Var i,j,est,Kol:Integer;
Begin
est:=0;
For i:=6 downto 1 do
  Begin
  Kol:=0;
  For j:=1 to 5 do
    Begin
    If (FindComponent('k'+IntToStr(j)) as TKub).Znachenie=i then inc(Kol);
    end;
  If Kol>=Tip then
    Begin
    est:=i;
    break;
    end;
  end;
If est=0 then
  Begin
  Result:=0;
  exit;
  end;
For i:=6 downto 1 do
  Begin
  Kol:=0;
  If i=est then continue;
  For j:=1 to 5 do
    Begin
    If (FindComponent('k'+IntToStr(j)) as TKub).Znachenie=i then inc(Kol);
    end;
  If Kol>=2 then
    Begin
    est:=est*Tip+i*2;
    If NomBroska=1 then Result:=est*2
    else Result:=est;
    exit;
    end;
  end;
Result:=0;
end;

function TForm1.Kub13_14 (Tip:Integer):Integer;
Var i,j,Kol:Integer;
Begin
Kol:=0;
For i:=Tip to (tip+4) do
  Begin
  For j:=1 to 5 do
    Begin
    If (FindComponent('k'+IntToStr(j)) as TKub).Znachenie=i then
      Begin
      inc(Kol);
      break;
      end;
    end;
  end;
If Kol=5 then
 Begin
 If NomBroska=1 then Result:=(10+5*Tip)*2
  else Result:=(10+5*Tip);
 end
else Result:=0;
end;

Function TForm1.Kub15():Integer;
Var i,Sum:Integer;
Begin
sum:=0;
For i:=1 to 5 do
  Begin
  sum:=Sum+(FindComponent('k'+IntToStr(i)) as TKub).Znachenie;
  end;
Result:=Sum;
end;

Function TForm1.Kub16():Integer;
Var i,j,Kol:Integer;
Begin
Kol:=0;
For i:=6 downto 1 do
  Begin
  For j:=1 to 5 do
    Begin
    If (FindComponent('k'+IntToStr(j)) as TKub).Znachenie=i then
      Begin
      inc(Kol);
      end
    else
      Begin
      Break;
      end;
    End;
  If Kol=5 then
    Begin
    Result:=10*(i-NomBroska)+50;
    exit;
    end;
  end;
Result:=0;
end;

function TForm1.Kub17():Integer;
Var Sum,SumOld,x:Integer;
Begin
x:=0;
Sum:=0;
SumOld:=0;

Sum:=Kub16();
If Sum<>0 then
  begin
  Result:=Sum;
  Exit;
  end;
Sum:=Kub8_10_11(2);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Sum:=Kub8_10_11(3);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Sum:=Kub8_10_11(4);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Sum:=Kub9_12(2);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Sum:=Kub9_12(3);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Sum:=Kub13_14(2);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Sum:=Kub13_14(1);
If Sum>SumOld then
  Begin
  SumOld:=Sum;
  end;
Result:=SumOld;
end;

function TForm1.PodschetOchkov(Punct:Integer):Integer;
var sum:Integer;
Begin
case Punct of
  1: sum:=Kub1_6(1);//1
  2: sum:=Kub1_6(2);//2
  3: sum:=Kub1_6(3);//3
  4: sum:=Kub1_6(4);//4
  5: sum:=Kub1_6(5);//5
  6: sum:=Kub1_6(6);//6
  8: sum:=Kub8_10_11(2);//Пара
  9: sum:=Kub9_12(2);//Две пары
  10: sum:=Kub8_10_11(3);//Треугольник
  11: sum:=Kub8_10_11(4);//Квадрат
  12: sum:=Kub9_12(3);//Фаул
  13: sum:=Kub13_14(2);//Большой
  14: sum:=Kub13_14(1);//Маленький
  15: sum:=Kub15();//Ералаш
  16: sum:=Kub16();//Покер
  17: sum:=Kub17();//Шанс
end;
Result:=Sum;
end;

Procedure TForm1.Smenaigroka;
var i,j,och:integer;
text:String;
Begin
Image5.Visible:=true;
Inc(Igr);
If Igr>KolIgr Then
  Begin
  igr:=1;
  inc(hod);
  end;
If hod=15 then
  begin
  for i:=1 to KolIgr do
    mas[17,i]:=0;
  end;
If hod=16 then
  begin
  for i:=1 to KolIgr do
    mas[17,i]:=1;

  for i:=1 to KolIgr do
    Begin
    och:=0;
    for j:=8 to 17 do
      Och:=och+Ochki[j,i];
    Och:=och+Ochki[7,i];
    Ochki[18,i]:=Och;
    Cifri(och,18,i);
    end;
	Image5.Visible:=false;
	Game:='End';
	
	j:=1;
	For i:=1 to KolIgr do
		Begin
		If Ochki[18,i]>Ochki[18,j] then j:=i; 
		end;
	Och:=StrToInt(Copy(IntToStr(Ochki[18,j]),Length(IntToStr(Ochki[18,j])),1));
	If (Och=1) then
		text:=' очко';
	If (Och=2) or (Och=3) or (Och=4)then
		text:=' очка';
	If  (Och>=5) or (Och=0) then
		text:=' очков';
	If KolIgr=1 then
		Begin
    Label5.caption:=Im1.caption+', поздравляем';
    Label4.Caption:='вы набрали '+IntToStr(Ochki[18,j])+text;
		end;
	If KolIgr>1 then
		Begin
		Label5.caption:=(FindComponent('Im'+intToStr(j)) as TLabel).caption+', поздравляем';
		Label4.Caption:='вы набрали '+IntToStr(Ochki[18,j])+text;
		end;

  exit;
  end;
Label5.Caption:='Ходит игрок: '+IntToStr(Igr);
VistovitCveta;
SprjatatKubiki;
NomBroska:=0;
Label4.Caption:='Бросайте кубики.';
Image3.Canvas.CopyRect(Bounds(igr*60,0,60,24),jach.Canvas,Bounds(60,0,60,24));;
If igr=1 then
  Image3.Canvas.CopyRect(Bounds(Koligr*60,0,60,24),jach.Canvas,Bounds(0,0,60,24))
else
  Image3.Canvas.CopyRect(Bounds((igr-1)*60,0,60,24),jach.Canvas,Bounds(0,0,60,24));;

Image5.Visible:=True;
Label5.Caption:='Ходит: '+(FindComponent('Im'+IntToStr(Igr)) as TLabel).Caption;
If Igroki[igr]=1 then HodKomputera3;
end;

procedure TForm1.VistovitCveta;
var i:Integer;
Begin
For i:=1 to 18 do
  Begin
  If Mas[i,igr]=0 then
    Image1.Canvas.CopyRect(Bounds(0,(i-1)*30,60,30),knop.Canvas,Bounds(0,(i-1)*30,60,30))
  else
    Image1.Canvas.CopyRect(Bounds(0,(i-1)*30,60,30),knop.Canvas,Bounds(180,(i-1)*30,60,30));
  end;
end;

procedure Tform1.SprjatatKubiki;
var i:integer;
Begin
For i:=1 to 5 do
  Begin
  (FindComponent('k'+IntToStr(i)) as TKub).Znachenie:=0;
  (FindComponent('k'+IntToStr(i)) as TKub).Left:=-200;
  (FindComponent('k'+IntToStr(i)) as TKub).Top:=-200;
  (FindComponent('k'+IntToStr(i)) as TKub).Najat:=False;
  End;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
If mas[oldNom,igr]=0 then
 image1.Canvas.CopyRect(Bounds(0,(OldNom-1)*30,60,30),knop.Canvas,Bounds(0,(Oldnom-1)*30,60,30));
  oldNom:=0;
end;

procedure TForm1.NovajaIgra;
var i,j:integer;
begin
Game:='End';

KolIgr:=Rg1.ItemIndex+1;
Obnulitmassivi;
Form1.ClientWidth:=560-(3-KolIgr)*60;
SprjatatKubiki;

For i:=1 to 3 do
  Image1.Canvas.Draw(i*60,0,setka);

For i:=1 to 3 do
  Image3.Canvas.CopyRect(Bounds(i*60,0,60,24),jach.Canvas,Bounds(0,0,60,24));
Image5.Visible:=True;
Nom:=0;
OldNom:=0;
Igr:=1;
Hod:=0;
NomBroska:=0;
Label4.Caption:='Бросайте кубики.';
Image3.Canvas.CopyRect(Bounds(60,0,60,24),jach.Canvas,Bounds(60,0,60,24));

For i:=1 to 18 do
  begin
  If Mas [i,igr]=0 then
    Image1.Canvas.CopyRect(Bounds(0,(i-1)*30,60,30),knop.Canvas,Bounds(0,(i-1)*30,60,30))
  else Image1.Canvas.CopyRect(Bounds(0,(i-1)*30,60,30),knop.Canvas,Bounds(180,(i-1)*30,60,30))
  end;
Image5.Visible:=True;
Label5.Caption:='Ходит: '+(FindComponent('Im'+IntToStr(Igr)) as TLabel).Caption;
If Igroki[igr]=1 then
  Begin
  Application.ProcessMessages;
  NajatBrosok;
  end;
end;

procedure TForm1.Obnulitmassivi;
var i,j:integer;
Begin
For i:=1 to 18 do
  Begin
  Mas[i,0]:=i;
  end;
For i:=1 to KolIgr do
  For j:=1 to 18 do
  Mas[j,i]:=0;

For i:=1 to KolIgr do
  For j:=1 to 18 do
  Ochki[j,i]:=0;

For i:=1 to KolIgr do
  Begin
  Mas[7,i]:=1;
  Mas[18,i]:=1;
  Mas[17,i]:=1;
  end;
end;

procedure TForm1.Im1Click(Sender: TObject);
var x:Integer;
begin
x:=(Sender as TLabel).Left;
NameLabel:=(Sender as TLabel).Name;
Edit1.Visible:=True;
Edit1.Left:=x;
Edit1.Text:=(Sender as TLabel).Caption;
Edit1.SetFocus;
Image4.Visible:=True;
Image4.Left:=x-24;
Image4.Canvas.Draw(0,0,Ok);
Image7.Visible:=True;
Image7.Left:=x-48;
If Igroki[StrToInt(Copy(NameLabel,3,1))]=0 then
  Image7.Canvas.CopyRect(Bounds(0,0,24,24),Knopochki.Canvas,Bounds(0,0,24,24))
else
  Image7.Canvas.CopyRect(Bounds(0,0,24,24),Knopochki.Canvas,Bounds(48,0,24,24));
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
If Key=#13 then Image4Click(Sender);
end;

procedure TForm1.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image4.Canvas.CopyRect(Bounds(0,0,24,24),ok.Canvas,Bounds(24,0,24,24));
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
Edit1.Visible:=False;
Image4.Visible:=False;
Image7.Visible:=False;
If Edit1.Text<>'' then
  (FindComponent(NameLabel) as tLabel).Caption:=Edit1.Text
else
  (FindComponent(NameLabel) as tLabel).Caption:='Игрок '+Copy(NameLabel,3,1);
If Igr=StrToInt(Copy(NameLabel,3,1)) then
  label5.Caption:='Ходит: '+(FindComponent(NameLabel) as tLabel).Caption;
end;

procedure TForm1.Image7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
If Igroki[StrToInt(Copy(NameLabel,3,1))]=0 then
  Image7.Canvas.CopyRect(Bounds(0,0,24,24),Knopochki.Canvas,Bounds(24,0,24,24))
else
  Image7.Canvas.CopyRect(Bounds(0,0,24,24),Knopochki.Canvas,Bounds(72,0,24,24));
end;

procedure TForm1.Image7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var i:Integer; n:Integer;
begin
If Igroki[StrToInt(Copy(NameLabel,3,1))]=0 then
  Begin
  Igroki[StrToInt(Copy(NameLabel,3,1))]:=1;
  Edit1.Text:='Комп '+Copy(NameLabel,3,1);
  Image4Click(Sender);
  end
else
  Begin
  Igroki[StrToInt(Copy(NameLabel,3,1))]:=0;
  Edit1.Text:='';
  Image7.Canvas.CopyRect(Bounds(0,0,24,24),Knopochki.Canvas,Bounds(0,0,24,24));
  end;
end;

procedure TForm1.Image5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image5.Canvas.CopyRect(Bounds(0,0,290,134),Bros.Canvas,Bounds(290,0,290,134));
end;

procedure TForm1.Image5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image5.Canvas.CopyRect(Bounds(0,0,290,134),Bros.Canvas,Bounds(0,0,290,134));
BrositKubiki;
end;

procedure TForm1.Image6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image6.Canvas.CopyRect(Bounds(0,0,105,100),Now.Canvas,Bounds(105,0,105,100));
end;

procedure TForm1.Image6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Image6.Canvas.CopyRect(Bounds(0,0,105,100),Now.Canvas,Bounds(0,0,105,100));
NovajaIgra;
end;

Procedure TForm1.Najatie(x:Integer);
Begin
Zaderjka;
Image1MouseMove(Image5, [ssLeft], 15, (x-1)*30+15);
Application.ProcessMessages;
sleep(200);
Image1MouseDown(Image5, mbLeft, [ssLeft], 0, 0);
Application.ProcessMessages;
sleep(200);
nom:=x;
OldOldNom:=x;
Image1Click(Image1);
end;

Procedure TForm1.Zaderjka;
Begin
Application.ProcessMessages;
Sleep(300);
end;

procedure TfORM1.HodKomputera;
Var i,x,x1,x2,j:Integer;
Komp1_10:Array [1..10] of Integer;
KubCifra:Array[1..5]of Integer;
KubImja:Array[1..5]of Tkub;
KubKol:Array[1..6]of Integer;
Begin
If Hod=15 then
  Begin
  HodKomputera_Shans;
  Exit;
  end;
//Обнулить кубики
For i:=1 to 5 do
  If (FindComponent('k'+IntToStr(i)) as TKub).Najat=True then
    ClickKub1((FindComponent('k'+IntToStr(i)) as TKub));

//Проверить покер
If (Mas[16,igr]=0)and(Kub16()<>0) then
  Begin
  Najatie(16);
  exit;
  end;
//Проверит на большой
If (Mas[13,igr]=0)and(Kub13_14(2)<>0) then
  Begin
  Najatie(13);
  exit;
  end;
//Проверить на маленький
If (Mas[14,igr]=0)and(Kub13_14(1)<>0) then
  Begin
  Najatie(14);
  exit;
  end;
//Проверть на фаул
If (Mas[12,igr]=0)and(Kub9_12(3)<>0) then
  Begin
  Najatie(12);
  exit;
  end;
//Проверить на 2 пары c 1 броска
If (Mas[9,igr]=0)and(Kub9_12(2)<>0)and(NomBroska=1) then
  Begin
  Najatie(9);
  exit;
  end;
//Проверить на квадрат с первого броска
If (Mas[11,igr]=0)and(Kub8_10_11(4)<>0)and(NomBroska=1) then
  Begin
  Najatie(11);
  exit;
  end;
//Проверить на треугольник с первого броска
If (Mas[10,igr]=0)and(Kub8_10_11(3)<>0)and(NomBroska=1) then
  Begin
  Najatie(10);
  exit;
  end;
//Проверить на пару 6 с первого броска
If (Mas[8,igr]=0)and(Kub8_10_11(2)=24)and(NomBroska=1) then
  Begin
  Najatie(8);
  exit;
  end;

For i:=1 to 6 do
  KubKol[i]:=0;

//Записуем имя кубиков и их значение
For i:=1 to 5 do
  Begin
  KubImja[i]:=(FindComponent('k'+IntToStr(i)) as TKub);
  KubCifra[i]:=KubImja[i].Znachenie;
  Case KubCifra[i] of
    1:Inc(KubKol[1]);
    2:Inc(KubKol[2]);
    3:Inc(KubKol[3]);
    4:Inc(KubKol[4]);
    5:Inc(KubKol[5]);
    6:Inc(KubKol[6]);
    end;
  End;

//Проверяем можноли собрать Большой маленький фаул если еще нет 3 бросков
If NomBroska<3 then
Begin

//Проверка на возможность сoбрать Большой или маленький пока свободны 1,2,Ералаш
If (Mas[1,Igr]=0) or (Mas[2,Igr]=0) or (Mas[15,Igr]=0) then
Begin
x:=0;
//Проверяем середину 2-5
For i:=2 to 5 do
  For j:=1 to 5 do
    Begin
    If KubCifra[j]=i then
      Begin
      inc(x);
      Break;
      end;
    end;
If (x=4) and ((Mas[13,igr]=0) or (Mas[14,igr]=0)) then
  Begin
  Sobiraem:=14;
  //Фиксим центральные кубики 2-5
  For i:=2 to 5 do
    For j:=1 to 5 do
      Begin
      If KubCifra[j]=i then
        Begin
        ClickKub1(KubImja[j]);
        Zaderjka;
        Break;
        end;
      end;
  //sledujushiy brosok
  NajatBrosok;
  exit;
  end;
//Проверяем на возможность собрать большой
If (x=3) and (Mas[13,igr]=0) then
  Begin
  For j:=1 to 5 do
    If KubCifra[j]=6 then
      Begin
      inc(x);
      Break;
      end;
  end;
If x=4 then
  Begin
  Sobiraem:=13;
  //Фиксим кубики для юольшого
  For i:=2 to 6 do
    For j:=1 to 5 do
      Begin
      If KubCifra[j]=i then
        Begin
        ClickKub1(KubImja[j]);
        Zaderjka;
        Break;
        end;
      end;
  //sledujushiy brosok
  NajatBrosok;
  exit;
  end;
//Проверяем на возможность собрать маленький
If (x=3) and (Mas[14,igr]=0) then
  Begin
  For j:=1 to 5 do
    If KubCifra[j]=1 then
      Begin
      inc(x);
      Break;
      end;
  end;
If x=4 then
  Begin
  Sobiraem:=14;
  //Фиксим кубики для маленького
  For i:=1 to 5 do
    For j:=1 to 5 do
      Begin
      If KubCifra[j]=i then
        Begin
        ClickKub1(KubImja[j]);
        Zaderjka;
        Break;
        end;
      end;
  //sledujushiy brosok
  NajatBrosok;
  exit;
  end;
end;

//Прверяем на возможность собрать фаул
If Mas[12,igr]=0 then
  Begin
  x1:=0;
  x2:=0;
  For i:=1 to 6 do
    If KubKol[i]=2 then
      Begin
      x1:=i;
      break;
      end;
  For i:=1 to 6 do
    If (KubKol[i]=2) and (i<>x1) then
      Begin
      x2:=i;
      break;
      end;
  //Если есть 2 пары тогда фмксим их
  If (x1<>0) and (x2<>0) then
    Begin
    Sobiraem:=12;
    For i:=1 to 5 do
      Begin
      If KubCifra[i]=x1 then
        ClickKub1(kubImja[i])
      else
        If KubCifra[i]=x2 then
          ClickKub1(kubImja[i]);
      Zaderjka;
      end;
    //sledujushiy brosok
    NajatBrosok;
    exit;
    end;
  end;

//Ищем где больше одинаковых
x:=0;
For i:=6 downto 1 do
  If Mas[i,igr]=0 then
    Begin
    x:=i;
    break;
    end;
For i:=6 downto 1 do
  Begin
  If (KubKol[i]>KubKol[x]) and (Mas[i,igr]=0) then x:=i;
  end;
//Если собраны все тогда надо будет смотреть что осталось собрать
//Берем максимум
If x=0 then
  Begin
  x:=6;
  For i:=5 downto 1 do
    If (KubKol[i]>KubKol[x]) then x:=i;
  end;
//Жмем на кубики которых больше
Sobiraem:=x;
For i:=1 to 5 do
  Begin
  If (KubCifra[i]=x) and (KubImja[i].Najat=False) then
    ClickKub1(KubImja[i]);
  Zaderjka;
  end;
//sledujushiy brosok
BrositKubiki;
exit;
end
else //Если было сделано 3 броска тогда ищем куда записать
  Begin
  //если собирали фаул и не собрали записываем в 2 пары если пусто
  If Sobiraem=12 then
    Begin
    If (Mas[9,igr]=0) then
      Begin
      nom:=9;
      OldOldNom:=9;
      Image1Click(Image1);
      exit;
      end;
    end;

  For i:=1 to 10 do
    Komp1_10[i]:=-100;
  //Записываем количество очков
  For i:=1 to 6 do
    Begin
    If Mas[i,igr]=0 then
      Komp1_10[i]:=Kub1_6(i); // 1-6
    end;

  If Mas[9,igr]=0 then
    If Kub8_10_11(3)>0 then
      Komp1_10[7]:=Kub9_12(2);//2 пары

  If Mas[10,igr]=0 then
    If Kub8_10_11(3)>0 then
      Komp1_10[8]:=Kub8_10_11(3);//треугольнтик

  If Mas[11,igr]=0 then
    If Kub8_10_11(4)>0 then
      Komp1_10[9]:=Kub8_10_11(4); //квадрат

  If Mas[15,igr]=0 then
    If Kub15()>0 then
      Komp1_10[10]:=Kub15(); // ералаш

  //Выбераем большее количество очков и кликаем
  //Находим первую ячейку на которую можно нажать
  x1:=0;
  For i:=1 to 6 do
    If Mas[i,igr]=0 then
      Begin
      x1:=i;
      break;
      end;
  //Выбераем большее количество очков и кликаем
  If x1>0 then
    Begin
    For i:=1 to 10 do
      If Komp1_10[i]>Komp1_10[x1] then x1:=i;
    Case x1 of
      7: x1:=9; //2 пары
      8: x1:=10; //треугольник
      9: x1:=11; //квадрат
      10: x1:=15; //ералаш
      end;
    nom:=x1;
    OldOldNom:=x1;
    Image1Click(Image1);
    exit;
    end;

  //Вычеркиваем один из покера, большого, маленького, фаула, покера
  x1:=Random(4)+1;
  For i:=1 to 4 do
    begin
    Case x1 of
      1:x2:=12;
      2:x2:=13;
      3:x2:=14;
      4:x2:=16;
      end;
    If mas[x2,igr]=0 then
      Begin
      nom:=x2;
      OldOldNom:=x2;
      Image1Click(Image1);
      exit;
      end
    else
      Begin
      inc(x1);
      If x1>4 then x1:=1;
      end;
    end;
  //Жмем на квадрат
    If Mas[11,Igr]=0 then
      Najatie(11);
  //Жмем на 2 пары
    If Mas[12,Igr]=0 then
      Najatie(12);
  //Жмем на Треугольник
    If Mas[10,Igr]=0 then
      Najatie(10);

  //Жмем на пару
    Najatie(8);
    exit;
  end;
end;


procedure TForm1.HodKomputera_Shans;
Var i,x:integer;
KubCifra:Array[1..5]of Integer;
KubImja:Array[1..5]of Tkub;
KubKol:Array[1..6]of Integer;
Begin
If NomBroska=3 then
  Najatie(17);

If (NomBroska=1) and (Kub17()<>0) then
  Begin
  Najatie(17);
  exit;
  end
else
  Begin
  //Записуем имя кубиков и их значение
  For i:=1 to 5 do
    Begin
    KubImja[i]:=(FindComponent('k'+IntToStr(i)) as TKub);
    KubCifra[i]:=KubImja[i].Znachenie;
    Case KubCifra[i] of
      1:Inc(KubKol[1]);
      2:Inc(KubKol[2]);
      3:Inc(KubKol[3]);
      4:Inc(KubKol[4]);
      5:Inc(KubKol[5]);
      6:Inc(KubKol[6]);
      end;
    End;
  //Ищем где больше одинаковых
  x:=6;
  For i:=5 downto 1 do
    If (KubKol[i]>KubKol[x]) then
      x:=i;
  //Жмем на кубики которых больше
  For i:=1 to 5 do
    If (KubCifra[i]=x) and (KubImja[i].Najat=False) then
      ClickKub1(KubImja[i]);
  Zaderjka;
  //sledujushiy brosok
  NajatBrosok;
  exit;
  end;
end;





//--------------------------------------
function Tform1.Proverka_KajdiyRaz : Integer;
Begin
//Проверить покер
If (Mas[16,igr]=0) and (Kub16()<>0) then
  Begin
  Result:=16;
  exit;
  end;
//Проверит на большой
If (Mas[13,igr]=0) and (Kub13_14(2)<>0) then
  Begin
  Result:=13;
  exit;
  end;
//Проверить на маленький
If (Mas[14,igr]=0) and (Kub13_14(1)<>0) then
  Begin
  Result:=14;
  exit;
  end;
//Проверить Сбор цифр
If (Mas[1,igr]=0) and (Kub1_6(1)=1) then
  Begin
  Result:=1;
  exit;
  end;
If (Mas[2,igr]=0) and (Kub1_6(2)=2) then
  Begin
  Result:=2;
  exit;
  end;
If (Mas[3,igr]=0) and (Kub1_6(3)=3) then
  Begin
  Result:=3;
  exit;
  end;
If (Mas[4,igr]=0) and (Kub1_6(4)=4) then
  Begin
  Result:=4;
  exit;
  end;
If (Mas[5,igr]=0) and (Kub1_6(5)=5) then
  Begin
  Result:=5;
  exit;
  end;
If (Mas[6,igr]=0) and (Kub1_6(6)=6) then
  Begin
  Result:=6;
  exit;
  end;
Result:=0;
end;


function TForm1.Proverka_NeKajdiyRaz :Integer;
var n:integer;
Begin
//Если первый бросок то домнажаем на 2;
If nomBroska=1 then
  n:=2
else n:=1;
//Проверяем на количество очков в зависимости от хода до 7 или от 7
If Hod<=7 then
  Begin
  //Проверть на фаул
  If (Mas[12,igr]=0)and(Kub9_12(3)>=21*n) then
    Begin
    Result:=12;
    exit;
    end;
  //Проверить на 2 пары c 1 броска
  If (Mas[9,igr]=0)and(Kub9_12(2)>=16*n) then
    Begin
    Result:=9;
    exit;
    end;
  //Проверить на квадрат с первого броска
  If (Mas[11,igr]=0)and(Kub8_10_11(4)>=16*n) then
    Begin
    Result:=11;
    exit;
    end;
  //Проверить на треугольник с первого броска
  If (Mas[10,igr]=0)and(Kub8_10_11(3)>=12*n) then
    Begin
    Result:=10;
    exit;
    end;
  end
else
  Begin
  //Проверть на фаул
  If (Mas[12,igr]=0)and(Kub9_12(3)<>0) then
    Begin
    Result:=12;
    exit;
    end;
    //Проверить на 2 пары c 1 броска
  If (Mas[9,igr]=0)and(Kub9_12(2)<>0) then
    Begin
    Result:=9;
    exit;
    end;
    //Проверить на квадрат с первого броска
  If (Mas[11,igr]=0)and(Kub8_10_11(4)<>0) then
    Begin
    Result:=11;
    exit;
    end;
  //Проверить на треугольник с первого броска
  If (Mas[10,igr]=0)and(Kub8_10_11(3)<>0) then
    Begin
    Result:=10;
    exit;
    end;
  end;
Result:=0;
end;


procedure TForm1.SobiraemBolshoy_Malenkiy(Tip:integer);
var i,j:integer;
KubImja1:Array[1..5]of Boolean;
Begin
For i:=1 to 5 do 
	Begin
	KubImja1[i]:=False;
	end;

If Tip=1 then //Собираем маленький
  Begin
  //находим нужные кубики для маленького
  For i:=1 to 5 do
    For j:=1 to 5 do
      Begin
      If KubCifra[j]=i then
		Begin
		KubImja1[j]:=true;
        Break;
        end
      end;
	//Фиксим нужные кубики
	For i:=1 to 5 do
		Begin
		If KubImja1[i]=true then
				ClickKub(KubImja[i], true)
		else ClickKub(KubImja[i], false);
		end;
  NajatBrosok;
  exit;
  end
else //Собираем большой
  Begin
  //Фиксим кубики для большого
  For i:=2 to 6 do
    For j:=1 to 5 do
      Begin
      If KubCifra[j]=i then
        Begin
		KubImja1[j]:=true;
        Break;
        end;
	  end;
	//Фиксим нужные кубики
	For i:=1 to 5 do
		Begin
		If KubImja1[i]=true then
				ClickKub(KubImja[i], true)
		else ClickKub(KubImja[i], false);
		end;
  NajatBrosok;
  exit;
  end;
end;

procedure TForm1.SoberaemFaul_DvePari(Tip,x1,x2:integer);
var i,j:integer;
KubImja1:Array[1..5]of Boolean;
Begin
For i:=1 to 5 do 
	Begin
	KubImja1[i]:=False;
	end;
	
j:=0;
For i:=1 to 5 do
    If KubCifra[i]=x1 then
      Begin
	  KubImja1[i]:=True;
      inc(j);
      If j=Tip then Break;
      end;
j:=0;
For i:=1 to 5 do
	If KubCifra[i]=x2 then
		Begin
		KubImja1[i]:=True;
		inc(j);
		If j=2 then Break;
		end;
	//Фиксим нужные кубики
	For i:=1 to 5 do
		Begin
		If KubImja1[i]=true then
				ClickKub(KubImja[i], true)
		else ClickKub(KubImja[i], false);
		end;
  //sledujushiy brosok
  NajatBrosok;
end;

procedure TForm1.SoberaemOdinakovie(Tip:integer);
var i:integer;
Begin
For i:=1 to 5 do
  If KubCifra[i]=Tip then ClickKub(kubImja[i], true)
  else ClickKub(kubImja[i], false);
//sledujushiy brosok
NajatBrosok;
end;

procedure TForm1.SoberaemEralash;
var i:integer;
Begin
For i:=1 to 5 do
  If (KubCifra[i]=6) or (KubCifra[i]=5) then ClickKub(kubImja[i], true)
	else ClickKub(kubImja[i], false);
  //sledujushiy brosok
NajatBrosok;
end;

procedure TForm1.HodKomputera3;
Var i,x,x1,x2,j:Integer;
Komp1_10:Array [1..10] of Integer;
Komp1_6:Array [1..6] of Integer;
Komp9_12:Array [9..12] of Integer;
KubKol:Array[1..6]of Integer;
Begin

If (nomBroska=0) and (Igroki[igr]=1) then
  Begin
  Application.ProcessMessages;
  Sleep(300);
  NajatBrosok;
  Exit;
  end;

//Если 15 ход то играем в шанс
If Hod=15 then
  Begin
  HodKomputera_Shans;
  exit;
  end;

//Проверяем на Покер Большой маленький после каждого броска
If (Mas[13,igr]=0) or (Mas[14,igr]=0) or (Mas[16,igr]=0) then
  Begin
  x:=Proverka_KajdiyRaz;
  If x>0 then
    Begin
    Zaderjka;
    Najatie(x);
    exit;
    end;
  end;

//Проверяем на сбор 5 одинаковых цыфр после каждого броска если эти цифры еще не собраны
If (Mas[1,igr]=0) or (Mas[2,igr]=0) or (Mas[3,igr]=0) or
    (Mas[4,igr]=0) or (Mas[5,igr]=0) or (Mas[6,igr]=0) then
  Begin
  x:=Proverka_KajdiyRaz;
  If x>0 then
    Begin
    Zaderjka;
    Najatie(x);
    exit;
    end;
  end;

//Проверяем на фаул, 2 пары, квадрат, треугольник
//c первого броска, и взависимости от хода;
If (nomBroska=1)and((Mas[9,igr]=0) or (Mas[10,igr]=0) or
  (Mas[11,igr]=0) or (Mas[12,igr]=0)) then
  Begin
  x:=Proverka_NeKajdiyRaz;
  If x>0 then
    Begin
    Zaderjka;
    Najatie(x);
    exit;
    end;
  end;

//Проверка Пара с первого броска в зависимости от хода
If (Mas[8,igr]=0) then
  Begin
  If (Hod<=12) and (Kub8_10_11(2)=24) then
    Begin
    Zaderjka;
    Najatie(8);
    exit;
    end;
  If (Hod>=13) and (Kub8_10_11(2)>20) then
    Begin
    Zaderjka;
    Najatie(8);
    exit;
    end;
  If (Hod=14) and (Kub8_10_11(2)<>0) then
    Begin
    Zaderjka;
    Najatie(8);
    exit;
    end;
  end;
//----------------------
If NomBroska<3 then
  Begin
  soberal:=0;
  //Обнулить кубики
  For i:=1 to 6 do
    KubKol[i]:=0;

  //Записуем имя кубиков и их значение
  For i:=1 to 5 do
    Begin
    KubImja[i]:=(FindComponent('k'+IntToStr(i)) as TKub);
    KubCifra[i]:=KubImja[i].Znachenie;
    Case KubCifra[i] of
      1:Inc(KubKol[1]);
      2:Inc(KubKol[2]);
      3:Inc(KubKol[3]);
      4:Inc(KubKol[4]);
      5:Inc(KubKol[5]);
      6:Inc(KubKol[6]);
      end;
    End;

  //Проверка на возможность сoбрать Большой или маленький пока свободны 1,2,Ералаш
  If (Mas[1,Igr]=0) or (Mas[13,igr]=0) or (Mas[14,igr]=0)  or (Mas[2,Igr]=0) or (Mas[15,Igr]=0) then
    Begin
    //Проверяем для большого
    If Mas[13,igr]=0 then
      Begin
      x:=0;
      For i:=2 to 6 do
        For j:=1 to 5 do
          Begin
          If KubCifra[j]=i then
            Begin
            inc(x);
            Break;
            end;
          end;
      If x=4 then
        Begin
        Soberal:=13;
        SobiraemBolshoy_Malenkiy(2);
        exit;
        end;
      end;
    //Проверяем для маленького
    If Mas[14,Igr]=0 then
      Begin
      x:=0;
      For i:=1 to 5 do
        For j:=1 to 5 do
          Begin
          If KubCifra[j]=i then
            Begin
            inc(x);
            Break;
            end;
          end;
      If (x=4) then
        Begin
        Soberal:=14;
        SobiraemBolshoy_Malenkiy(1);
        Exit
        End;
      end;
    end;

  //Прверяем на возможность собрать фаул
  If Mas[12,igr]=0 then
    Begin
    x1:=0;
    x2:=0;
	If Hod<=7 then
		Begin
		For i:=6 downto 3 do
			If KubKol[i]=2 then
				Begin
				x1:=i;
				break;
				end;
		For i:=6 downto 3 do
			If (KubKol[i]=2) and (i<>x1) then
				Begin
				x2:=i;
				break;
				end;
		end;
	If Hod>7 then
		Begin
		For i:=6 downto 1 do
			If KubKol[i]=2 then
				Begin
				x1:=i;
				break;
				end;
		For i:=6 downto 1 do
			If (KubKol[i]=2) and (i<>x1) then
				Begin
				x2:=i;
				break;
				end;
		end;
    If (x1<>0) and (x2<>0) then
      Begin
	  Soberal:=12;
      SoberaemFaul_DvePari(3,x1,x2);
      exit;
      end;
    end;

  //Собираем 1,2,3,4,5,6,треугольник, квадрат,покер (покаместь свободно 1-6)
  //Ищем где больше одинаковых
  x:=0;
  For i:=6 downto 1 do
    If Mas[i,igr]=0 then
      Begin
      x:=i;
      break;
      end;
  If x>0 then
    Begin
    For i:=6 downto 1 do
      If (KubKol[i]>KubKol[x]) and (Mas[i,igr]=0) then x:=i;
    //Жмем на кубики которых больше
    Soberal:=x;
    SoberaemOdinakovie(x);
    exit;
    end;

  //Если собраны все 1-6 выбираем что собирать из оставшигося
  //Собираем треугольник квадрат
  If (Mas[10,igr]=0) or (Mas[11,igr]=0) then
    Begin
    x:=6;
    For i:=5 downto 1 do
      If KubKol[i]>KubKol[x] then x:=i;
    Soberal:=11;
    SoberaemOdinakovie(x);
    exit;
    end;

  //Если покер не собран и выпало 4 одинаковых пробуем собрат покер
  If Mas[16,igr]=0 then
    Begin
    x:=0;
    For i:=6 downto 1 do
      If KubKol[i]=4 then x:=i;
    If x<>0 then
      Begin
      Soberal:=16;
      SoberaemOdinakovie(x);
      exit;
      end;
    end;

  //Собираем фаул и две пары если есть 4-1, 3-1, 2-2, 1-1
  If (Mas[12,igr]=0) or (Mas[9,igr]=0) then
    Begin
    x1:=0;
    x2:=0;
    For i:=6 downto 1 do
      If KubKol[i]>=3 then
        Begin
        x1:=i;
        break;
        end;
    For i:=6 downto 1 do
      If KubKol[i]=2 then
        Begin
        x2:=i;
        break;
        end;
    If x1=0 then
      Begin
      For i:=6 downto 1 do
        If (KubKol[i]=2) and (i<>x2)  then
        Begin
        x1:=i;
        break;
        end;
      end;
    If x1=0 then
      Begin
      For i:=6 downto 1 do
        If (KubKol[i]=1) and (i<>x2)  then
        Begin
        x1:=i;
        break;
        end;
      end;
	If x2=0 then
      Begin
	  For i:=6 downto 1 do
        If (KubKol[i]=1) and (i<>x1)  then
        Begin
        x2:=i;
        break;
        end;
      end;
	Soberal:=12;	
	SoberaemFaul_DvePari(3,x1,x2);
	exit;
	end;


  //Собираем большой или маленький
  If (Mas[13,igr]=0) or (Mas[14,igr]=0) then
    begin
    x1:=0;
    x2:=0;
    If Mas[13,igr]=0 then
      Begin
        x:=0;
        For i:=2 to 6 do
          For j:=1 to 5 do
            If KubCifra[j]=i then
              Begin
              inc(x);
              Break;
              end;
      x1:=x;
      end;
    If Mas[14,igr]=0 then
      Begin
        x:=0;
        For i:=2 to 6 do
          For j:=1 to 5 do
            If KubCifra[j]=i then
              Begin
              inc(x);
              Break;
              end;
      x2:=x;
      end;
    If x1>x2 then
      Begin
      Soberal:=13;
      SobiraemBolshoy_Malenkiy(2);
      Exit;
      End;
    If x2>x1 then
      Begin
      Soberal:=14;
      SobiraemBolshoy_Malenkiy(1);
      Exit
      End;
    end;

    //Последни раз смобрать покер;
  If Mas[16,igr]=0 then
    Begin
    x:=6;
    For i:=5 downto 1 do
      If KubKol[i]>KubKol[x] then x:=i;
    If x<>0 then
      Begin
      Soberal:=16;
      SoberaemOdinakovie(x);
      exit;
      end;
    end;
	
	 //Последни раз смобрать  пару;
  If Mas[8,igr]=0 then
    Begin
    x:=6;
    For i:=5 downto 1 do
      If KubKol[i]>KubKol[x] then x:=i;
    If x<>0 then
      Begin
      Soberal:=8;
      SoberaemOdinakovie(x);
      exit;
      end;
    end;

  If Mas[15,igr]=0 then
    Begin
	Soberal:=15;
    SoberaemEralash;
    exit;
    end;
  end;//Конец если было меньше 3 бросков
  
If NomBroska=3 then // Если было 3 броска выбираем что нажать
  Begin
  //Проверяем на фаул, 2 пары, квадрат, треугольник взависимости от хода;
  If (Mas[9,igr]=0) or (Mas[10,igr]=0) or
      (Mas[11,igr]=0) or (Mas[12,igr]=0) then
    Begin
    x:=Proverka_NeKajdiyRaz;
    If x>0 then
      Begin
      Zaderjka;
      Najatie(x);
      exit;
      end;
    end;



  //Обнуляем массивы
  For i:=1 to 6 do
    Komp1_6[i]:=-100;
  For i:=9 to 12 do
    Komp9_12[i]:=-100;

  //Записываем количество очков
  For i:=1 to 6 do
    Begin
    If Mas[i,igr]=0 then
      Komp1_6[i]:=Kub1_6(i); // 1-6
    end;

  If Mas[9,igr]=0 then
    Komp9_12[9]:=Kub9_12(2);//2 пары

  If Mas[10,igr]=0 then
    Komp9_12[10]:=Kub8_10_11(3);//треугольнтик

  If Mas[11,igr]=0 then
    Komp9_12[11]:=Kub8_10_11(4); //квадрат

  If Mas[12,igr]=0 then
    Komp9_12[12]:=Kub9_12(3);//Фаул
  //Закончили записывать количество очков в масив

  //Смотрим что собирал и если не собрал сравниваем с похожими
  If Soberal=12 then
    Begin
    If Komp9_12[12]>0 then
      Begin
      Zaderjka;
      Najatie(12);
      exit;
      end;
    If Komp9_12[9]>0 then
      Begin
      Zaderjka;
      Najatie(9);
      exit;
      end;
    If (Mas[2,igr]=0) and (Kub1_6(2)>=-2)then
      Begin
      Zaderjka;
      Najatie(2);
      exit;
      end;
    If (Mas[1,igr]=0) and (Kub1_6(1)>=-3)then
      Begin
      Zaderjka;
      Najatie(1);
      exit;
      end;
	If Mas[15,igr]=0 then
      Begin
      Zaderjka;
      Najatie(15);
      exit;
      end;
    If Mas[12,igr]=0 then
      Begin
      Zaderjka;
      Najatie(12);
      exit;
      end;
    If Mas[9,igr]=0 then
      Begin
      Zaderjka;
      Najatie(9);
      exit;
      end;
    end;

  If Soberal=11 then
    Begin
    If Komp9_12[11]>0 then
      Begin
      Zaderjka;
      Najatie(11);
      exit;
      end;
    If Komp9_12[10]>0 then
      Begin
      Zaderjka;
      Najatie(10);
      exit;
      end;
    If (Mas[2,igr]=0) and (Kub1_6(2)>=-2)then
      Begin
      Zaderjka;
      Najatie(2);
      exit;
      end;
    If (Mas[1,igr]=0) and (Kub1_6(1)>=-3)then
      Begin
      Zaderjka;
      Najatie(1);
      exit;
      end;
	If Mas[15,igr]=0 then
      Begin
      Zaderjka;
      Najatie(15);
      exit;
      end;
    If Mas[11,igr]=0 then
      Begin
      Zaderjka;
      Najatie(11);
      exit;
      end;
    If Mas[10,igr]=0 then
      Begin
      Zaderjka;
      Najatie(10);
      exit;
      end;
    end;

  If Soberal=14 then
    Begin
    If (Mas[2,igr]=0) and (Kub1_6(2)>=-2)then
      Begin
      Zaderjka;
      Najatie(2);
      exit;
      end;
    If (Mas[1,igr]=0) and ((Kub1_6(1)>=-3))then
      Begin
      Zaderjka;
      Najatie(1);
      exit;
      end;
    If (Mas[15,igr]=0) then
      Begin
      Zaderjka;
      Najatie(15);
      exit;
      end;
    If (Mas[14,igr]=0) then
      Begin
      Zaderjka;
      Najatie(14);
      exit;
      end;
    end;

  If (Soberal=13) then
    Begin
    If (Mas[2,igr]=0) and (Kub1_6(2)>=-2)then
      Begin
      Zaderjka;
      Najatie(2);
      exit;
      end;
    If (Mas[1,igr]=0) and (Kub1_6(1)>=-3)then
      Begin
      Zaderjka;
      Najatie(1);
      exit;
      end;
    If (Mas[15,igr]=0) then
      Begin
      Zaderjka;
      Najatie(15);
      exit;
      end;
    If (Mas[13,igr]=0) then
      Begin
      Zaderjka;
      Najatie(13);
      exit;
      end;
    end;

  If (Soberal=16) and (Mas[16,igr]=0) then
    Begin
    Zaderjka;
    Najatie(16);
    exit;
    end;

  If Soberal<=6 then
    Begin
    If KubKol[Soberal]>=3 then
      Begin
      Zaderjka;
      Najatie(Soberal);
      exit;
      end;
    x1:=0;
    x2:=0;
    J:=0;
    For i:=1 to 6 do
      Begin
      If Komp1_6[i]<>-100 then x1:=4+Round(Komp1_6[i]/i);
      If x1>x2 then
        Begin
        x2:=x1;
        j:=i;
        end;
      end;
    If j>0 then
      Begin
      Zaderjka;
      Najatie(j);
      exit;
      end;
    If Mas[15,Igr]=0 then
      Begin
      Zaderjka;
      Najatie(15);
      exit;
      end;

    If ((Soberal=6) and (Komp1_6[6]<-12)) or ((Soberal=5) and (Komp1_6[5]<-10)) then
      Begin
      If Mas[15,igr]=0 then
        Begin
        Zaderjka;
        Najatie(15);
        exit;
        end;
      If Mas[14,igr]=0 then
        Begin
        Zaderjka;
        Najatie(14);
        exit;
        end;
      If Mas[13,igr]=0 then
        Begin
        Zaderjka;
        Najatie(13);
        exit;
        end;
      If Mas[12,igr]=0 then
        Begin
        Zaderjka;
        Najatie(12);
        exit;
        end;
      If Mas[16,igr]=0 then
        Begin
        Zaderjka;
        Najatie(16);
        exit;
        end;
      If Mas[9,igr]=0 then
        Begin
        Zaderjka;
        Najatie(9);
        exit;
        end;
      If Mas[11,igr]=0 then
        Begin
        Zaderjka;
        Najatie(11);
        exit;
        end;
      If Mas[10,igr]=0 then
        Begin
        Zaderjka;
        Najatie(10);
        exit;
        end;
      If Mas[8,igr]=0 then
        Begin
        Zaderjka;
        Najatie(8);
        exit;
        end;
      end;

    If Mas[Soberal,igr]=0 then
      Begin
      Zaderjka;
      Najatie(Soberal);
      exit;
      end;
    end;
	
	If (Soberal=8) and (Mas[8,igr]=0) then
		Begin
		Zaderjka;
		Najatie(15);
		exit;		
		end;
		
  If (Soberal=15) and (Mas[15,Igr]=0) then
    Begin
    Zaderjka;
    Najatie(15);
    exit;
    end;
  
  end;//Конец нажатия
//----------------------
end;

procedure TForm1.NajatBrosok;
begin
Image5MouseDown(Image5, mbLeft, [ssLeft], 0, 0);
Application.ProcessMessages;
sleep(100);
Image5MouseUp(Image5, mbLeft, [ssLeft], 0, 0);
end;

procedure TForm1.RG1Click(Sender: TObject);
begin
If Game<>'Game' then NovajaIgra;
end;

end.
