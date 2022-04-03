unit Unit_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, System.DateUtils,
  Unit_edit, Unit_add, Unit_delete, Unit_charts, Unit_search, OrgTechAPI;

type
  TForm_Main = class(TForm)
    Data_table: TStringGrid;
    Button_edit: TButton;
    Button_delete: TButton;
    Button_add: TButton;
    Button_charts: TButton;
    Button_search: TButton;
    Combo_sort: TComboBox;
    Button_alldevices: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button_editClick(Sender: TObject);
    procedure Button_deleteClick(Sender: TObject);
    procedure Button_addClick(Sender: TObject);
    procedure Button_chartsClick(Sender: TObject);
    procedure Button_searchClick(Sender: TObject);
    procedure FillTable(const List: OrgTechAPI.TList);
    procedure SizeCols(Grid :TStringGrid);
    procedure HeadStrGrid (Grid :TStringGrid);
    procedure Button_alldevicesClick(Sender: TObject);
    procedure GetRowData(out Data :OrgTechAPI.TData);
    procedure Combo_sortChange(Sender: TObject);
    procedure Data_tableDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form_Main: TForm_Main; //Materials:file of TList;

implementation
{$R *.dfm}


procedure TForm_Main.HeadStrGrid (Grid :TStringGrid);
begin
Grid.Cells[1,0]:='Рег. Номер';
Grid.Cells[2,0]:='Наименование';
Grid.Cells[3,0]:='Категория';
Grid.Cells[4,0]:='Дата окончания гарантии';
Grid.Cells[5,0]:='Гарантия';
Grid.Cells[6,0]:='Адрес офиса';
Grid.Cells[7,0]:='Номер телефона';
Grid.Cells[8,0]:='Ответсвенный за технику';
Grid.Cells[9,0]:='Дополнительно';
end;

procedure TForm_Main.SizeCols(Grid :TStringGrid);
var
  Col: integer;
begin
 if Grid.RowCount<24 then
   begin
    Grid.ColWidths[0] := 0;
    Grid.ColWidths[1] := 100;
    Grid.ColWidths[2] := 170;
    Grid.ColWidths[3] := 170;
    Grid.ColWidths[4] := 180;
    Grid.ColWidths[5] := 130;
    Grid.ColWidths[6] := 170;
    Grid.ColWidths[7] := 130;
    Grid.ColWidths[8] := 180;
    Grid.ColWidths[9] := 500;
  end
 else
  begin
    Grid.ColWidths[0] := 0;
    Grid.ColWidths[1] := 100;
    Grid.ColWidths[2] := 170;
    Grid.ColWidths[3] := 170;
    Grid.ColWidths[4] := 180;
    Grid.ColWidths[5] := 130;
    Grid.ColWidths[6] := 170;
    Grid.ColWidths[7] := 130;
    Grid.ColWidths[8] := 180;
    Grid.ColWidths[9] := 480;
  end;
end;

procedure TForm_Main.GetRowData(out Data :OrgTechAPI.TData);
var  TableCol, TableRow :integer;
begin
TableCol:=0;
TableRow:=Data_table.Row;
   Data.UnicID:=Data_table.Cells[TableCol, TableRow];
   Data.Regnumber:=Data_table.Cells[TableCol+1,TableRow];
   Data.Name:=Data_table.Cells[TableCol+2,TableRow];
   Data.Category:=Data_table.Cells[TableCol+3,TableRow];
   Data.DateOfGuaranty:=Data_table.Cells[TableCol+4,TableRow];
   Data.Office:=Data_table.Cells[TableCol+6,TableRow];
   Data.TelNumber:=Data_table.Cells[TableCol+7,TableRow];
   Data.Tecnician:=Data_table.Cells[TableCol+8,TableRow];
   Data.More:=Data_table.Cells[TableCol+9,TableRow];
end;

procedure TForm_Main.FillTable(const List :OrgTechAPI.TList);
var
  curr :OrgTechAPI.PTListElement;
  cnt, i :integer;
begin
  SizeCols(Data_table);
  Data_table.RowCount:= 2;
  curr := List.head;
  cnt := 1;
  while curr <> nil do
  begin
      Data_table.Cells[0, cnt] := curr.data.UnicID;
      Data_table.Cells[1, cnt] := curr.data.Regnumber;
      Data_table.Cells[2, cnt] := curr.data.Name;
      Data_table.Cells[3, cnt] := curr.data.Category;
      Data_table.Cells[4, cnt] := curr.data.DateOfGuaranty;
      if (curr.data.DateOfGuaranty='нет') or (strtodate(curr.data.DateOfGuaranty)<=Now) then
      begin
       Data_table.Cells[5, cnt] :='Отсутствует';
      end
      else
      begin
        Data_table.Cells[5, cnt] :='Присутствует';
      end;
      Data_table.Cells[6, cnt] := curr.data.Office;
      Data_table.Cells[7, cnt] := curr.data.TelNumber;
      Data_table.Cells[8, cnt] := curr.data.Tecnician;
      Data_table.Cells[9, cnt] := curr.data.More;
      curr := curr^.next;
      cnt := cnt+1;
      Data_table.RowCount:= cnt;
  end;
Data_table.Selection := tGridRect(Rect(1,1,1,1));  //фокус на ячейку [1,1]
end;

procedure TForm_Main.Button_addClick(Sender: TObject);
var List :OrgTechAPI.TList; HelpData :OrgTechAPI.THelpData;
begin
Form_add.Position:=poMainFormCenter;
OrgTechAPI.LoadList(List);
OrgTechAPI.LoadHelpData(HelpData);
Form_add.HelpData:=HelpData;
Form_add.ShowModal;
Combo_sort.ItemIndex:=0;
OrgTechAPI.LoadList(List);
OrgTechAPI.CleanHelpData(HelpData);
FillTable(List);
end;

procedure TForm_Main.Button_alldevicesClick(Sender: TObject);
var List :OrgTechAPI.TList; HelpData :OrgTechAPI.THelpData; i:byte;
begin
Combo_sort.ItemIndex:=0;
OrgTechAPI.LoadList(List);
 if List.head=nil then
  begin
   for i := 0 to Data_table.ColCount-1 do
   Data_table.Cells[i,1]:='';
  end
 else FillTable(List);
end;

procedure TForm_Main.Button_chartsClick(Sender: TObject);
begin
Form_charts.Position:=poMainFormCenter;
Form_charts.ShowModal;
end;

procedure TForm_Main.Button_deleteClick(Sender: TObject);
var Data :OrgTechAPI.TData; List :OrgTechAPI.TList; i:byte;
begin
GetRowData(Data);
if Data.UnicID='' then
 begin
  ShowMessage('Нет данных для удаления!');
 end
else
 begin
  Form_delete.Data:=Data;
  Form_delete.Position:=poMainFormCenter;
  Form_delete.ShowModal;
  Combo_sort.ItemIndex:=0;
  OrgTechAPI.LoadList(List);
   if List.head=nil then
  begin
   for i := 0 to Data_table.ColCount-1 do
   Data_table.Cells[i,1]:='';
  end
  else FillTable(List);
 end;
end;

procedure TForm_Main.Button_editClick(Sender: TObject);
var HelpData :OrgTechAPI.THelpData; List :OrgTechAPI.TList; Data :OrgTechAPI.TData;
begin
GetRowData(Data);
if Data.UnicID='' then
 begin
  ShowMessage('Нет данных для редактирования!'); exit;
 end
else
 begin
  OrgTechAPI.LoadList(List);
  OrgTechAPI.LoadHelpData(HelpData);
  Form_edit.HelpData:=HelpData;
  Form_edit.Data:=Data;
  Form_edit.ShowModal;
  Combo_sort.ItemIndex:=0;
  OrgTechAPI.LoadList(List);
  OrgTechAPI.CleanHelpData(HelpData);
  FillTable(List);
 end;
end;

procedure TForm_Main.Button_searchClick(Sender: TObject);
var FoundData : OrgTechAPI.TDataArr;
i, cnt :integer;
begin
if Data_table.Cells[0,1]='' then
 begin
  ShowMessage('Нет данных для поиска!'); exit;
 end
else
 begin
  Form_search.Position:=poMainFormCenter;
  Form_search.ShowModal;
  if not((Form_search.Value='') or (Form_search.Field=-1)) then
  begin
  OrgTechAPI.FillDataArr(FoundData, Form_search.Field, Form_search.Value);
  if length(FoundData.DataArr)=0 then
   begin
    ShowMessage('По вашему запросу ничего не найдено.');
   end
   else
   begin
    with Data_table do
     for i:=0 to ColCount-1 do
      Cols[i].Clear;

    HeadStrGrid(Data_table);
    Data_table.RowCount:= 2;
    cnt:=1;
    for i := 0 to length(FoundData.DataArr)-1 do
     begin
      Data_table.Cells[0, cnt]:=FoundData.DataArr[i].UnicID;
      Data_table.Cells[1, cnt]:=FoundData.DataArr[i].Regnumber;
      Data_table.Cells[2, cnt]:=FoundData.DataArr[i].Name;
      Data_table.Cells[3, cnt]:=FoundData.DataArr[i].Category;
      Data_table.Cells[4, cnt]:=FoundData.DataArr[i].DateOfGuaranty;
      if (FoundData.DataArr[i].DateOfGuaranty='нет') or (strtodate(FoundData.DataArr[i].DateOfGuaranty)<=Now) then
      begin
       Data_table.Cells[5, cnt] :='Отсутствует';
      end
      else
      begin
        Data_table.Cells[5, cnt] :='Присутствует';
      end;
      Data_table.Cells[6, cnt]:=FoundData.DataArr[i].Office;
      Data_table.Cells[7, cnt]:=FoundData.DataArr[i].TelNumber;
      Data_table.Cells[8, cnt]:=FoundData.DataArr[i].Tecnician;
      Data_table.Cells[9, cnt]:=FoundData.DataArr[i].More;
      cnt := cnt+1;
      Data_table.RowCount:= cnt;
     end;
   end;
  end;
 end;
end;

procedure TForm_Main.Combo_sortChange(Sender: TObject);
var List :OrgTechAPI.TList; i, j, cnt :integer;
begin
if Data_table.Cells[0, 1]='' then
 begin
  Combo_sort.ItemIndex:=0;
 end
 else
 begin
  case Combo_sort.ItemIndex of
   0:    //нет
   begin
    OrgTechAPI.LoadList(List);
    if List.head=nil then
     begin
     for i := 0 to Data_table.ColCount-1 do
      Data_table.Cells[i,1]:='';
      end
    else FillTable(List);
   end;
   1:    //номер возрастание
   begin
    Cnt := Data_table.RowCount;
   for j := 1 to Cnt - 1 do
    for i := j+1 to Cnt do
    begin
      if Data_table.Cells[1, i] < Data_table.Cells[1, j] then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
   2:    //номер убываение
   begin
    Cnt := Data_table.RowCount;
   for j := 1 to Cnt - 1 do
    for i := j+1 to Cnt do
    begin
      if Data_table.Cells[1, i] > Data_table.Cells[1, j] then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
   3:    //наименование
   begin
     Cnt := Data_table.RowCount;
   for j := 1 to Cnt - 1 do
    for i := j+1 to Cnt do
    begin
      if AnsiLowerCase(Data_table.Cells[2, i]) < AnsiLowerCase(Data_table.Cells[2, j]) then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
   4:    //категория
   begin
     Cnt := Data_table.RowCount;
   for j := 1 to Cnt - 1 do
    for i := j+1 to Cnt do
    begin
      if AnsiLowerCase(Data_table.Cells[3, i]) < AnsiLowerCase(Data_table.Cells[3, j]) then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
   5:    //наличие гарантии
   begin
     Cnt := Data_table.RowCount;
   for j := 1 to Cnt - 1 do
    for i := j+1 to Cnt do
    begin
      if (Data_table.Cells[4,j]='нет') and (Data_table.Cells[4,i]<>'нет') then
       with Data_table do
      begin
       Rows[Cnt] := Rows[j];
        Rows[j] := Rows[i];
        Rows[i] := Rows[Cnt];
        continue;
      end;
      if (Data_table.Cells[4,i]='нет') and (Data_table.Cells[4,j]<>'нет') then
        continue;
      if (Data_table.Cells[4,i]='нет') and (Data_table.Cells[4,j]='нет') then
       continue;
      if strtodate(Data_table.Cells[4, i]) > strtodate(Data_table.Cells[4, j]) then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
   6:   //офис
   begin
     Cnt := Data_table.RowCount;
   for j := 1 to Cnt-1 do
    for i := j+1 to Cnt do
    begin
      if AnsiLowerCase(Data_table.Cells[6, i]) < AnsiLowerCase(Data_table.Cells[6, j]) then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
   7:   //ответственный
   begin
     Cnt := Data_table.RowCount;
   for j := 1 to Cnt - 1 do
    for i := j+1 to Cnt do
    begin
      if AnsiLowerCase(Data_table.Cells[8, i]) < AnsiLowerCase(Data_table.Cells[8, j]) then
      with Data_table do
      begin
        Rows[Cnt] := Rows[i];
        Rows[i] := Rows[j];
        Rows[j] := Rows[Cnt];
      end;
    end;
   end;
  end;
 end;
end;

procedure TForm_Main.Data_tableDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  Const Red=TColor($4855FF); Green=TColor($92D861);
begin
 if (ACol=5) and (Data_table.Cells[ACol, ARow]='Отсутствует') then
 begin
  Data_table.Canvas.Brush.color := Red;
  Data_table.Canvas.TextOut(Rect.left+((Rect.Right-Rect.Left) div 2)-(Data_table.Canvas.TextWidth(Data_table.Cells[acol,arow]) div 2),
   Rect.Top,Data_table.Cells[acol,arow]);
 end;
 if (ACol=5) and (Data_table.Cells[ACol, ARow]='Присутствует') then
 begin
  Data_table.Canvas.Brush.color := Green;
  Data_table.Canvas.TextOut(Rect.left+((Rect.Right-Rect.Left) div 2)-(Data_table.Canvas.TextWidth(Data_table.Cells[acol,arow]) div 2),
   Rect.Top,Data_table.Cells[acol,arow]);
 end;

end;

procedure TForm_Main.FormCreate(Sender: TObject);
var List :OrgTechAPI.TList; HelpData :OrgTechAPI.THelpData;
begin
 Combo_sort.ItemIndex:=0;
 HeadStrGrid(Data_table);
 OrgTechAPI.LoadList(List);
 FillTable(List);
end;

end.
