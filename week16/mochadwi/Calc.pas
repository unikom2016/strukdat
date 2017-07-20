program Calc;
uses crt,sysutils;
type
    PData=^TData;
    TData=record
                info:string;
                next:PData;
           end;

    PPostfix  = ^TPostfix;
    TPostfix  = record
                  Pinfo:string;
                  Pnext:PPostfix;
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

procedure Ppop(var topPostfix:PPostfix;var elemen:string);
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


procedure masukan(infix : string; var top:PData);
var
   i, PToken :integer;
   Token : string;

begin
   PToken      := 0;
   infix   := infix + ')';
   push('(',top);
   for i := 1 to LENGTH(infix) do
   begin
      if(COPY(infix,i,1) = ')') or (COPY(infix,i,1) = '^') or ((COPY(infix,i,1) = '*') or (COPY(infix,i,1) = '/')) or ((COPY(infix,i,1) = '-')  or (COPY(infix,i,1) = '+')) then
      begin
      //OPERAND
          Token := COPY(infix,i-PToken,PToken);
          if(COPY(infix,i-PToken,1) = '(') then
          begin
            Token := COPY(infix,i-PToken,1);
            push(Token,top);
            Token := COPY(infix,(i+1)-PToken,PToken-1);
          end;
          if Token <> '' then
          pushPostfix(Token,topPostfix);

          PToken := -1;
 

      //TANDA ( )
        Token :=COPY(infix,i,1);

        if Token = ')' then
        begin
           while top^.info <> '(' do
           begin
              pop(top,data);
              pushPostfix(data,topPostfix);
           end;
           pop(top,data);
        end

        //OPERATOR
        else
        begin
           if Token <= top^.info then
           begin
             while top^.info <> '(' do
             begin
              pop(top,data);
              pushPostfix(data,topPostfix);
             end;
             push(Token,top);
           end
           else
             push(Token,top);
        end;
       end;


       PToken := PToken + 1;

   end;
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
   PToken, N_Postfix, i, kode1, kode2 : integer;
   var1, var2, hitung: real;
   Token, opr1, Shitung : string;
begin
   PToken  := 0;
   Postfix := Postfix + ')';
   for i := 1 to LENGTH(Postfix) do
   begin
      if (COPY(Postfix,i,1)= ' ') then
      begin

         if(COPY(Postfix,i-1,1) = '^') or (COPY(Postfix,i-1,1) = '*') or(COPY(Postfix,i-1,1) = '/') or (COPY(Postfix,i-1,1) = '+') or (COPY(Postfix,i-1,1) = '-') then
         begin
            opr1 := COPY(Postfix,i-1,1);

            pop(top,data);
            var1 := StrToFloat(data);
            pop(top,data);
            var2 := StrToFloat(data);

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
            push(Shitung,top);
         end

         else
         begin
             Token := COPY(Postfix,i-PToken,PToken);
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
