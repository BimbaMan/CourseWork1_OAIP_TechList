unit Unit_charts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, OrgTechAPI;

type
  TForm_charts = class(TForm)
    Charts_graph: TImage;
    ComboBox1: TComboBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form_charts: TForm_charts;

implementation

{$R *.dfm}


procedure TForm_charts.ComboBox1Change(Sender: TObject);
var Arr :OrgTechAPI.TChartsArr; GarNo, GarYes, i, xbegin, ybegin, maxval, temp :integer;
begin
Charts_graph.Canvas.Brush.Color := clWhite;
Charts_graph.Canvas.Rectangle(0, 0, Charts_graph.ClientWidth, Charts_graph.ClientHeight);
OrgTechAPI.GetDataForCharts(Arr, GarYes, GarNo);
 case ComboBox1.ItemIndex of
  0:  // количество устройств разных категорий
  begin
   xbegin := (Charts_graph.ClientWidth div (length(Arr.CategoryArr)+2));
   ybegin := (Charts_graph.ClientHeight div 11) * 10;
   Charts_graph.Canvas.MoveTo(xbegin, ybegin);

   maxval:=Arr.ColArr[0];
   for i := 1 to length(Arr.ColArr)-1 do
    begin
      if Arr.ColArr[i]>maxval then
       maxval:=Arr.ColArr[i];
    end;
   for i := 0 to length(Arr.ColArr)-1 do
   begin
    randomize;
    temp := trunc((Arr.ColArr[i] / maxval) * ybegin);
    Charts_graph.Canvas.Brush.Color:=RGB(random(256),random(256),random(256));
    Charts_graph.Canvas.Rectangle(xbegin, ybegin - temp + 15, xbegin + (Charts_graph.ClientWidth div (length(Arr.CategoryArr)+2)), ybegin);
    Charts_graph.Canvas.Brush.Color:=clWhite;
    Charts_graph.Canvas.TextOut(xbegin+10, ybegin + 5, Arr.CategoryArr[i]);
    Charts_graph.Canvas.TextOut(xbegin+30, ybegin + 30, inttostr(Arr.ColArr[i]));
    xbegin := xbegin + (Charts_graph.ClientWidth div (length(Arr.CategoryArr)+2));
    ybegin := ybegin;
    Charts_graph.Canvas.MoveTo(xbegin, ybegin);
   end;

  end;
  1:  //количество устройств на гарантии и не на гарантии
  begin
   xbegin := (Charts_graph.ClientWidth div 4);
   ybegin := (Charts_graph.ClientHeight div 11) * 10;
   Charts_graph.Canvas.MoveTo(xbegin, ybegin);
   if GarNo>=GarYes then
   begin
      randomize;
      temp := trunc((GarNo/GarNo) * ybegin);
      Charts_graph.Canvas.Brush.Color:=RGB(random(256),random(256),random(256));
      Charts_graph.Canvas.Rectangle(xbegin, ybegin - temp + 15, xbegin + (Charts_graph.ClientWidth div 4), ybegin);
      Charts_graph.Canvas.Brush.Color:=clWhite;
      Charts_graph.Canvas.TextOut(xbegin+10, ybegin + 5, 'Нет гарантии');
      Charts_graph.Canvas.TextOut(xbegin+30, ybegin + 30, inttostr(GarNo));
      xbegin := xbegin + (Charts_graph.ClientWidth div 4);
      ybegin := ybegin;
      Charts_graph.Canvas.MoveTo(xbegin, ybegin);

      temp := trunc((GarYes/GarNo) * ybegin);
      Charts_graph.Canvas.Brush.Color:=RGB(random(256),random(256),random(256));
      Charts_graph.Canvas.Rectangle(xbegin, ybegin - temp + 15, xbegin + (Charts_graph.ClientWidth div 4), ybegin);
      Charts_graph.Canvas.Brush.Color:=clWhite;
      Charts_graph.Canvas.TextOut(xbegin+10, ybegin + 5, 'Есть гарантия');
      Charts_graph.Canvas.TextOut(xbegin+30, ybegin + 30, inttostr(GarYes));
   end
   else
   begin
      randomize;
      temp := trunc((GarNo/GarYes) * ybegin);
      Charts_graph.Canvas.Brush.Color:=RGB(random(256),random(256),random(256));
      Charts_graph.Canvas.Rectangle(xbegin, ybegin - temp + 15, xbegin + (Charts_graph.ClientWidth div 4), ybegin);
      Charts_graph.Canvas.Brush.Color:=clWhite;
      Charts_graph.Canvas.TextOut(xbegin+10, ybegin + 5, 'Нет гарантии');
      Charts_graph.Canvas.TextOut(xbegin+30, ybegin + 30, inttostr(GarNo));
      xbegin := xbegin + (Charts_graph.ClientWidth div 4);
      ybegin := ybegin;
      Charts_graph.Canvas.MoveTo(xbegin, ybegin);

      temp := trunc((GarYes/GarYes) * ybegin);
      Charts_graph.Canvas.Brush.Color:=RGB(random(256),random(256),random(256));
      Charts_graph.Canvas.Rectangle(xbegin, ybegin - temp + 15, xbegin + (Charts_graph.ClientWidth div 4), ybegin);
      Charts_graph.Canvas.Brush.Color:=clWhite;
      Charts_graph.Canvas.TextOut(xbegin+10, ybegin + 5, 'Есть гарантия');
      Charts_graph.Canvas.TextOut(xbegin+30, ybegin + 30, inttostr(GarYes));
   end;

  end;
 end;
end;

procedure TForm_charts.FormShow(Sender: TObject);
begin
ComboBox1.ItemIndex:=-1;
Charts_graph.Canvas.Brush.Color := clWhite;
Charts_graph.Canvas.Rectangle(0, 0, Charts_graph.ClientWidth, Charts_graph.ClientHeight);
end;

end.
