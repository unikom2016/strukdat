program U_Kalkulator_array;

uses crt;

const
     maxStack=100;
	 
type
    TStack1 = array[1..maxStack] of integer; // operands
    TStack = array[1..maxStack] of char;	 // operator
	EStack = record
		info : TStack;
		top	 : integer;
	end;
	
procedure inisialisasi_stack(var top:integer);
begin
     top:=0;
end;

function kosong(top:integer):boolean;
begin
     if top=0 then
        kosong:=true
     else
         kosong:=false;
end;

function penuh(top:integer):boolean;
begin
     penuh:= top = maxstack;
end;

procedure push(databaru:char; var stack:TStack; var top:integer);
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

procedure pop(var stack:TStack; var top:integer;var data:char);
begin
     if not kosong(top) then // not kosong(top) <===> kosong(top)=false
     begin
          data:=stack[top];
          top:=top-1;
     end else
         writeln('Stack kosong. POP gagal');
end;

procedure tampil(stack : EStack);
var
	i : integer;
begin
	for i := 1 to stack.top do
	begin
		write(stack.info[i]);
		if (i <> stack.top) then write(' ');
	end;
end;

Procedure postfix(var stack:TStack; var p : EStack);
var
top, j,i, x : integer;
pri: Tstack1; // operands
form : string;
opr: set of char;
kr: char;
begin
        clrscr;
        j := 0;
		inisialisasi_stack(p.top); // inisialisai Expressions P
        opr:=['^']+['/']+['*']+['+']+['-'];
        writeln('Program konversi infix to postfix');
        write('Notasi Infix   : '); readln(form);
        write('Notasi Postfix : ');
		{* 1. *}
		push('(', stack, top);
		form := form + ')';
		
		{* 2. *}
        for i := 1 to length(form) do
                begin
                        kr := form[i];
						{* 4.  *}
                        if(kr = '(') then
                                begin
                                        // j:=j+1;
                                        // stack[j] := kr;
										push(kr, stack, top);
                                        // pri[j]:=1;

                                end
						{* 6.  *}
                        { else if(kr = ')') then
                                begin
                                        while (stack[j] <> '(') do
                                                begin
                                                        write(stack[j]);
                                                        j:=j-1;
                                                end;
                                        if (stack[j]='(') then j:=j-1;
                                end }
								
						{* 5. *}
                        { else if(kr in opr) then
                                begin
                                        // j:=j+1;
                                        case kr of
                                                '^'     : pri[j] := 4;
                                                '*','/' : pri[j] := 3;
                                                '+','-' : pri[j] := 2;
                                        end;
                                        while (pri[j] <= pri[j-1]) do
                                                begin
                                                        write(stack[j-1]);
                                                        pri[j-1] := pri[j];
                                                        j:=j-1;

                                                end;
                                        stack[j]:=kr;
                                end
                        else if(kr = ';') then 
                                begin
                                        for x:=j downto 1 do 
                                                begin
                                                        write(stack[x]);
                                                        // j:=j-1;
                                                end
                                end
                        else if(kr <> ' ') then write(kr) }
						
						{* 3. If an operand is encountered, add it to Postfix *}
						else
						begin
							push(kr, p.info, p.top);
						end;
                end;
        // for x:=j downto 1 do write(p[x]);
		
		tampil(p); // tampilkan bentuk postfix
//readln;
end;

 Function Pangkat(m,n:real):real;
   begin
        if(n = 0)
          then
              Pangkat := 1
          else
              Pangkat := m * Pangkat(m,n-1);
   end;
 
   Function Kali(m,n:real):real;
   begin
        if(n = 1)
          then
              Kali := m
          else
              Kali := m + Kali(m,n-1);
   end;


Procedure HitungPostfix(var Top:integer; var hasil:real; var hitung : real);
   var
      i : integer;
      SetOperator : set of char;
      Simbol : char;
      a,b: real;
      stack :Tstack;
	  p 	: EStack;
	   //Infix : AInfix;
	   Huruf : string;
	   data : char;
	   data1 : real;
	   databaru : char;
   begin


        SetOperator := ['^']+['*']+['/']+['+']+['-'];
        Huruf := Huruf + ')'; {* ')' sentinel *}
        postfix(stack, p);
        // push(databaru,stack,top);
        {for i:=1 to top+1 do
        begin
             Simbol:=Huruf[i];
             if(Simbol in SetOperator)
               then
                   begin
						// 4. a 
						Pop(stack,top,data);
                        b:=ord(data);
						Pop(stack,top,data);
                        a:=ord(data);
 
                        case Simbol of // 4. b 
                             '^' : hitung := Pangkat(a,b);
                             '*' : hitung := Kali(a,b);
                             '/' : hitung := a / b;
                             '+' : hitung := a+b;
                             '-' : hitung := a-b;
                        end;
 
						// 4. c 
                       push(chr(round(hitung)),Stack,Top); // mengonversi real -> int -> char 
                   end
               else
                   if(Simbol = ')')
                     then
                         begin
							  // 5. 
							  Pop(stack,top,data);
							  hasil:=ord(data);
                         end
 
        end;
        writeln;
        write('Hasilnya adalah : ',hasil);
                              readln;}
   end;   

   
var
   top:integer;
   stack : Tstack;
   ulangi : char;
   data : char;
   hasil:real;
   hitung : real;
	

begin
     inisialisasi_stack(top);
     repeat
     clrscr;
    //push(stack,top);
     writeln;
     HitungPostfix(Top,hasil,hitung);
     writeln;
     writeln('Hitung Lagi (Y/T)');
    repeat 
    ulangi:=readkey; 
    until (ulangi='y') or (ulangi='t'); 
    until ulangi='t';
      //POP
       while not kosong(top) do
     begin
          pop(stack,top,data);
          writeln(data,' ');
     end;
     writeln('Bye');
     readln;

end.