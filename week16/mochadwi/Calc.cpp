#include<iostream>
#include<string>

using namespace std;

int maks = 10000;
char opr = ['^']+['*']+['/']+['+']+['-']; // operator

struct TStack {

}
    PData=^TData;
    TData=record
      info:string;
      next:PData;
    end;
var
   top:PData;
   topPostfix:PPostfix;
   infix, Postfix, Hasil:string;
   data:string;
   pilih:char;
   j: integer;

procedure inisialisasi_stack(var top:PData; var topPostfix:PPostfix);
begin
     top:=nil;
     topPostfix:=nil;
end;
function kosong(top:PData):boolean;
begin
     kosong:= top = nil;
end;
function Pkosong(topPostfix:PPostfix):boolean;
begin
     Pkosong:= topPostfix = nil;
end;
function satu_simpul(top:PData):boolean;
begin
     satu_simpul:= top^.next = nil;
end;
function Psatu_simpul(topPostfix:PPostfix):boolean;
begin
     Psatu_simpul:= top^.next = nil;
end;

procedure push(databaru:string;var top:PData);
var
   baru:PData;
begin
     new(baru);
     baru^.info:=databaru;
     baru^.next:=nil;
     if kosong(top) then
        top:=baru
     else
     begin
          baru^.next:=top;
          top:=baru;
     end;
end;

procedure pushPostfix(databaru:string;var topPostfix:PPostfix);
var
   baru:PPostfix;
begin
     new(baru);
     baru^.Pinfo:=databaru;
     baru^.Pnext:=nil;
     if Pkosong(topPostfix) then
        topPostfix:=baru
     else
     begin
          baru^.Pnext:=topPostfix;
          topPostfix:=baru;
     end;
end;

procedure pop(var top:PData;var elemen:string);
var
   bantu:PData;
begin
     if not kosong(top) then
     begin
          elemen:=top^.info;
          bantu:=top;
          top:=top^.next;
          dispose(bantu);
     end
     else
         writeln('Stack Kosong');
end;

procedure Ppop(var topPostfix: PPostfix; var elemen:string);
var
   bantu:PPostfix;
begin
     if not Pkosong(topPostfix) then
     begin
        elemen:=topPostfix^.Pinfo;
        bantu:=topPostfix;
        topPostfix:=topPostfix^.Pnext;
        dispose(bantu);
     end
     else
         writeln('Stack kosong, POP Failed');
end;

function isOperator(c: string): boolean;
{I.S.: Check for str value wheter its opr or not}
{F.S.: Return true if opr}
var
  i: integer;
begin
  isOperator := false;
  for i := 0 to length(c) do
  begin
    if (c[i] in opr) then
    begin
      isOperator := true;
      break;
    end;
  end;
end;

function isOperator(c: char): boolean;
{I.S.: Check for c value wheter its opr or not}
{F.S.: Return true if opr}
var
  i: integer;
begin
  isOperator := false;
  if (c in opr) then
  begin
    isOperator := true;
  end;
end;

procedure masukan(infix : string; var top:PData);
var
   i, j, PToken : integer;
   weight       : array[1..maks] of integer;
   Token        : string;
begin
  PToken      := 0;
  j           := 0;
  infix       := infix + ')';
  push('(', top);

  clrscr;
  for i := 1 to LENGTH(infix) do
  begin
    if (COPY(infix,i,1) = ')') or (COPY(infix,i,1) = '^') or ((COPY(infix,i,1) = '*') or (COPY(infix,i,1) = '/')) or ((COPY(infix,i,1) = '-')  or (COPY(infix,i,1) = '+')) then
    begin

      //OPERAND
      Token := COPY(infix,i-PToken,PToken);
      // write('token (oprn): ', Token); readln();

      if (COPY(infix,i-PToken,1) = '(') then
      begin
        Token := COPY(infix,i-PToken,1);
        // write('token: ', Token); readln();
        push(Token, top);
        Token := COPY(infix,(i+1)-PToken,PToken-1);
        // write('token: ', Token); readln();
      end;
      if Token <> '' then pushPostfix(Token,topPostfix);

      PToken := -1;

      //TANDA ( )
      Token := COPY(infix,i,1);
      // write('token: ', Token); readln();

      if Token = ')' then
      begin
          while top^.info <> '(' do
          begin
            pop(top,data);
            pushPostfix(data,topPostfix);
          end;
          pop(top,data);
      end
      else //OPERATOR
      begin
          // write('token (opr): ', Token); readln();
          inc(j);
          case (Token) of
            '^'     : weight[j] := 4;
            '*', '/': weight[j] := 3;
            '+', '-': weight[j] := 2;
          end;

          // if Token <= top^.info then // check for ASCII table instead?
          while (weight[j-1] >= weight[j]) do
          begin
            // while top^.info <> '(' do
            // begin
            weight[j-1] := weight[j];
            dec(j);
            pop(top,data);
            pushPostfix(data,topPostfix);
            // end;
            // push(Token,top);
          end;
          // else
          push(Token, top);
      end;
    end;

    PToken := PToken + 1;

  end; // endfor
end;

function pangkat(var1:real;var2:real):real;
begin
   if var1 = 0 then
     pangkat := 1
   else
     Pangkat := var2*pangkat(var1-1,var2);
end;

procedure hitung(Postfix:string; top:PData; var value : string);
var
   PToken, N_Postfix, i, j, kode1, kode2 : integer;
   var1, var2, hitung: real;
   Token, opr1, Shitung : string;
begin
   PToken  := 0;
   Postfix := Postfix + ')';
   for i := 1 to LENGTH(Postfix) do
   begin
      if (COPY(Postfix,i,1)= ' ') then
      begin

         if(isOperator(COPY(Postfix,i-1,1))) then
         begin
            opr1 := COPY(Postfix,i-1,1);
            write('operator: ', opr1); readln;

            pop(top,data);
            var1 := StrToFloat(data); readln();
            pop(top,data);
            var2 := StrToFloat(data); readln();
            write('var1: ', var1, '; var2: ', var2); readln();

            if opr1 = '+'  then
              hitung := var2 + var1
            else if opr1 = '-' then
              hitung := var2 - var1
            else if opr1 = '*' then
              hitung := var2 * var1
            else if opr1 = '/' then
              hitung := var2 / var1
            else
              hitung := pangkat(var1,var2);


            Shitung := FloatToStr(hitung);
            write('Hitung: ', Shitung); readln();

            push(Shitung, top);
         end
         else
         begin
            Token := COPY(Postfix, i-PToken, PToken);
            write('Postfix: ', Postfix); readln();
            write('i(', i, ')-PToken(', PToken, '): ', i-PToken); readln();
            write('token(', PToken, '): ', Token); readln();
            if (isOperator(Token)) then
            begin
              dec(PToken);
            end;
            Token := COPY(Postfix, i-PToken, PToken);
            write('Postfix: ', Postfix); readln();
            write('i(', i, ')-PToken(', PToken, '): ', i-PToken); readln();
            write('token(', PToken, '): ', Token); readln();
            push(Token,top);
            PToken := -1;
         end;
      end
      else if (COPY(Postfix,i,1)= ')' ) then
         begin
            if not kosong(top) then
            begin
              pop(top,data);
              value := data;
            end
            else
              value := '0';
      end;
      PToken := PToken + 1;
   end
end;

begin

     Postfix := '';
     inisialisasi_stack(top,topPostfix);

     gotoxy(1,1);write('Rumus Infix    : ');
     gotoxy(18,1);readln(infix);

     masukan(infix,top);
     j := 0;
     gotoxy(1,4);write('PostFix        : ');
     while not Pkosong(topPostfix) do
     begin
          Ppop(topPostfix,data);
          Postfix  := data + ' ' + Postfix  ;
     end;
     writeln('');
     gotoxy(18,4);writeln(Postfix);
     
     hitung(Postfix,top,Hasil);

     gotoxy(1,5);writeln('Hasil          : ',Hasil);
     {gotoxy(1,7);write('Hitung Kembali (Y) ? ');
     gotoxy(22,7);read(pilih);
     }

     gotoxy(1,8);writeln('bye');
     readkey;

end.
