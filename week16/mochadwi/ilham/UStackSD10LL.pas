program Stack_Linked_List_SD_10;
type
    PData=^TData;
    TData=record
                info:integer;
                next:PData;
          end;
procedure inisialisasi_stack(var top:PData);
begin
     top:=nil;
end;
function kosong(top:PData):boolean;
begin
     if top=nil then
        kosong:=true
     else
        kosong:=false;
end;
function satu_simpul(top:PData):boolean;
begin
     satu_simpul:= top^.next = nil;
end;
procedure push(databaru:integer;var top:PData);
var
   baru:PData;
begin
     new(Baru);
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
procedure pop(var top:PData;var data:integer);
var
   bantu:PData;
begin
     if not kosong(top) then
     begin
          data:=top^.info;
          bantu:=top;
          top:=top^.next;
          dispose(bantu);
     end
     else
         writeln('Stack kosong, pop failed');
end;
const
     hexa:array[0..15] of char=('0','1','2','3','4','5','6','7',
                                '8','9','A','B','C','D','E','F');
var
   top:PData;
   data:integer;
   desimal,sisa,biner:integer;
begin
     inisialisasi_Stack(top);
     write('Desimal : ');readln(desimal);
     repeat
           sisa:=desimal mod 16;
           push(sisa,top);
           desimal:=desimal div 16;
     until desimal=0;
     repeat
           pop(top,biner);
           write(hexa[biner],' ');
     until kosong(top)=true;
     writeln('Bye');
     readln;
end.
