unit OrgTechAPI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.DateUtils;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type

  THelpData = record
    Regnumber: array of string[10];
    Name: array of string[20];
    Category: array of string[20];
    DateOfGuaranty: array of string[10];
    Office: array of string[20];
    TelNumber: array of string[15];
    Tecnician: array of string[20];
  end;

  TData = record // данные ячейки списка
    UnicID: string[38];
    Regnumber: string[10];
    Name: string[20];
    Category: string[20];
    DateOfGuaranty: string[10];
    Office: string[20];
    TelNumber: string[15];
    Tecnician: string[20];
    More: string[55];
  end;

  PTListElement = ^TListElement; // указатель на элемент списка

  TListElement = record // элемент списка
    data: TData;
    next: PTListElement;
    prev: PTListElement;
  end;

  TList = record // список
    head: PTListElement;
    tail: PTListElement;
    amount: integer;
  end;

  TDataArr = record
    DataArr: array of TData;
  end;

  TChartsArr = record
   CategoryArr :array of string[20];
   ColArr :array of integer;
  end;

var
  Form1: TForm1;
procedure CreateNewEl(data: TData);
procedure LoadList(var List: TList);
procedure AddToEnd(var List: TList; var NewElementPointer: PTListElement);
procedure SaveList(const List: TList);
procedure LoadHelpData(var HelpData: THelpData);
procedure CleanHelpData(var HelpData: THelpData);
function GenerateUUID: string;
procedure ReplaceElData(data: TData);
procedure DeleteEl(data: TData);
procedure FillDataArr(var FoundData: TDataArr; const Field: integer; const Value: string);
procedure GetDataForCharts(var Arr :TChartsArr; var GarYes: integer; var GarNo :integer);

implementation

{$R *.dfm}

procedure CreateNewEl(data: TData);
var
  List: TList;
  curr: PTListElement;
begin
  LoadList(List);
  New(curr);
  data.UnicID := GenerateUUID;
  curr.data := data;
  AddToEnd(List, curr);
  SaveList(List);
end;

procedure LoadList(var List: TList);
var
  f: file of TData;
  tmp, curr: PTListElement;
  cnt: integer;
begin
  cnt := 0;
  List.head := nil;
  List.tail := nil;
  AssignFile(f, 'Materials.txt');
  Reset(f);
  New(curr);
  if FileSize(f) <> 0 then
  begin
    Read(f, curr^.data);
    AddToEnd(List, curr);
    while not EOF(f) do
    begin
      tmp := curr;
      New(curr);
      Read(f, curr.data);
      AddToEnd(List, curr);
      tmp.next := curr;
      curr.prev := tmp;
      cnt := cnt + 1;
    end;
  end;
  List.amount := cnt + 1;
end;

procedure AddToEnd(var List: TList; var NewElementPointer: PTListElement);
begin
  inc(List.amount);
  if List.head = nil then
  begin
    List.head := NewElementPointer;
    List.tail := NewElementPointer;
    NewElementPointer.next := nil;
    NewElementPointer.prev := nil;
    exit;
  end;
  NewElementPointer.next := nil;
  NewElementPointer.prev := List.tail;
  List.tail.next := NewElementPointer;
  List.tail := NewElementPointer;
end;

procedure SaveList(const List: TList);
var
  f: file of TData;
  curr: PTListElement;
begin
  AssignFile(f, 'Materials.txt');
  Rewrite(f);
  curr := List.head;
  while curr <> nil do
  begin
    Write(f, curr^.data);
    curr := curr^.next;
  end;
end;

procedure LoadHelpData(var HelpData: THelpData);
var
  f: file of TData;
  tmp: PTListElement;
  cnt, i: integer;
  flag: boolean;
  curr: PTListElement;
begin
  cnt := 0;
  AssignFile(f, 'Materials.txt');
  Reset(f);
  New(curr);
  if FileSize(f) <> 0 then
  begin
    Read(f, curr^.data);
    Setlength(HelpData.Regnumber, length(HelpData.Regnumber) + 1);
    HelpData.Regnumber[high(HelpData.Regnumber)] := curr.data.Regnumber;
    Setlength(HelpData.Name, length(HelpData.Name) + 1);
    HelpData.Name[high(HelpData.Name)] := curr.data.Name;
    Setlength(HelpData.Category, length(HelpData.Category) + 1);
    HelpData.Category[high(HelpData.Category)] := curr.data.Category;
    Setlength(HelpData.DateOfGuaranty, length(HelpData.DateOfGuaranty) + 1);
    HelpData.DateOfGuaranty[high(HelpData.DateOfGuaranty)] := curr.data.DateOfGuaranty;
    Setlength(HelpData.Office, length(HelpData.Office) + 1);
    HelpData.Office[high(HelpData.Office)] := curr.data.Office;
    Setlength(HelpData.TelNumber, length(HelpData.TelNumber) + 1);
    HelpData.TelNumber[high(HelpData.TelNumber)] := curr.data.TelNumber;
    Setlength(HelpData.Tecnician, length(HelpData.Tecnician) + 1);
    HelpData.Tecnician[high(HelpData.Tecnician)] := curr.data.Tecnician;
    while not EOF(f) do
    begin
      tmp := curr;
      New(curr);
      Read(f, curr.data);
      flag := true;

      Setlength(HelpData.Regnumber, length(HelpData.Regnumber) + 1);
      HelpData.Regnumber[high(HelpData.Regnumber)] := curr.data.Regnumber;

      for i := 0 to length(HelpData.Name) - 1 do
      begin
        if HelpData.Name[i] = curr.data.Name then
        begin
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
        Setlength(HelpData.Name, length(HelpData.Name) + 1);
        HelpData.Name[high(HelpData.Name)] := curr.data.Name;
      end
      else
        flag := true;

      for i := 0 to length(HelpData.Category) - 1 do
      begin
        if HelpData.Category[i] = curr.data.Category then
        begin
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
        Setlength(HelpData.Category, length(HelpData.Category) + 1);
        HelpData.Category[high(HelpData.Category)] := curr.data.Category;
      end
      else
        flag := true;

      for i := 0 to length(HelpData.DateOfGuaranty) - 1 do
      begin
        if HelpData.DateOfGuaranty[i] = curr.data.DateOfGuaranty then
        begin
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
        Setlength(HelpData.DateOfGuaranty, length(HelpData.DateOfGuaranty) + 1);
        HelpData.DateOfGuaranty[high(HelpData.DateOfGuaranty)] :=
          curr.data.DateOfGuaranty;
      end
      else
        flag := true;

      for i := 0 to length(HelpData.Office) - 1 do
      begin
        if HelpData.Office[i] = curr.data.Office then
        begin
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
        Setlength(HelpData.Office, length(HelpData.Office) + 1);
        HelpData.Office[high(HelpData.Office)] := curr.data.Office;
      end
      else
        flag := true;

      for i := 0 to length(HelpData.TelNumber) - 1 do
      begin
        if HelpData.TelNumber[i] = curr.data.TelNumber then
        begin
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
        Setlength(HelpData.TelNumber, length(HelpData.TelNumber) + 1);
        HelpData.TelNumber[high(HelpData.TelNumber)] := curr.data.TelNumber;
      end
      else
        flag := true;

      for i := 0 to length(HelpData.Tecnician) - 1 do
      begin
        if HelpData.Tecnician[i] = curr.data.Tecnician then
        begin
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
        Setlength(HelpData.Tecnician, length(HelpData.Tecnician) + 1);
        HelpData.Tecnician[high(HelpData.Tecnician)] := curr.data.Tecnician;
      end
      else
        flag := true;

      tmp.next := curr;
      curr.prev := tmp;
    end;
  end;
end;

procedure CleanHelpData(var HelpData: THelpData);
begin
  Setlength(HelpData.Regnumber, 0);
  Setlength(HelpData.Name, 0);
  Setlength(HelpData.Category, 0);
  Setlength(HelpData.DateOfGuaranty, 0);
  Setlength(HelpData.Office, 0);
  Setlength(HelpData.TelNumber, 0);
  Setlength(HelpData.Tecnician, 0);
end;

function GenerateUUID: string;
var
  Uid: TGuid;
  Res: HResult;
begin
  Res := CreateGuid(Uid);
  if Res = S_OK then
  begin
    Result := Guidtostring(Uid);
  end;
end;

procedure ReplaceElData(data: TData);
Var
  List: TList;
  curr: PTListElement;
begin
  LoadList(List);
  New(curr);
  curr := List.head;
  while curr <> nil do
  begin
    if curr.data.UnicID = data.UnicID then
    begin
      curr.data := data;
      SaveList(List);
      exit;
    end;
    curr := curr.next;
  end;
end;

procedure DeleteEl(data: TData);
var
  List: TList;
  curr: PTListElement;
begin
  LoadList(List);
  New(curr);
  curr := List.head;
  while curr <> nil do
  begin
    if curr.data.UnicID = data.UnicID then
    begin
      if (curr = List.head) and (curr.next = nil) then
      // удаление единственной записи
      begin
        Dispose(curr);
        List.head := nil;
      end
      else
      begin
        if curr = List.head then // удаление первой записи
        begin
          List.head := curr.next;
          curr.next.prev := nil;
          curr.next := nil;
          Dispose(curr);
        end
        else
        begin
          if curr.next = nil then // удаление последней записи
          begin
            curr.prev.next := nil;
            curr.prev := nil;
            Dispose(curr);
          end
          else
          begin // удаление любой другой записи
            curr.prev^.next := curr.next;
            curr.next^.prev := curr.prev;
            curr.prev := nil;
            curr.next := nil;
            Dispose(curr);
          end;
        end;
      end;
    end;
    curr := curr.next;
  end;
  SaveList(List);
end;

procedure FillDataArr(var FoundData: TDataArr; const Field: integer; const Value: string);
var
  List: TList;
  curr: PTListElement;
  i: integer;
begin
  LoadList(List);

  curr := List.head;
  i := 0; // заполнение массива учитывая запрос пользователя
  while curr <> nil do
  begin
    case Field of
      0:
        begin
          if Value = curr.data.Regnumber then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
      1:
        begin
          if Value = curr.data.Name then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
      2:
        begin
          if Value = curr.data.Category then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
      3:
        begin
          if Value = curr.data.DateOfGuaranty then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
      4:
        begin
          if Value = curr.data.Office then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
      5:
        begin
          if Value = curr.data.TelNumber then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
      6:
        begin
          if Value = curr.data.Tecnician then
          begin
            Setlength(FoundData.DataArr, i + 1);
            FoundData.DataArr[high(FoundData.DataArr)].UnicID :=
              curr.data.UnicID;
            FoundData.DataArr[high(FoundData.DataArr)].Regnumber :=
              curr.data.Regnumber;
            FoundData.DataArr[high(FoundData.DataArr)].Name := curr.data.Name;
            FoundData.DataArr[high(FoundData.DataArr)].Category :=
              curr.data.Category;
            FoundData.DataArr[high(FoundData.DataArr)].DateOfGuaranty :=
              curr.data.DateOfGuaranty;
            FoundData.DataArr[high(FoundData.DataArr)].Office :=
              curr.data.Office;
            FoundData.DataArr[high(FoundData.DataArr)].TelNumber :=
              curr.data.TelNumber;
            FoundData.DataArr[high(FoundData.DataArr)].Tecnician :=
              curr.data.Tecnician;
            FoundData.DataArr[high(FoundData.DataArr)].More := curr.data.More;
            i := i + 1;
          end;
          curr := curr.next;
        end;
    end;
  end;
end;

procedure GetDataForCharts(var Arr :TChartsArr; var GarYes: integer; var GarNo :integer);
var List :TList;
  cnt, i: integer;
  flag: boolean;
  curr: PTListElement;
begin
 LoadList(List);
 curr:=List.head;
 GarNo:=0; GarYes:=0; flag:=true;
  SetLength(Arr.CategoryArr,length(Arr.CategoryArr)+1);
  Arr.CategoryArr[high(Arr.CategoryArr)]:=curr.data.Category;
  SetLength(Arr.ColArr,length(Arr.ColArr)+1);
 while curr<>nil do
  begin
   for i := 0 to length(Arr.CategoryArr) - 1 do
      begin
        if Arr.CategoryArr[i] = curr.data.Category then
        begin
          Arr.ColArr[i]:=Arr.ColArr[i]+1;
          flag := false;
          break;
        end;
      end;
      if flag then
      begin
       SetLength(Arr.CategoryArr,length(Arr.CategoryArr)+1);
       Arr.CategoryArr[high(Arr.CategoryArr)]:=curr.data.Category;
       SetLength(Arr.ColArr,length(Arr.ColArr)+1);
       Arr.ColArr[high(Arr.ColArr)]:=1;
      end
      else
        flag := true;

       if curr.data.DateOfGuaranty='нет' then
        Inc(GarNo)
       else
        if strtodate(curr.data.DateOfGuaranty)<Now then
         Inc(GarNo)
        else
         inc(GarYes);

  curr:=curr.next;
  end;
end;

end.
