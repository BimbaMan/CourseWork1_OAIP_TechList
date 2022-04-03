unit Unit_hello;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm_hello = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_hello: TForm_hello;

implementation

{$R *.dfm}

procedure TForm_hello.FormShow(Sender: TObject);
var
  x, y, step, j :double;
begin
 with Image1.Canvas do
 begin
  Pen.Color := clRed; // Рисование графика
  Pen.Width := 3;
  step := 0.0000001;
  x := 0;
  y := (sqrt(0.6 * x + 1.5)) / (2 * x + sqrt(sqr(x) + 3));
  Width := Form_hello.Width div 2;;
  Height := Form_hello.Height div 2;
  MoveTo(Round(width+x), Round(Height - y));
  j := 0;
  while j <= 9 do
  begin
    x := j;
    y := (sqrt(0.6 * x + 1.5)) / (2 * x + sqrt(sqr(x) + 3));
    LineTo(Round(Width + 70 * x), Round(Height - 70 * y));
    j := j + step;
  end;
 end;
end;

end.
