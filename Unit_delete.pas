unit Unit_delete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, OrgTechAPI;

type
  TForm_delete = class(TForm)
    Button_yes: TButton;
    Label_confirm: TLabel;
    Button_no: TButton;
    procedure Button_yesClick(Sender: TObject);
    procedure Button_noClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Data :OrgTechAPI.TData;
  end;

var
  Form_delete: TForm_delete;

implementation

{$R *.dfm}

procedure TForm_delete.Button_noClick(Sender: TObject);
begin
Form_delete.Close;
end;

procedure TForm_delete.Button_yesClick(Sender: TObject);
begin

OrgTechAPI.DeleteEl(Data);
Form_delete.Close;
end;

end.
