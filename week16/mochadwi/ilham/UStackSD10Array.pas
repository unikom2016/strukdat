program StackSD10Array;
const
     maxStack=50;
type
    TStack=array[1..maxStack] of integer;

procedure inisialisasi_stack(var top:integer);
begin
     top:=0;
end;
function kosong(top:integer):boolean;
begin
     if top=0 then
	 begin
        kosong:=true;
     end else
         kosong:=false;
end;
function penuh(top:integer):boolean;
begin
     penuh:= top = maxstack;
end;
procedure push(databaru:integer;var stack:TStack;var top:integer);
begin
     // if penuh(top)=false then
	 if not penuh(top) then
     begin
          top:=top+1;
          stack[top]:=databaru;
     end
     else
         writeln('Stack sudah penuh');
end;
procedure pop(var stack:TStack; var top:integer;var data:integer);
begin
     if not kosong(top) then // not kosong(top) <===> kosong(top)=false
     begin
          data:=stack[top];
          top:=top-1;
     end
     else
         writeln('Stack kosong. POP gagal');
end;
function peek(stack:TStack;top:integer):integer;
begin
     peek:=stack[top];
end;
var
   Stack:TStack;
   top:integer;
   data:integer;
   desimal,sisa,biner:integer;
begin
     inisialisasi_stack(top);
     write('Desimal : ');readln(desimal);
     repeat
           sisa:=desimal mod 2;
           push(sisa,stack,top);
           desimal:=desimal div 2;
     until desimal=0;
     repeat
           pop(stack,top,biner);
           write(biner,' ');
     until kosong(top)=true;

     writeln('Bye');
     readln;
end.
