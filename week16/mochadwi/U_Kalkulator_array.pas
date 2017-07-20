program U_Kalkulator_array;

uses crt;

const
     maxStack = 1000;
     numeric  = ['0'..'9'];
     opr      = ['^']+['/']+['*']+['+']+['-'];
      
type
    TString = array[1..maxStack] of string; // just store array of string
    TInteger = array[1..maxStack] of integer; // operands
    TChar = array[1..maxStack] of char;	 // operator / simbol
    
    CStack = record
		info : TChar;
		top	 : integer;
    end;
    
    SStack = record
		info : TString;
		top	 : integer;
    end;
    
    IStack = record
		info : TInteger;
		top	 : integer;
    end;
	
procedure initStack(var top: integer);
begin
     top := 0;
end;

function isEmpty(top: integer): boolean;
begin
     if (top = 0) then
        isEmpty := true
     else
        isEmpty := false;
end;

function isFull(top:integer): boolean;
begin
     isFull := top = maxstack;
end;

procedure push(databaru: char; var stack: TChar; var top: integer);
begin
	 if not isFull(top) then
     begin
          top:=top+1;
          stack[top]:=databaru;
     end
     else
         writeln('Stack sudah isFull');
end;

procedure push(databaru: string; var stack: TString; var top: integer);
begin
	 if not isFull(top) then
     begin
          top:=top+1;
          stack[top]:=databaru;
     end
     else
         writeln('Stack sudah isFull');
end;

// procedure push(databaru: char; var stack: TInteger; var top: integer);
// begin
// 	 if not isFull(top) then
//      begin
//           top:=top+1;
//           stack[top]:=databaru;
//      end
//      else
//          writeln('Stack sudah isFull');
// end;

procedure pop(var stack: TChar; var top: integer; var data: char);
begin
     if not isEmpty(top) then // not isEmpty(top) <===> isEmpty(top)=false
     begin
          data:=stack[top];
          top:=top-1;
     end else
         writeln('Stack isEmpty. POP gagal');
end;

procedure pop(var stack: TString; var top: integer; var data: string);
begin
     if not isEmpty(top) then // not isEmpty(top) <===> isEmpty(top)=false
     begin
          data:=stack[top];
          top:=top-1;
     end else
         writeln('Stack isEmpty. POP gagal');
end;

procedure pop(var stack: TInteger; var top: integer; var data: integer);
begin
     if not isEmpty(top) then // not isEmpty(top) <===> isEmpty(top)=false
     begin
          data:=stack[top];
          top:=top-1;
     end else
         writeln('Stack isEmpty. POP gagal');
end;

procedure print(stack : CStack);
var
	i : integer;
begin
	for i := 1 to stack.top do
	begin
		write(stack.info[i]);
		if (i <> stack.top) then write(', ');
	end;
end;

procedure print(stack : SStack);
var
	i : integer;
begin
	for i := 1 to stack.top do
	begin
		write(stack.info[i]);
		if (i <> stack.top) then write(', ');
	end;
end;

procedure print(stack : IStack);
var
	i : integer;
begin
	for i := 1 to stack.top do
	begin
		write(stack.info[i]);
		if (i <> stack.top) then write(', ');
	end;
end;

function isOperand(C: char): boolean;
begin
    isOperand := false;

    if (C in numeric) then
    begin
        isOperand := true;
    end;
end;

function isOperator(C: char): boolean;
begin
    isOperator := false;

    if (C in opr) then
    begin
        isOperator := true;
    end;
end;

// procedure infixToPostfix(var stack: CStack; var p: CStack);
procedure infixToPostfix(var stack: CStack; var p: string);
var
    i, j, k: integer;
    weight: TInteger; // operands
    expressions: string;
    cleanPostfix : SStack;
    kr, krTemp: char;

begin
    clrscr;
    j := 0; k := 0;
    initStack(stack.top);
    initStack(cleanPostfix.top);
    // initStack(p.top);
    writeln('Program konversi expressions to postfix');
    write('Notasi Infix   : '); readln(expressions);
    write('Notasi Postfix : ');
    {* 1. *}
    push('(', stack.info, stack.top);
    expressions := expressions + ' )'; // sentinel

    {* 2. *}
    for i := 1 to length(expressions) do
    begin
            kr := expressions[i];
            krTemp := 't';
            {* 5. *}
            if (isOperator(kr)) then // if operator encountered
            begin
                write('opr encountered'); readln();
                write('combined p: ', p); readln();
                if (stack.top > 1) then
                begin
                    push(p, cleanPostfix.info, cleanPostfix.top);
                    p := '';
                end;
                j := j + 1;
                // write('masuk ke operator'); readln();
                case kr of
                    '^'     : weight[j] := 4;
                    '*','/' : weight[j] := 3;
                    '+','-' : weight[j] := 2;
                end;
                
                while (weight[j-1] >= weight[j]) do // akan berjalan kalo udah ada data sebelumnya
                begin
                    //write(stack[j-1]);  // print (j - 1) operator
                    write('masuk ke pengecekan operator'); readln();
                    weight[j-1] := weight[j]; // overwrites j - 1 value with j
                    j := j-1;
                    pop(stack.info, stack.top, krTemp);
                    push(krTemp, cleanPostfix.info, cleanPostfix.top);
                end;
                //j = j - 1;

                push(kr, stack.info, stack.top);
            end
            {* 3. If an operand is encountered, add it to Postfix *}
            else if (isOperand(kr) or (kr = '.') or (kr = ',')) then
            begin
                // push(kr, p.info, p.top);
                p := p + kr;
                writeln('p current: ', p);
            end
            {* 4.  *}
            // write('scan simbol'); readln();
            else if (kr = '(') then
            begin
                j:=j+1;
                // stack[j] := kr;
                // write('masuk ke ('); readln();
                push(kr, stack.info, stack.top);
                weight[j] := 1; // tingkatan ( = 1 
            end //}
            {* 6.  *}
            else if (kr = ')') then
            begin
                while (stack.info[stack.top] <> '(') and (stack.top > 0) do
                begin
                    write('( encountered: ', stack.info[stack.top]); readln();
                    pop(stack.info, stack.top, krTemp);
                    push(krTemp, cleanPostfix.info, cleanPostfix.top);
                end;
                // if (stack.info[stack.top] = '(') then pop(stack.info, stack.top, krTemp);
            end //}
            else if ((kr = ';') or (kr = ' ')) then
            begin
                // continue;
                write('blankspace encountered'); readln();
                write('combined p: ', p); readln();
                push(p, cleanPostfix.info, cleanPostfix.top);
                p := '';
            end;
            writeln('curr postfix: ', cleanPostfix.info[cleanPostfix.top]);
    end;

    writeln();
    write('Postfix: '); print(cleanPostfix); // tampilkan bentuk postfix
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


{Procedure HitungPostfix(var Top:integer; var hasil:real; var hitung : real);
   var
      i : integer;
      SetOperator : set of char;
      Simbol : char;
      a,b: real;
      stack :Tstack;
	  p 	: CStack;
	   //Infix : AInfix;
	   Huruf : string;
	   data : char;
	   data1 : real;
	   databaru : char;
   begin


        SetOperator := ['^']+['*']+['/']+['+']+['-'];
        Huruf := Huruf + ')'; // ')' sentinel
        // infixToPostfix(stack, p);
        // push(databaru,stack,top);
        for i:=1 to top+1 do
        begin
             Simbol:=Huruf[i];
             if(Simbol in SetOperator)
               then
                   begin
						Pop(stack,top,data);
                        b:=ord(data);
						Pop(stack,top,data);
                        a:=ord(data);
 
                        case Simbol of
                             '^' : hitung := Pangkat(a,b);
                             '*' : hitung := Kali(a,b);
                             '/' : hitung := a / b;
                             '+' : hitung := a+b;
                             '-' : hitung := a-b;
                        end;
                       push(chr(round(hitung)),Stack,Top); // mengonversi real -> int -> char 
                   end
               else
                   if(Simbol = ')')
                     then
                         begin
							  Pop(stack,top,data);
							  hasil:=ord(data);
                         end
 
        end;
        writeln;
        write('Hasilnya adalah : ',hasil);
                              readln;
   end;   }

   
var
    //    stack    : Tstack;
    stack    : CStack;
    // p        : CStack;
    p  : string;
    ulangi   : char;
    data     : char;
    hasil    : real;
    hitung   : real;
	
begin
    repeat
    clrscr;
    writeln;
    //HitungPostfix(Top,hasil,hitung);
    infixToPostfix(stack, p);
    writeln;
    writeln('Hitung Lagi (Y/T)');
    repeat 
            ulangi:=readkey; 
        until (ulangi='y') or (ulangi='t'); 
    until ulangi='t';
    writeln('Bye');
    readln;
end.