unit Unit_add;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, OrgTechAPI, Vcl.ComCtrls,
  Vcl.WinXPickers;

type
  TForm_add = class(TForm)
    Label_regnumber: TLabel;
    Label_name: TLabel;
    Label_category: TLabel;
    Label_dateofgaranty: TLabel;
    Label_office: TLabel;
    Label_technician: TLabel;
    Save: TButton;
    Edit_regnumber: TEdit;
    DatePicker: TDateTimePicker;
    NoGuaranty: TCheckBox;
    Combo_name: TComboBox;
    Combo_category: TComboBox;
    Combo_office: TComboBox;
    Combo_tecnician: TComboBox;
    Label_Telnumber: TLabel;
    Combo_telnumber: TComboBox;
    Label_more: TLabel;
    Edit_more: TEdit;
    CreateRegNum: TCheckBox;
    procedure SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NoGuarantyClick(Sender: TObject);
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
  end;


var
  Form_add: TForm_add;



implementation
{$R *.dfm}

procedure TForm_add.Combo_categoryKeyPress(Sender: TObject; var Key: Char);
begin
If not (Pos(key,'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя')>0) then
 if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '/', '(', ')', '0'..'9', ':', '-', char(ord(vk_delete)),char(ord(vk_back))])
 Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_add.Combo_nameKeyPress(Sender: TObject; var Key: Char);
begin
  If not (Pos(key,'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя')>0) then
  if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '/', '(', ')', '0'..'9', ':', '-', char(ord(vk_delete)),char(ord(vk_back))])
  Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_add.Combo_officeKeyPress(Sender: TObject; var Key: Char);
begin
 If not (Pos(key,'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя')>0) then
  if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '/', '(', ')', '0'..'9', ':', '-', char(ord(vk_delete)),char(ord(vk_back))])
  Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_add.Combo_tecnicianKeyPress(Sender: TObject; var Key: Char);
begin
If not (Pos(key,'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя')>0) then
  if not (Key in ['a'..'z', 'A'..'Z', ' ', '.', '-', char(ord(vk_delete)),char(ord(vk_back))])
  Then
  begin
  beep;
  Key:=#0;
  end;
end;

procedure TForm_add.Combo_telnumberKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['+','0'..'9',char(ord(vk_delete)),char(ord(vk_back))]) then
  begin
    beep;
    Key:=#0;
  end;
end;

procedure TForm_add.CreateRegNumClick(Sender: TObject);
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
   if tmp<1 then
    tmp:=1+abs(tmp);
  Str:=inttostr(tmp);
      if length(str) < 10 then  // заполнение нулями
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

procedure TForm_add.FormShow(Sender: TObject);
var
  i: integer;
begin
  CreateRegNum.Checked:=false;
Edit_regnumber.Clear;

Combo_name.Clear;
for i := 0 to length(HelpData.Name)-1 do
 Combo_name.Items.Add(HelpData.Name[i]);
Combo_category.Clear;
for i := 0 to length(HelpData.Category)-1 do
 Combo_category.Items.Add(HelpData.Category[i]);
NoGuaranty.Checked:=false;
DatePicker.Date:=Now;
DatePicker.Visible:=true;
 Combo_office.Clear;
for i := 0 to length(HelpData.Office)-1 do
 Combo_office.Items.Add(HelpData.Office[i]);
Combo_telnumber.Clear;
for i := 0 to length(HelpData.TelNumber)-1 do
 Combo_telnumber.Items.Add(HelpData.TelNumber[i]);
Combo_tecnician.Clear;
for i := 0 to length(HelpData.Tecnician)-1 do
 Combo_tecnician.Items.Add(HelpData.Tecnician[i]);

 Edit_more.Clear;

Edit_regnumber.SetFocus;
end;

procedure TForm_add.NoGuarantyClick(Sender: TObject);
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

procedure TForm_add.SaveClick(Sender: TObject);
var
Data :OrgTechAPI.TData; str :string; i :integer;
fnum, fname, fcat, foff, ftel, ftecn :boolean;
begin
fnum:=true;
Str:=trim(Edit_regnumber.Text);         //проверка поля регистрационного номера
if str='' then
 begin
  fnum:=false; ShowMessage('Введите данные в поле "Регистрационный номер"!'); Edit_regnumber.SetFocus;
  Exit;
 end;
 if length(str)<10 then                    //заполнение нулями
  for i := 1 to 10-(length(str)) do
   str:='0'+str;
 if length(HelpData.Regnumber)>0 then
 for i := 0 to length(HelpData.Regnumber) do           //проверка на уникальность
  if (HelpData.Regnumber[i]=str) then
   begin
   fnum:=false;
    ShowMessage('Регистрационный номер не уникален!');
    Edit_regnumber.Clear;
    Edit_regnumber.SetFocus;
    Exit;
   end;
   if fnum then
    Data.Regnumber:=str;


 str:=trim(Combo_name.Text);                //проверка поля наименование
 fname:=true;
  if str='' then
   begin
    fname:=false; ShowMessage('Введите данные в поле "Наименование"!');
    Exit;
   end
   else Data.Name:=str;


 str:=trim(Combo_category.Text);         //проверка поля категория
 fcat:=true;
  if str='' then
   begin
    fcat:=false; ShowMessage('Введите данные в поле "Категория"!');
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

 str:=trim(Combo_office.Text);                  //проверка поля адрес офиса
 foff:=true;
  if str='' then
   begin
    foff:=false; ShowMessage('Введите данные в поле "Адрес офиса"!');
    Exit;
   end
   else Data.Office:=str;

 str:=trim(Combo_telnumber.Text);                //проверка поля номер телефона
 ftel:=true;
  if str='' then
   begin
    ftel:=false; ShowMessage('Введите данные в поле "Номер телефона"!');
    Exit;
   end
   else Data.TelNumber:=str;

 str:=trim(Combo_tecnician.Text);      //проверка поля ответственный за технику
 ftecn:=true;
  if str='' then
   begin
    ftecn:=false; ShowMessage('Введите данные в поле "Ответственный за технику"!');
    Exit;
   end
   else Data.Tecnician:=str;

 str:=trim(Edit_more.Text);      //проверка поля дополнительно
 Data.More:=str;

if (fnum) and (fname) and (fcat) and (foff) and (ftel) and (ftecn) then
 begin
  OrgTechAPI.CreateNewEl(Data);
  Form_add.Close;
 end;
end;
end.
