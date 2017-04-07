program CollegeStudentWithDoubleLinkedList;
{I. S   : Membuat program yang berisi daftar film dengan menggunakan double linklist}
{F. S   : }

{ Kamus Global }
uses crt;

type
  Ptr = ^Data;

  Curriculum = record
    mtk, ing, ind : real;
  end;

  CollegeStudent = record
    nim, nama  : string;
    nilai      : Curriculum;
    ipk        : real;
  end;

  Data = record
        info         : CollegeStudent;
        pPrev, pNext : Ptr;
  end;

var
   pHead, pTail  : Ptr;
   pilih         : integer;

procedure create(var pHead, pTail : Ptr);
{I.S. : pHead dan pTail belum terdefinisi}
{F.S. : Menciptakan nilai nil pada pHead dan pTail}
{Kamus Tidak Ada}
{Algoritma}
begin
  pHead := nil;
  pTail := nil;
end; // EndProcedure create()

procedure showMenu();
{I.S. : }
{F.S. : Menampilkan menu}
{Kamus Tidak Ada}
{Algoritma}
begin
    clrscr;
    gotoxy(25,5);  WriteLn('-------------------------------------------');
    gotoxy(25,6);  writeln('|       College Student Admission         |');
    gotoxy(25,7);  writeln('-------------------------------------------');
    gotoxy(25,8);  writeln('|  1.  Insert Data                        |');
    gotoxy(25,9);  writeln('|  2.  Delete Data                        |');
    gotoxy(25,10); writeln('|  3.  Search Data                        |');
    gotoxy(25,11); writeln('|  4.  Show Data                          |');
    gotoxy(25,12); writeln('|  5.  Exit                               |');
    gotoxy(25,13); writeln('-------------------------------------------');
end; // EndProcedure showMenu()

procedure insertAtFront(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
{Kamus Lokal}
var
   baru, bantu : Ptr;
   found      : boolean;
   k           : integer;
{Algoritma}
begin
     New(Baru);

     gotoxy(10,9);  writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,10); writeln('|                                   MASUKAN DATA DAFTAR FILM                                         |');
     gotoxy(10,11); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,12); writeln('|        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
     gotoxy(10,13); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,14); writeln('|                      |                                       |        |         |RP.               |');
     gotoxy(10,15); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(11,14); write(' '); readln(baru^.info.Genre);

     gotoxy(34,14); write(' '); readln(baru^.info.Judul);
     gotoxy(75,14); write(' '); readln(baru^.info.Rating);
     gotoxy(84,14); write(' '); readln(baru^.info.Tahun);
     gotoxy(96,14); write(' '); readln(baru^.info.Harga);

     for k:= 2 to 3 do
         begin
              baru^.info.Kode := baru^.info.Kode + baru^.info.Judul[k];
         end;

     for k:= 1 to 2 do
         baru^.info.Kode := baru^.info.Kode + baru^.info.Genre[k];


     If (pHead = nil) then
       begin
            baru^.pNext := nil;
            baru^.pPrev := nil;
            pHead := baru;
            pTail := baru;
       end
          else
              begin
                   baru^.pNext := nil;
                   baru^.pNext := pHead;
                   pHead^.pPrev := baru;
                   pHead := baru;
              end;
end;






procedure SisipBelakang(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
   baru, bantu : Ptr;
   found      : boolean;
   k           : integer;

begin
     New(Baru);

     gotoxy(10,9);  writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,10); writeln('|                                   MASUKAN DATA DAFTAR FILM                                         |');
     gotoxy(10,11); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,12); writeln('|        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
     gotoxy(10,13); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,14); writeln('|                      |                                       |        |         |RP.               |');
     gotoxy(10,15); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(11,14); write(' '); readln(baru^.info.Genre);

     {
     for i:=1 to 2 do
         begin
              code_addLast := code_addLast + baru^.info.Genre[i];
         end;

     baru^.info.Kode := code_addLast;
     }


     gotoxy(34,14); write(' '); readln(baru^.info.Judul);
     gotoxy(75,14); write(' '); readln(baru^.info.Rating);
     gotoxy(84,14); write(' '); readln(baru^.info.Tahun);
     gotoxy(96,14); write(' '); readln(baru^.info.Harga);

     for k:= 2 to 3 do
         begin
              baru^.info.Kode := baru^.info.Kode + baru^.info.Judul[k];
         end;

     for k:= 1 to 2 do
         baru^.info.Kode := baru^.info.Kode + baru^.info.Genre[k];


     If (pHead = nil) then
       begin
            baru^.pNext := nil;
            baru^.pPrev := nil;
            pHead := baru;
            pTail := baru;
       end
          else
              begin
                   baru^.pPrev := pTail;
                   baru^.pNext := nil;
                   pTail^.pNext := baru;
                   pTail := baru;
              end;
end;





{
procedure SisipTengah(var pHead, pTail : Ptr);

begin
     bantu := pHead;
     found := False;
     gotoxy(10,11); writeln('--------------------------------------');
     gotoxy(10,12); write  ('|  CARI BERDASARKAN INDEX  |          |'); readln(Cari);
     gotoxy(10,13); writeln('--------------------------------------');
     while (not found) and (bantu <> nil) do
           begin
               if (dataCari = bantu^.info.Tahun) then
                 begin
                      found := True;
                 end
                 else
                     bantu := bantu^.pNext;
           end;

     if (found) then
        begin


        end;
end;
}



procedure TambahData();
{I.S. : }
{F.S. : }
var
   pilih : integer;

begin
     gotoxy(25,5);  WriteLn('-------------------------------------------');
     gotoxy(25,6);  writeln('|            PILIH TAMNAH DATA            |');
     gotoxy(25,7);  writeln('-------------------------------------------');
     gotoxy(25,8);  writeln('|  1  |  SISIP DEPAN                      |');
     gotoxy(25,9);  writeln('|  2  |  SISIP BELAKANG                   |');
     gotoxy(25,10); writeln('|  3  |  SISIP TENGAH                     |');
     gotoxy(25,11); writeln('-------------------------------------------');
     gotoxy(37,13); write('Pilih  : '); readln(pilih);

     clrscr;
     //mencari berdasarkan judul
     if (pilih = 1) then
        insertAtFront(pHead, pTail)
        else if (pilih = 2) then
                SisipBelakang(pHead, pTail);
                {
                else if (pilih = 3) then
                       CariTahun()
                       else
                           gotoxy(37,13); writeln('Data yang anda masukan salah!');
      }

end;







procedure TampilData();
{I.S. : }
{F.S. : }
var
   bantu    : Ptr;
   i, j, k  : integer;

begin
     gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
     gotoxy(1,2);  writeln('|                                            MASUKAN DATA DAFTAR FILM                                               |');
     gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');
     gotoxy(1,4);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
     gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
     bantu := pHead;
     i := 6;
     j := 7;
     k := 1;
     while (bantu <> nil) do
           begin
                gotoxy(16,i);  writeln('| ',upcase(bantu^.info.Genre));
                {
                for k:= 1 to 2 do
                    bantu^.info.Kode := bantu^.info.Kode + bantu^.info.Genre[k];
                 }
                bantu^.info.Index := k;
                gotoxy(1,i);   writeln('| ',bantu^.info.Index,'-',bantu^.info.Kode);
                gotoxy(39,i);  writeln('|  ',upcase(bantu^.info.Judul));
                gotoxy(79,i);  writeln('|  ',bantu^.info.Rating:2:1);
                gotoxy(88,i);  writeln('| ',bantu^.info.Tahun);
                gotoxy(98,i);  writeln('|Rp. ',bantu^.info.Harga);
                gotoxy(117,i); writeln('|');
                bantu := bantu^.pNext;
                i := i+1;
                j := j+1;
                k := k+1;
           end;
     gotoxy(1,j-1);  writeln('---------------------------------------------------------------------------------------------------------------------');
     readln;
end;





procedure CariJudul();
{I.S. : }
{F.S. : }
var
   bantu    : Ptr;
   Cari     : string;
   found   : boolean;

begin
     found := False;
     bantu := pHead;
     Cari := upcase(Cari);
     gotoxy(10,11); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,12); writeln('|  CARI JUDUL FILM     |                                                                             |');
     gotoxy(10,13); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(34,12); write(''); readln(Cari);

     while (not found) and (bantu <> nil) do
          begin
              if (Cari = bantu^.info.Judul) then
                 found := True
                 else
                     bantu := bantu^.pNext;
          end;

     clrscr;
     if (found) then
       begin
           gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
           gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
           gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

           gotoxy(1,4);   writeln('|');
           gotoxy(1,4);   writeln('| ',upcase(bantu^.info.Kode));
           gotoxy(1,4);   writeln('| ',bantu^.info.Index,'-',bantu^.info.Kode);
           gotoxy(16,4);  writeln('| ',upcase(bantu^.info.Genre));
           gotoxy(39,4);  writeln('|  ',upcase(bantu^.info.Judul));
           gotoxy(79,4);  writeln('|  ',bantu^.info.Rating:2:1);
           gotoxy(88,4);  writeln('| ',bantu^.info.Tahun);
           gotoxy(98,4);  writeln('|Rp. ',bantu^.info.Harga);
           gotoxy(117,4); writeln('|');

           gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
       end
       else
           writeln('Data tidak di temukan!');

       readln;
end;






procedure CariGenre();
{I.S. : }
{F.S. : }
var
   bantu      : Ptr;
   dataCari   : string;
   //found   : boolean;
   i, j       : integer;

begin
     //found := False;
     bantu := pHead;
     gotoxy(10,11); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,12); writeln('|  CARI GENRE FILM     |                                                                             |');
     gotoxy(10,13); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(34,12); write(''); readln(dataCari);


     clrscr;
     //tamplet tampilan Cari Tahun
     gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
     gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
     gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

     i := 4;
     j := 5;
     while (bantu <> nil)do //and (not found) do
          begin
              if (dataCari = bantu^.info.Genre) then
                 begin
                      //found := True
                      gotoxy(1,i);   writeln('|');
                      gotoxy(1,i);   writeln('| ',bantu^.info.Index,'-',bantu^.info.Kode);
                      gotoxy(1,i);   writeln('| ',upcase(bantu^.info.Kode));
                      gotoxy(16,i);  writeln('| ',upcase(bantu^.info.Genre));
                      gotoxy(39,i);  writeln('|  ',upcase(bantu^.info.Judul));
                      gotoxy(79,i);  writeln('|  ',bantu^.info.Rating:2:1);
                      gotoxy(88,i);  writeln('| ',bantu^.info.Tahun);
                      gotoxy(98,i);  writeln('|Rp. ',bantu^.info.Harga);
                      gotoxy(117,i); writeln('|');

                      i := i+1;
                      j := j+1;
                      bantu := bantu^.pNext;
                 end
                 else
                     bantu := bantu^.pNext;
          end;

      //penutup tamplet tampilan Cari Tahun
      gotoxy(1,j);  writeln('---------------------------------------------------------------------------------------------------------------------');

     {
     if (found) then
       begin
           gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
           gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
           gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

           gotoxy(1,4);   writeln('|');
           gotoxy(16,4);  writeln('| ',upcase(bantu^.info.Genre));
           gotoxy(39,4);  writeln('|  ',upcase(bantu^.info.Judul));
           gotoxy(79,4);  writeln('|  ',bantu^.info.Rating:2:1);
           gotoxy(88,4);  writeln('| ',bantu^.info.Tahun);
           gotoxy(98,4);  writeln('|Rp. ',bantu^.info.Harga);
           gotoxy(117,4); writeln('|');

           gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
       end
       else
           writeln('Data tidak di temukan!');

        }
       readln;
end;






procedure CariTahun();
{I.S. : }
{F.S. : }
var
   bantu    : Ptr;
   dataCari : integer;
   //found   : boolean;
   i, j     : integer;

begin
     //found := False;
     bantu := pHead;
     gotoxy(10,11); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(10,12); writeln('|  CARI TAHUN FILM     |                                                                             |');
     gotoxy(10,13); writeln('------------------------------------------------------------------------------------------------------');
     gotoxy(34,12); write(''); readln(dataCari);

     clrscr;
     //tamplet tampilan Cari Tahun
     gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
     gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
     gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

     i := 4;
     j := 5;
     while (bantu <> nil)do //and (not found) do
          begin
              if (dataCari = bantu^.info.Tahun) then
                 begin
                      //found := True
                      gotoxy(1,i);   writeln('|');
                      gotoxy(1,i);   writeln('| ',bantu^.info.Index,'-',bantu^.info.Kode);
                      gotoxy(1,i);   writeln('| ',upcase(bantu^.info.Kode));
                      gotoxy(16,i);  writeln('| ',upcase(bantu^.info.Genre));
                      gotoxy(39,i);  writeln('|  ',upcase(bantu^.info.Judul));
                      gotoxy(79,i);  writeln('|  ',bantu^.info.Rating:2:1);
                      gotoxy(88,i);  writeln('| ',bantu^.info.Tahun);
                      gotoxy(98,i);  writeln('|Rp. ',bantu^.info.Harga);
                      gotoxy(117,i); writeln('|');

                      i := i+1;
                      j := j+1;
                      bantu := bantu^.pNext;
                 end
                 else
                     bantu := bantu^.pNext;
          end;

      //penutup tamplet tampilan Cari Tahun
      gotoxy(1,j);  writeln('---------------------------------------------------------------------------------------------------------------------');

     {
     if (found) then
       begin
           gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
           gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
           gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

           gotoxy(1,4);   writeln('|');
           gotoxy(16,4);  writeln('| ',upcase(bantu^.info.Genre));
           gotoxy(39,4);  writeln('|  ',upcase(bantu^.info.Judul));
           gotoxy(79,4);  writeln('|  ',bantu^.info.Rating:2:1);
           gotoxy(88,4);  writeln('| ',bantu^.info.Tahun);
           gotoxy(98,4);  writeln('|Rp. ',bantu^.info.Harga);
           gotoxy(117,4); writeln('|');

           gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
       end
       else
           writeln('Data tidak di temukan!');

        }
       readln;
end;






procedure MenuPencarian();
{I.S. : }
{F.S. :}
var
   pilih  : integer;

begin
     gotoxy(25,5);  WriteLn('-------------------------------------------');
     gotoxy(25,6);  writeln('|             PILIH PENCARIAN             |');
     gotoxy(25,7);  writeln('-------------------------------------------');
     gotoxy(25,8);  writeln('|  1  |  MENCARI BERDASARKAN JUDUL        |');
     gotoxy(25,9);  writeln('|  2  |  MENCARI BERDASARKAN GENRE        |');
     gotoxy(25,10); writeln('|  3  |  MENCARI BERDASARKAN TAHUN        |');
     gotoxy(25,11); writeln('-------------------------------------------');
     gotoxy(37,13); write('Pilih  : '); readln(pilih);

     clrscr;
     //mencari berdasarkan judul
     if (pilih = 1) then
        CariJudul()
        else if (pilih = 2) then
                CariGenre()
                else if (pilih = 3) then
                       CariTahun()
                       else
                           gotoxy(37,13); writeln('Data yang anda masukan salah!');

end;





//pengurutan berdasarkan selection sort (minimal)
procedure UrutJudul(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
    j, i, min, temp : Ptr;

begin
     i := pHead;
     while (i <> pTail) do
           begin
               min := i;
               j := i^.pNext;
               while (j <> nil) do
                     begin
                         if (i^.info.Judul > j^.info.Judul) then
                            min :=  j
                            else
                                j := j^.pNext
                     end;
               i := i^.pNext;
            end;

      min := temp;
      i := j;
      j := i;

      TampilData();
      readln;
end;



//pengurutan berdasarkan selection sort (minimal)
procedure UrutGenre(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
    j, i, min, temp : Ptr;

begin
     i := pHead;
     while (i <> pTail) do
           begin
               min := i;
               j := i^.pNext;
               while (j <> nil) do
                     begin
                         if (i^.info.Genre > j^.info.Genre) then
                            min :=  j
                            else
                                j := j^.pNext
                     end;
               i := i^.pNext;
            end;

      min := temp;
      i := j;
      j := i;

      TampilData();
      readln;
end;




//pengurutan berdasarkan selection sort (minimal)
procedure UrutRating(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
    j, i, min, temp : Ptr;

begin
     i := pHead;
     while (i <> pTail) do
           begin
               min := i;
               j := i^.pNext;
               while (j <> nil) do
                     begin
                         if (i^.info.Rating > j^.info.Rating) then
                            min :=  j
                            else
                                j := j^.pNext
                     end;
               i := i^.pNext;
            end;

      min := temp;
      i := j;
      j := i;

      TampilData();
      readln;
end;




//pengurutan berdasarkan selection sort (minimal)
procedure UrutTahun(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
    j, i, min, temp : Ptr;

begin
     i := pHead;
     while (i <> pTail) do
           begin
               min := i;
               j := i^.pNext;
               while (j <> nil) do
                     begin
                         if (i^.info.Tahun > j^.info.Tahun) then
                            min :=  j
                            else
                                j := j^.pNext
                     end;
               i := i^.pNext;
            end;

      min := temp;
      i := j;
      j := i;

      TampilData();
      readln;
end;




procedure Pengurutan();
{I.S. : }
{F.S. :}
var
   pilih  : integer;

begin
     gotoxy(25,5);  WriteLn('-------------------------------------------');
     gotoxy(25,6);  writeln('|             PILIH PENGURUTAN            |');
     gotoxy(25,7);  writeln('-------------------------------------------');
     gotoxy(25,8);  writeln('|  1  |  PENGURUTAN BERDASARKAN JUDUL     |');
     gotoxy(25,9);  writeln('|  2  |  PENGURUTAN BERDASARKAN GENRE     |');
     gotoxy(25,10); writeln('|  3  |  PENGURUTAN BERDASARKAN RATING    |');
     gotoxy(25,11); writeln('|  4  |  PENGURUTAN BERDASARKAN TAHUN     |');
     gotoxy(25,12); writeln('-------------------------------------------');
     gotoxy(37,14); write('Pilih  : '); readln(pilih);

     clrscr;
     //mencari berdasarkan judul
     if (pilih = 1) then
        UrutJudul(pHead, pTail)
        else if (pilih = 2) then
                UrutGenre(pHead, pTail)
                else if (pilih = 3) then
                       UrutRating(pHead, pTail)
                       else if (pilih = 4) then
                               UrutTahun(pHead, pTail)
                               else
                               gotoxy(37,14); writeln('Data yang anda masukan salah!');

end;







procedure Penghancuran(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
   Phapus : Ptr;

begin
     Phapus := pHead;
     while (Phapus <> nil) do
     begin
         pHead := pHead^.pNext;
         Dispose(Phapus);
         Phapus := pHead;
     end; //EndWhile
     pTail := nil;
end;






//badan program utama
begin
     create();
     repeat
           showMenu();
           gotoxy(37,15); write('Pilih  : '); readln(pilih);
           clrscr;
           if (pilih = 1) then
              TambahData()
              else if (pilih = 2) then
                      TampilData()
                      else if (pilih = 3) then
                              MenuPencarian()
                              else if (pilih = 4) then
                                   Pengurutan();


     until(pilih = 5);


     Penghancuran(pHead, pTail);
     if (pHead = nil) then
        begin
             writeln('Data Sudah Kosong!');
        end;

     readln;
end.
