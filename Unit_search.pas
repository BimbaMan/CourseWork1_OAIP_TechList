unit Unit_search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, OrgTechAPI;

type
  TForm_search = class(TForm)
    Combo1: TComboBox;
    Combo2: TComboBox;
    Confirm: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure ConfirmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Combo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Field :integer;
    Value :string;

  end;

var
  Form_search: TForm_search; HelpData :OrgTechAPI.THelpData;

implementation

{$R *.dfm}

procedure TForm_search.Combo1Change(Sender: TObject);
var  i :integer;
begin
Combo2.Enabled:=true;
Field:=Combo1.ItemIndex;
Combo2.Clear;
 case Field of
  0:
  begin
   for i := 0 to length(HelpData.Regnumber)-1 do
    Combo2.Items.Add(HelpData.Regnumber[i]);
  end;
  1:
  begin
   for i := 0 to length(HelpData.Name)-1 do
    Combo2.Items.Add(HelpData.Name[i]);
  end;
  2:
  begin
   for i := 0 to length(HelpData.Category)-1 do
    Combo2.Items.Add(HelpData.Category[i]);
  end;
  3:
  begin
   for i := 0 to length(HelpData.DateOfGuaranty)-1 do
    Combo2.Items.Add(HelpData.DateOfGuaranty[i]);
  end;
  4:
  begin
   for i := 0 to length(HelpData.Office)-1 do
    Combo2.Items.Add(HelpData.Office[i]);
  end;
  5:
  begin
   for i := 0 to length(HelpData.TelNumber)-1 do
    Combo2.Items.Add(HelpData.TelNumber[i]);
  end;
  6:
  begin
   for i := 0 to length(HelpData.Tecnician)-1 do
    Combo2.Items.Add(HelpData.Tecnician[i]);
  end;
 end;
end;

procedure TForm_search.ConfirmClick(Sender: TObject);
begin
if Combo1.ItemIndex=-1 then
 begin
  ShowMessage('¬ведите данные в поле "1"!'); exit;
 end;
Value:=trim(Combo2.Text);
  if Value='' then
   begin
    ShowMessage('¬ведите данные в поле "2"!'); exit;
   end
   else
   begin
    Form_search.Close;
    OrgTechAPI.CleanHelpData(HelpData);
   end;

end;

procedure TForm_search.FormShow(Sender: TObject);
begin
OrgTechAPI.CleanHelpData(HelpData);
OrgTechAPI.LoadHelpData(HelpData);
Combo1.ItemIndex:=-1;
Combo2.Clear;
Combo2.Enabled:=false;
end;

end.
