unit Sasha;

interface
  uses SysUtils, typesandconst;
var
   f: text;
   k:string;
   name,level:string;
   query:string;
   substr:string;
const link = 'includes\config.txt';
const letters = ['A'..'Z', 'a'..'z'];
procedure getConfig(var name:string;var level:integer);
procedure game(const lvl:integer; Words:TDictionary;var field: TPlayingField);

implementation
procedure getConfig(var name:string;var level:integer);
begin
  assign(f,link);
  Reset(f);
  read(f,k);
  Close(f);
  if (Copy(k,1,4) <> 'name') then
  begin
    Rewrite(f);
    Writeln('Enter your name');
    Readln(name);
    query:='name="' + name + '" level="1"';
    write(f,query);
    Close(f);
  end
  else
  begin
    Reset(f);
    read(f,k);
    Delete(k,1,6);
    name:=Copy(k,1,Pos('"', k)-1);
    Delete(k,1,Pos('"', k)+8);
    level:=StrToInt(Copy(k,1,Pos('"', k)-1));
    Close(f);
  end;
end;

procedure game(const lvl:integer; Words:TDictionary;var field: TPlayingField);
var fieldsize,cellsnum:integer;
i,j:byte;
var ib,jb,ie,je, badi, badj: integer;
backup: TPlayingField;
begin
  fieldsize:= 5+lvl div 5;
  writeln(fieldsize);
  for i:=1 to fieldsize do
  begin
    for j:=1 to fieldsize do
    begin
      field[i,j]:=' ';
    end;
  end;
  cellsnum:=fieldsize;

  repeat
    backup:=field;
    PullCoordinates(FieldSize, Words,field, ib,jb,ie,je:Integer);
    if ( not doItFilledOkay(field, fieldsize, badi, badj) ) then
    begin
      if (( field[i+1,j] = ' ') and ( field[i+2,j] <> ' ')) then
        
    end;

  until(cellsnum <= 0);
end;

end.







