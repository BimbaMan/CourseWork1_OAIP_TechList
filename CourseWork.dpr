program CourseWork;

uses
  Vcl.Forms,
  Unit_Main in 'Unit_Main.pas' {Form_Main},
  Unit_edit in 'Unit_edit.pas' {Form_edit},
  Unit_delete in 'Unit_delete.pas' {Form_delete},
  Unit_add in 'Unit_add.pas' {Form_add},
  Unit_charts in 'Unit_charts.pas' {Form_charts},
  Unit_search in 'Unit_search.pas' {Form_search},
  OrgTechAPI in 'OrgTechAPI.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
 // Application.CreateForm(TForm_hello, Form_hello);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TForm_edit, Form_edit);
  Application.CreateForm(TForm_delete, Form_delete);
  Application.CreateForm(TForm_add, Form_add);
  Application.CreateForm(TForm_charts, Form_charts);
  Application.CreateForm(TForm_search, Form_search);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
