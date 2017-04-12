program DoubleLinkedList;
{I.S. : }
{F.S. : }

uses crt;
//Kamus Global
type
    Point = ^Data;
    Mahasiswa = record
        NIM, Nama : string;
    end;
    data = record
        Info : Mahasiswa;
        Prev, Next : Point;
    end;

var
    Awal, Akhir, Awal2, Akhir2 : Point;
    Elemen       : string;
    Lagi       : char;
procedure IsiData(var Elemen : string);
begin
    write('Masukkan NIM  : '); 
    readln(Elemen);
end;

procedure SisipDepan(Elemen : string; var Awal, Akhir : Point);
var
    Baru,Bantu : Point;
    Ketemu : boolean;
begin
    New(Baru);
    Baru^.Info.NIM := Elemen;
    if (Awal = Nil)
    then
    begin
        write('Masukkan Nama : ');
        readln(Baru^.Info.Nama);
        Baru^.Next := Nil;
        Baru^.Prev := Nil;
        Awal := Baru;
        Akhir := Baru;
    end
    else
    begin
    Bantu := Awal;
    Ketemu := false;
    while (Not Ketemu) and (Bantu <> Nil) do
    begin
        if(Bantu^.Info.NIM = Baru^.Info.NIM)
        then
        begin
            Ketemu := true;
        end
        else
        begin
            Bantu := Bantu^.Next;
        end;
    end;
    if (Ketemu)
    then
    begin
        writeln('Maaf, NIM ',Elemen,' Sudah Ada');
    end
    else
    begin
        write('Masukkan Nama : ');
        readln(Baru^.Info.Nama);
        Baru^.Prev := Nil;
        Baru^.Next := Awal;
        Awal^.Prev := Baru;
        Awal := Baru;
    end;
    end;
end; //endprocedure

procedure TampilData(Awal : Point);
var
    Bantu : Point;
begin
    Bantu := Awal;
    while (Bantu <> Nil) do
    begin
        writeln(Bantu^.Info.NIM, '   ', Bantu^.Info.Nama);
        Bantu := Bantu^.Next;
    end;
    readln;
end;

procedure UrutNIM(Awal : Point; var Awal2, Akhir2 : Point);
var
    Baru,Bantu,Bantu2 : Point;
begin
    Awal2 := Nil;
    Akhir2 := Nil;
    Bantu := Awal;
    while (Bantu <> Nil) do
    begin
        New(Baru);
        Baru^.Info := Bantu^.Info;
        if (Awal2 = Nil)
        then
        begin
            Baru^.Prev := Nil;
            Baru^.Next := Nil;
            Awal2 := Baru;
            Akhir2 := Baru;
        end
        else
        begin
            if (Baru^.Info.NIM < Awal2^.Info.NIM)
            then
            begin
                //SisipDepan
                Baru^.Prev := Nil;
                Baru^.Next := Awal2;
                Awal2^.Prev := Baru;
                Awal2 := Baru;
            end 
            else
            begin
                if(Baru^.Info.NIM > Akhir2^.Info.NIM)
                then
                begin
                    //SisipBelakang
                    Baru^.Next := Nil;
                    Baru^.Prev :=  Akhir2;
                    Akhir2^.Next := Baru;
                    Akhir2 := Baru;
                end
                else
                begin
                    //SisipTengah
                    Bantu2 := Awal2;
                    while (Bantu2^.Info.NIM < Baru^.Info.NIM) do
                    begin
                        Bantu2 := Bantu2^.Next;
                    end;
                    Baru^.Next := Bantu2;
                    Baru^.Prev := Bantu2^.Prev;
                    Bantu2^.Prev^.Next := Baru;
                    Bantu2^.Prev := Baru;
                end;
            end;
        end;
            Bantu := Bantu^.Next;
    end;
end;

procedure HapusData(var Awal, Akhir : Point);
var
    NIMHapus : string;
    Bantu : Point;
    Ketemu : boolean;
begin
    write('NIM yang akan dihapus : ');
    readln(NIMHapus);
    Bantu := Awal;
    Ketemu := false;
    while (Not Ketemu) and (Bantu <> Nil) do
    begin
        if(Bantu^.Info.NIM = NIMHapus)
        then
        begin
            Ketemu := true;
        end
        else
        begin
            Bantu := Bantu^.Next;
        end;
        if (Ketemu)
        then
        begin
            if(Bantu = Awal)
            then
            begin
                //HapusDepan
                Awal := Awal^.Next;
                Awal^.Prev := Nil;
                Dispose(Bantu);
            end
            else
            begin
                if (Bantu = Akhir)
                then
                begin
                    //HapusBelakang
                    Akhir := Akhir^.Prev;
                    Akhir^.Next := Nil;
                    Dispose(Bantu);
                end
                else
                begin
                    //HapusTengah
                    Bantu^.Prev^.Next := Bantu^.Next;
                    Bantu^.Next^.Prev := Bantu^.Prev;
                    Dispose(Bantu);
                end;
            end;
        end
        else
        begin
            writeln('NIM ',NIMHapus, ' tidak ditemukan');
        end;
    end;
end;

procedure Penghancuran(var Awal,Akhir : Point);
{I.S. : }
{F.S. : }
var
    Phapus : Point;
begin
    Phapus := Awal;
    while (Phapus <> Nil) do
    begin
        Awal := Awal^.Next;
        Dispose(Phapus);
        Phapus := Awal;
    end; //endwhile
    Akhir := Nil;
end; //endprocedure

{procedure CariNIM();
var
Bantu : Point;

begin

end;}    

//Badan Program Utama
begin
    //Penciptaan
    Awal := Nil;
    Akhir := Nil;
    repeat
        IsiData(Elemen);
        SisipDepan(Elemen,Awal,Akhir);
        write('Mau Memasukkan Data Lagi[Y/T]? ');
        readln(Lagi);
        writeln;
    until(upcase(Lagi) = 'T');

    clrscr;
    //TampilData Awal (BelumTerurut)
    TampilData(Awal);
    readln;

    UrutNIM(Awal,Awal2,Akhir2);
    TampilData(Awal2);
    readln;

    clrscr;
    HapusData(Awal,Akhir);
    TampilData(Awal);
    readln;

    Penghancuran(Awal,Akhir);
    if (Awal = Nil)
    then
    begin
        writeln('Data Sudah Kosong');
        readln;
    end;
end.