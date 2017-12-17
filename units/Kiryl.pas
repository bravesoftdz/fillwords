unit Kiryl;

interface
uses
    typesandconst,SysUtils;
procedure  fillArray(var dictionary:TDictionary);
function doItFilledOkay(var Arr:TPlayingField; fieldsize,x,y:integer):boolean;
implementation
procedure fillArray(var dictionary:TDictionary);
Const link = ('includes/library.txt');
var i,j,lenghtStr, leftbehind, N:Integer;
    inpStr:string;
    f:textfile;
begin
  for i:=1 to maxSize do
  begin
    dictionary[1,i]:=IntToStr(0);
  end;
N:=0;
leftbehind:=84;
  assign(f,link);
  reset(f);
  while not eof(f) do
  begin
    readln(f,inpStr);

    lenghtStr:=length(inpStr);
    N:=StrToInt(dictionary[1,lenghtStr])+2;
    dictionary[N,lenghtStr]:=inpStr;
    dictionary[1,lenghtStr]:=IntToStr(N);


  dec(leftbehind);
  end;
end;

function doItFilledOkay(var Arr:TPlayingField; fieldsize,x,y:integer):boolean;
var i,j:Integer;
    kek:Boolean;
label
    GotoLabel;
begin
kek:=True;
for i:=1 to fieldsize do
  for j:=1 to fieldsize do
    if Arr[i,j] = ' ' then
      begin
      if (i<=fieldsize-2) and (i>=3) and (j>=3) and (j<=fieldsize-2) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=1) and  (j=1) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=1) and  (j=fieldsize) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=1) and  (j=fieldsize-1) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=1) and  (j>2) and (j<fieldsize-1) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=1) and  (j=2) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=fieldsize) and  (j=1) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=fieldsize-1) and  (j=1) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i>2) and (i<fieldsize-1) and  (j=1) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=2) and  (j=1) then
        if ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=fieldsize) and  (j=fieldsize) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=fieldsize-1) and (j=fieldsize-1) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=fieldsize) and  (j=fieldsize-1) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=fieldsize-1) and  (j=fieldsize) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i=fieldsize-1) and  (j=2) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=fieldsize) and  (j=2) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=fieldsize) and  (j>2) and (i<fieldsize-1) then
        if ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j+1] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j-2] = ' '))
        then else kek:=false;

      if (i=2) and (j=2) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=fieldsize-1) and (j>=3) and (j<=fieldsize-2) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i<=fieldsize-2) and (i>=3) and (j=fieldsize-1) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j-2] = ' ') and (Arr[i,j-1] = ' '))
        then else kek:=false;

      if (i<=fieldsize-2) and (i>=3) and (j=2) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i+2,j] = ' ') and (Arr[i+1,j] = ' ')) or ((Arr[i-2,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i,j+2] = ' ') and (Arr[i,j+1] = ' '))
        then else kek:=false;

      if (i=2) and (j>2) and (j<fieldsize-1) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i+2,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j+2] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j-2] = ' '))
        then else kek:=false;

      if (i=2) and (j=fieldsize-1) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i+2,j] = ' ')) or ((Arr[i,j+1] = ' ') and (Arr[i,j-1] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j-2] = ' '))
        then else kek:=false;

      if (i=2) and (j=fieldsize) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i+2,j] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j-2] = ' '))
        then else kek:=false;

      if (i>2) and (i<fieldsize-1) and (j=fieldsize) then
        if ((Arr[i+1,j] = ' ') and (Arr[i-1,j] = ' ')) or ((Arr[i+1,j] = ' ') and (Arr[i+2,j] = ' ')) or ((Arr[i-1,j] = ' ') and (Arr[i-2,j] = ' ')) or ((Arr[i,j-1] = ' ') and (Arr[i,j-2] = ' '))
        then else kek:=false;



      if kek = false then goto GotoLabel;
      end;

GotoLabel:
if kek=false then
  begin
  x:=i;
  y:=j;
  end;
doItFilledOkay:=kek;
end;





end.
