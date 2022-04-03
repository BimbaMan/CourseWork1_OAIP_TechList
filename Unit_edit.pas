unit Unit_edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, OrgTechAPI, Vcl.ComCtrls;

type
  TForm_edit = class(TForm)
    Save: TButton;
    Label_regnumber: TLabel;
    Label_name: TLabel;
    Label_category: TLabel;
    Label_dateofgaranty: TLabel;
    Label_office: TLabel;
    Label_technician: TLabel;
    Edit_regnumber: TEdit;
    DatePicker: TDateTimePicker;
    NoGuaranty: TCheckBox;
    Combo_name: TComboBox;
    Combo_category: TComboBox;
    Combo_office: TComboBox;
    Combo_tecnician: TComboBox;
    Label_Telnumber: TLabel;
    Label_more: TLabel;
    Edit_more: TEdit;
    Combo_telnumber: TComboBox;
    CreateRegNum: TCheckBox;
    procedure NoGuarantyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure Combo_nameKeyPress(Sender: TObject; var Key: Char);
    procedure Combo_categoryKeyPress(Sender: TObject; var Key: Char);
    procedure Combo_officeKeyPress(Sender: TObject; var Key: Char);
    procedure Combo_tecnicianKeyPress(Sender: TObject; var Key: Char);
    procedure Combo_telnumberKeyPress(Sender: TObject; var Key: Char);
    procedure CreateRegNumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    HelpData :OrgTechAPI.THelpData;
    Data :OrgTechAPI.TData;
  end;

var
  Form_edit: TForm_edit;

implementation
{$R *.dfm}


procedure TForm_edit.Combo_categoryKeyPress(Sender: TObject; var Key: Char);
begin
If not (Pos(key,'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№ЁёяабвгдеЄжзийклмнопрстуфхцчшщъыьэю€')>0) then
 if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '/', '(', ')', '0'..'9', ':', '-', char(ord(vk_delete)),char(ord(vk_back))])
 Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_edit.Combo_nameKeyPress(Sender: TObject; var Key: Char);
begin
  If not (Pos(key,'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№ЁёяабвгдеЄжзийклмнопрстуфхцчшщъыьэю€')>0) then
  if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '/', '(', ')', '0'..'9', ':', '-', char(ord(vk_delete)),char(ord(vk_back))])
  Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_edit.Combo_officeKeyPress(Sender: TObject; var Key: Char);
begin
 If not (Pos(key,'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№ЁёяабвгдеЄжзийклмнопрстуфхцчшщъыьэю€')>0) then
  if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '/', '(', ')', '0'..'9', ':', '-', char(ord(vk_delete)),char(ord(vk_back))])
  Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_edit.Combo_tecnicianKeyPress(Sender: TObject; var Key: Char);
begin
If not (Pos(key,'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№ЁёяабвгдеЄжзийклмнопрстуфхцчшщъыьэю€')>0) then
  if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '-', char(ord(vk_delete)),char(ord(vk_back))])
  Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_edit.Combo_telnumberKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['+','0'..'9',char(ord(vk_delete)),char(ord(vk_back))]) then
  begin
    beep;
    Key:=#0;
  end;
end;

procedure TForm_edit.CreateRegNumClick(Sender: TObject);
Var i:integer; tmp:int64; str :string; flag :boolean;
begin
if CreateRegNum.Checked then
 begin
  Edit_regnumber.Enabled:=false;
  flag:=true;
 while flag do
  begin
  randomize;
  tmp:=1;
  tmp:=tmp+random(high(integer)); tmp:=tmp+random(high(integer)); tmp:=tmp+random(high(integer)); tmp:=tmp+random(high(integer));
  tmp:=tmp+random(1410065415);
  Str:=inttostr(tmp);
      if length(str) < 10 then  // заполнение нул€ми
        for i := 1 to 10 - (length(str)) do
          str := '0' + str;
      if length(HelpData.Regnumber) > 0 then
      begin
        for i := 0 to length(HelpData.Regnumber) do // проверка на уникальность
          if (HelpData.Regnumber[i] = str) then
            flag := true
          else
            flag := false;
      end
      else flag:=false;
    end;
  Edit_regnumber.Text:=str;
  end
  else
  begin
    Edit_regnumber.Clear;
    Edit_regnumber.Enabled := true;
  end;

end;

procedure TForm_edit.FormShow(Sender: TObject);
var i :integer;
begin
Edit_regnumber.Text:=Data.Regnumber;

Combo_name.Clear;
Combo_name.Text:=Data.Name;
for i := 0 to length(HelpData.Name)-1 do
 Combo_name.Items.Add(HelpData.Name[i]);

Combo_category.Clear;
Combo_category.Text:=Data.Category;
for i := 0 to length(HelpData.Category)-1 do
 Combo_category.Items.Add(HelpData.Category[i]);

if Data.DateOfGuaranty='нет'then
 begin
  NoGuaranty.Checked:=true;
  DatePicker.Visible:=false;
 end
else
 begin
  NoGuaranty.Checked:=false;
  DatePicker.Visible:=true;
  DatePicker.Date:=strtodate(Data.DateOfGuaranty);
 end;

Combo_office.Clear;
Combo_office.Text:=Data.Office;
for i := 0 to length(HelpData.Office)-1 do
 Combo_office.Items.Add(HelpData.Office[i]);

Combo_telnumber.Clear;
Combo_telnumber.Text:=Data.TelNumber;
for i := 0 to length(HelpData.TelNumber)-1 do
 Combo_telnumber.Items.Add(HelpData.TelNumber[i]);

Combo_tecnician.Clear;
Combo_tecnician.Text:=Data.Tecnician;
for i := 0 to length(HelpData.Tecnician)-1 do
 Combo_tecnician.Items.Add(HelpData.Tecnician[i]);

Edit_more.Text:=Data.More;

Edit_regnumber.SetFocus;
end;

procedure TForm_edit.NoGuarantyClick(Sender: TObject);
begin
  if NoGuaranty.Checked then
  begin
   DatePicker.Enabled:=false;
  end
 else
  begin
   DatePicker.Enabled:=true;
  end;
end;

procedure TForm_edit.SaveClick(Sender: TObject);
var str :string; i :integer;
fnum, fname, fcat, foff, ftel, ftecn, fmore :boolean;
begin
fnum:=true;
Str:=trim(Edit_regnumber.Text);         //проверка пол€ регистрационного номера
if str='' then
 begin
  fnum:=false; ShowMessage('¬ведите данные в поле "–егистрационный номер"!'); Edit_regnumber.SetFocus;
  Exit;
 end;
 if length(str)<10 then
  for i := 1 to 10-(length(str)) do
   str:='0'+str;
 if length(HelpData.Regnumber)>0 then
 for i := 0 to length(HelpData.Regnumber) do           //проверка на уникальность
  if (HelpData.Regnumber[i]=str) and (HelpData.Regnumber[i]<>Edit_regnumber.Text) then
   begin
   fnum:=false;
    ShowMessage('–егистрационный номер не уникален!');
    Edit_regnumber.Clear;
    Edit_regnumber.SetFocus;
    Exit;
   end;
   if fnum then
    Data.Regnumber:=str;


 str:=trim(Combo_name.Text);                //проверка пол€ наименование
 fname:=true;
  if str='' then
   begin
    fname:=false; ShowMessage('¬ведите данные в поле "Ќаименование"!');
    Exit;
   end
   else Data.Name:=str;


 str:=trim(Combo_category.Text);         //проверка пол€ категори€
 fcat:=true;
  if str='' then
   begin
    fcat:=false; ShowMessage('¬ведите данные в поле " атегори€"!');
    Exit;
   end
   else Data.Category:=str;

  if NoGuaranty.Checked then                //проверка даты
   begin
    Data.DateOfGuaranty:='нет';
   end
  else
   begin
    if Int(DatePicker.Date) <> Int(Now) then
     Data.DateOfGuaranty:=datetostr(DatePicker.Date)
    else Data.DateOfGuaranty:='нет';
   end;

 str:=trim(Combo_office.Text);                  //проверка пол€ адрес офиса
 foff:=true;
  if str='' then
   begin
    foff:=false; ShowMessage('¬ведите данные в поле "јдрес офиса"!');
    Exit;
   end
   else Data.Office:=str;

 str:=trim(Combo_telnumber.Text);                //проверка пол€ номер телефона
 ftel:=true;
  if str='' then
   begin
    ftel:=false; ShowMessage('¬ведите данные в поле "Ќомер телефона"!');
    Exit;
   end
   else Data.TelNumber:=str;

 str:=trim(Combo_tecnician.Text);      //проверка пол€ ответственный за технику
 ftecn:=true;
  if str='' then
   begin
    ftecn:=false; ShowMessage('¬ведите данные в поле "ќтветственный за технику"!');
    Exit;
   end
   else Data.Tecnician:=str;

 str:=trim(Edit_more.Text);      //проверка пол€ дополнительно
 Data.More:=str;


if (fnum) and (fname) and (fcat) and (foff) and (ftel) and (ftecn) then
 begin
  OrgTechAPI.ReplaceElData(Data);
  Form_edit.Close;
 end;
end;

end.
