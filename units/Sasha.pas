unit Sasha;

interface
  uses Kiryl,SysUtils,typesandconst, Nikita;
var
   f: text;
   k:string;
   name,level:string;
   query:string;
   substr:string;
   isVseNorm: Boolean;
const link = 'includes\config.txt';
const letters = ['A'..'Z', 'a'..'z'];
procedure fieldStatusQuo(var field:TPlayingField; fieldsize:Integer);
procedure getConfig(var name:string;var level:integer);
procedure game(const lvl:integer; Words:TDictionary;var field: TPlayingField);
procedure writeMatrix(var Field:TPlayingField; size:integer);
procedure gameEnterWords(var field:TPLayingField; fieldsize:integer; var size: integer);
procedure deleteWord(var field:TPlayingField;const ib,ie,jb,je:integer; var cellnum: integer);
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
    delete(k,Pos('"', k),1);
    level:=StrToInt(k);
    Close(f);
  end;
end;

procedure writeMatrix(var Field:TPlayingField; size:integer);
var i,j:byte;
begin
  for i:=1 to size do
  begin
    for j:=1 to size do
    begin
       write(field[i,j]:2);
    end;
    writeln;
  end;
end;

procedure deleteWord(var field:TPlayingField;const ib,ie,jb,je:integer; var cellnum: integer);
var currlength, min, max: integer;
    i,j:integer;
begin
  if(ib <> ie) then
    currlength:= abs(ie-ib)+1
  else
    currlength:= abs(je-jb)+1;
  if(ib <> ie) then
  begin
    if (ib > ie) then
    begin
      min:=ie;
      max:=ib;
    end
    else
    begin
      min:=ib;
      max:=ie;
    end;
      j:=1;
      i:=min;
      //for i:=min to max do
    while (i <= max) do
    begin
      field[i, jb]:=' ';
      Inc(j);
      inc(i);
    end;

  end
  else
  begin
    if (jb > je) then
    begin
      min:=je;
      max:=jb;
    end
    else
    begin
      min:=jb;
      max:=je;
    end;
      i:=1;
      j:=min;
    //for i:=min to max do
    while (i <= max) do
    begin
      field[ib, i]:=' ';
      Inc(j);
      inc(i);
    end;

  end;
  Dec(cellnum,currlength);
end;

procedure gameEnterWords(var field:TPLayingField; fieldsize:integer; var size: integer);
var
  word:string;
  i:integer;
  del:Boolean;
  CoordString:string;
  ie,ib,je,jb:byte;
  currpos:byte;
  cellnum:integer;
begin
  cellnum:=fieldsize*fieldsize;
  repeat
    writeln(#10#13,'Write word:',#10#13);
    readln(word);
    del:=false;
    for i:=1 to size do
    begin
      if ( AnsiLowerCase(field[1,i]) = AnsiLowerCase(word) ) then
      begin
        CoordString:=field[2,i];
        ib:=StrToInt(Copy(CoordString,1,Pos(':',CoordString)-1));
        Delete(CoordString,1,Pos(':',CoordString));
        ie:=StrToInt(Copy(CoordString,1,Pos(':',CoordString)-1));
        Delete(CoordString,1,Pos(':',CoordString));
        jb:=StrToInt(Copy(CoordString,1,Pos(':',CoordString)-1));
        Delete(CoordString,1,Pos(':',CoordString));
        je:=StrToInt(CoordString);
        deleteWord(field,ib,ie,jb,je, cellnum);
        del:=True;
        Break;
      end;
    end;
    if (not del) then
      Writeln('Word not found :c');
  until cellnum <= 0;
end;

procedure fieldStatusQuo(var field:TPlayingField; fieldsize:Integer);
var i,j:integer;
begin
  for i:=1 to fieldsize do
  begin
    for j:=1 to fieldsize do
    begin
      field[i,j]:=' ';
    end;
  end;
end;

procedure game(const lvl:integer; Words:TDictionary;var field: TPlayingField);
var fieldsize,cellsnum:integer;
var ib,jb,ie,je, badi, badj, currlength, numofwords, i,j, min,max: integer;
WordsList:TWordsList;
wordslistSize:integer;
backup: TPlayingField;
rand:byte;
backnumber:integer;
str:string;
counter:integer;
begin
  wordslistsize:=0;
  fieldsize:= 5+lvl div 5;
  writeln(fieldsize);
  fieldStatusQuo(field, fieldsize);
  cellsnum:=fieldsize*fieldsize;
  counter:=0;
  repeat
    isVseNorm:= doItFilledOkay(field, fieldsize, badi, badj);
    if ( not isVseNorm ) then
    begin
      field:=backup;
      inc(cellsnum,length(WordsList[1,wordslistSize]));
      WordsList[1,wordslistSize]:='';
      WordsList[2,wordslistSize]:='';
      dec(wordslistSize);
      Inc(counter);
      //writeln(counter);
      if(counter > 20) then
      begin
        fieldStatusQuo(field, fieldsize);
        cellsnum:=fieldsize*fieldsize;
        counter:=0;
      end;
    end;

    PullCoordinates(FieldSize, Words,field, ib,jb,ie,je);

    if ( isVseNorm ) then
    begin
      backup:=field;
      if(ib <> ie) then
        currlength:= abs(ie-ib)+1
      else
        currlength:= abs(je-jb)+1;
      numofwords:= StrToInt(Words[1,currlength]);
      rand:=Random(Numofwords-1)+2;
      str:=words[rand,currlength];

      if(ib <> ie) then
      begin
        if (ib > ie) then
        begin
          min:=ie;
          max:=ib;
        end
        else
        begin
          min:=ib;
          max:=ie;
        end;
        j:=1;
        i:=min;
        //for i:=min to max do
        while (i <= max) do
        begin
          field[i, jb]:=str[j];
          Inc(j);
          inc(i);
        end;

        
      end
      else
      begin
        if (jb > je) then
        begin
          min:=je;
          max:=jb;
        end
        else
        begin
          min:=jb;
          max:=je;
        end;
        j:=1;
        i:=min;
        //for i:=min to max do
        while (i <= max) do
        begin
          field[ib, i]:=str[j];
          Inc(j);
          inc(i);
        end;

      end;
      dec(cellsnum, currlength);
      writeMatrix(field, fieldsize);
      //Writeln('Enter to continue ', Cellsnum);
      WordsList[1,WordsListsize+1]:=Str;
      WordsList[2,WordsListSize+1]:=IntToStr(ib)+':'+IntToStr(ie)+':'+IntToStr(jb)+':'+IntToStr(je);
      inc(WordsListSize);
    end;
  until(cellsnum <= 0);



  gameEnterWords(field, fieldsize, WordsListSize);
  writeln('Game over');
end;

end.








