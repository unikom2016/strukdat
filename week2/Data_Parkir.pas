program Data_Parkir;

uses crt;
const
     maks = 20;
type
     DataParkir =
         record
            kdparkir : string;
            lamaparkir : integer;
            jeniskendaraan : string;
         end;

     arrparkir = array[1..maks] of DataParkir;
var
     PKR       : arrparkir;
     jp,menu,N : integer;

//Tranversal Pertukaran
{procedure Pertukaran(var a,b: DataParkir);

var
   c: DataParkir;
   begin
      c:=a;        a:=b;   b:=c;
   end;}

//Transversal Pengurutan
procedure swap(var a, b: DataParkir);
var
    temp : DataParkir;
begin
  temp := a;
  a    := b;
  b    := temp;
end;

procedure Asc_Insert;
var
   temp : DataParkir;
   i,j : integer;
   begin
    for i:= 2 to jp do
    begin
        j := i;
        while (PKR[j].lamaparkir < PKR[j - 1].lamaparkir) and (j>0) do
        begin
            swap(PKR[j], PKR[j - 1]);
            dec(j);
        end;
    end;
end;

procedure menupilihan (var menu:integer);
{I.S. : user memilih salah satu menu}
{F.S. : menghasilkan menu yang dipilih}
begin
     gotoxy(30,9); write('MENU PILIHAN');
     gotoxy(30,10); write('============');
     gotoxy(30,11); write('1. Isi Data Parkir ');
     gotoxy(30,12); write('2. Tampil Data Parkir ');
     gotoxy(30,13); write('3. Cari Data Parkir');
     gotoxy(30,14); write('4. Penghancuran Data ');
     gotoxy(30,15); write('0. Keluar ');
     gotoxy(30,16); write('PILIHAN ANDA ? ');  readln(menu);

     //validasi
     while( menu > 4 ) or (menu < 0) do
     begin
     gotoxy(20,18); write('Menu Pilihan salah, ulangi tekan enter!');  readln;
     gotoxy(20,18); clreol;
     gotoxy(45,16); clreol;
     gotoxy(45,16); readln(menu);
     end;
end;

procedure isidata(var PKR : arrparkir ;var jp : integer);
var
   i : integer;
begin
     for i := 1 to jp do
     begin
          gotoxy(10,6+i);
          readln(PKR[i].kdparkir);
          gotoxy(23,6+i);
          readln(PKR[i].jeniskendaraan);
          gotoxy(49,6+i);
          readln(PKR[i].lamaparkir);

      end;

          gotoxy(2,8+i); readln; clrscr;
          menupilihan(menu);
end;

procedure tampildata(var PKR : arrparkir ;var jp : integer);
var
   i : integer;
begin
     gotoxy(2,4);
              writeln('========================================================');
     gotoxy(2,5);
              writeln('| NO | Kode Parkir | Jenis Kendaraan | Lama Parkir/jam |');
     gotoxy(2,6);
              writeln('========================================================');
     for i := 1 to jp do
     begin
              gotoxy(2,6+i);
              write('|    |             |                 |                 |');
     end;

     gotoxy(2,7+i);
              writeln('========================================================');

     for i := 1 to jp do
     begin
              gotoxy(4,6+i);
              write(i);
              gotoxy(10,6+i);
              delay(500);
              write(PKR[i].kdparkir);
              gotoxy(23,6+i);
              delay(500);
              write(PKR[i].jeniskendaraan);
              gotoxy(49,6+i);
              delay(500);
              write(PKR[i].lamaparkir);
     end;
              gotoxy(2,8+i); readln;
end;

procedure Penciptaan(var PKR : arrparkir ;var jp : integer);
var
   i : integer;
begin
     gotoxy(30,1);
              write('===DATA PARKIR===');
     gotoxy(2,3);
              write('Jumlah Barang : '); read(jp);
     gotoxy(2,4);
              writeln('========================================================');
     gotoxy(2,5);
              writeln('| NO | Kode Parkir | Jenis Kendaraan | Lama Parkir/jam |');
     gotoxy(2,6);
              writeln('========================================================');
     for i := 1 to jp do
     begin
              gotoxy(2,6+i);
              write('|    |             |                 |                 |');
     end;

     gotoxy(2,7+i);
              writeln('========================================================');

     for i := 1 to jp do
     begin
              PKR[i].kdparkir := '/';
              PKR[i].jeniskendaraan := '/';
              PKR[i].lamaparkir := 0;

              gotoxy(4,6+i);
              write(i);
              gotoxy(10,6+i);
              delay(500);
              write(PKR[i].kdparkir);
              gotoxy(23,6+i);
              delay(500);
              write(PKR[i].jeniskendaraan);
              gotoxy(49,6+i);
              delay(500);
              write(PKR[i].lamaparkir);
     end;
     readln;
end;

procedure carikode (N:integer; PKR:arrparkir);
var
   i,j,baris : integer;
   kd : string;
   ketemu : boolean;
begin

     write('Cari Kode Parkir : '); readln(kd);
     clrscr;
     i := 1;
     ketemu := false;
     while (not ketemu) and (i <= N) do
     begin
          if (pos(lowercase(kd),lowercase(PKR[i].kdparkir)) > 0) then
              ketemu := true
          else
              i := i + 1;
     end; //endwhile

     if (ketemu) then
     begin
          clrscr;

          gotoxy(30,1);
              write('===DATA PARKIR===');
          gotoxy(2,3);
              write('Kode Parkir : '); read(jp);
          gotoxy(2,4);
              writeln('========================================================');
          gotoxy(2,5);
              writeln('| Kode Parkir | Jenis Kendaraan | Lama Parkir/jam |');
          gotoxy(2,6);
              writeln('========================================================');
          baris := 6;
          for j:= i to N do
                 begin
                 if (pos(lowercase(kd),lowercase(PKR[j].kdparkir)) > 0) then
                 begin
                      gotoxy(1,baris+1);
                      write('|             |                 |                 |');
                      gotoxy(3,baris+1);write(PKR[j].kdparkir);
                      gotoxy(23,baris+1);write(PKR[j].JenisKendaraan);
                      gotoxy(46,baris+1);write(PKR[j].lamaparkir);
                      baris := baris + 1;
                 end;
          end;
          gotoxy(1,baris+1);
          writeln('========================================================');
          write('TEKAN ENTER untuk kembali !');
    end
    else
          writeln('Kode Parkir tidak ada ',kd,' tidak ada');
end;

begin
    //  menupilihan(menu);
     clrscr;
     Penciptaan(PKR,jp);
     isidata(PKR,jp);
     Asc_Insert;
     tampildata(PKR,jp);
     carikode(N,PKR);



end.
