program CollegeStudentWithDoubleLinkedList;
{I. S   : Program memasukkan data mahasiswa}
{F. S   : Menghasilkan data mahasiswa}

{ Kamus Global }
uses crt;

type
  Ptr = ^Data;

  CollegeStudent = record
    id, name : string;
    gpa      : real;
  end;

  Data = record
    info         : CollegeStudent;
    pPrev, pNext : Ptr;
  end;

var
   pHead, pTail : Ptr;
   select       : integer;

procedure create(var pHead, pTail : Ptr);
{I.S. : pHead dan pTail belum terdefinisi}
{F.S. : Menciptakan nilai nil pada pHead dan pTail}
{Kamus Tidak Ada}
{Algoritma}
begin
  pHead := nil;
  pTail := nil;
end; // EndProcedure create()

procedure insertAtFront(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
{Kamus Lokal}
var
   pNew : Ptr;
   i    : integer;
{Algoritma}
begin
  new(pNew);
  pNew^.pPrev := nil;

  i := 1;
  gotoxy(15,9);  writeln('------------------------------------------------------------------------------------');
  gotoxy(15,10); writeln('|                              Input Student Data                                  |');
  gotoxy(15,11); writeln('------------------------------------------------------------------------------------');
  gotoxy(15,12); writeln('|  No  |         Student ID         |                Name                  |  GPA  |');
  gotoxy(15,13); writeln('------------------------------------------------------------------------------------');
  gotoxy(15,14); writeln('|      |                            |                                      |       |');
  gotoxy(15,15); writeln('------------------------------------------------------------------------------------');
  gotoxy(17,14); write(i);
  gotoxy(24,14); readln(pNew^.info.id);
  gotoxy(53,14); readln(pNew^.info.name);
  gotoxy(92,14); readln(pNew^.info.gpa);

  if (pHead = nil) then
  begin
    pNew^.pNext := nil;
    pTail := pNew;
  end
  else
  begin
    pNew^.pNext := pHead;
    pHead^.pPrev := pNew;
  end;

  pHead := pNew;
end; // EndProcedure insertAtFront

procedure insertAtBack(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
{Kamus Lokal}
var
   pNew : Ptr;
   i    : integer;
{Algoritma}
begin
  new(pNew);
  pNew^.pNext := nil;

  i := 1;
  gotoxy(15,9);  writeln('------------------------------------------------------------------------------------');
  gotoxy(15,10); writeln('|                              Input Student Data                                  |');
  gotoxy(15,11); writeln('------------------------------------------------------------------------------------');
  gotoxy(15,12); writeln('|  No  |         Student ID         |                Name                  |  GPA  |');
  gotoxy(15,13); writeln('------------------------------------------------------------------------------------');
  gotoxy(15,14); writeln('|      |                            |                                      |       |');
  gotoxy(15,15); writeln('------------------------------------------------------------------------------------');
  gotoxy(17,14); write(i);
  gotoxy(24,14); readln(pNew^.info.id);
  gotoxy(53,14); readln(pNew^.info.name);
  gotoxy(92,14); readln(pNew^.info.gpa);

  if (pHead = nil) then
  begin
    pNew^.pPrev := nil;
    pHead := pNew;
  end
  else
  begin
    pNew^.pPrev := pTail;
    pTail^.pNext := pNew;
  end;

  pTail := pNew;
end; // EndProcedure insertAtBack

{
procedure SisipTengah(var pHead, pTail : Ptr);

begin
     pHelp := pHead;
     found := False;
     gotoxy(15,11); writeln('--------------------------------------');
     gotoxy(15,12); write  ('|  CARI BERDASARKAN INDEX  |          |'); readln(Cari);
     gotoxy(15,13); writeln('--------------------------------------');
     while (not found) and (pHelp <> nil) do
           begin
               if (dataCari = pHelp^.info.Tahun) then
                 begin
                      found := True;
                 end
                 else
                     pHelp := pHelp^.pNext;
           end;

     if (found) then
        begin


        end;
end;
}

procedure showMenu(var select : integer);
{I.S. : }
{F.S. : Menampilkan menu}
{Kamus Tidak Ada}
{Algoritma}
begin
    clrscr;
    gotoxy(50,5);  writeln('-------------------------------------------');
    gotoxy(50,6);  writeln('|       College Student Admission         |');
    gotoxy(50,7);  writeln('-------------------------------------------');
    gotoxy(50,8);  writeln('|  1.  Insert Data                        |');
    gotoxy(50,9);  writeln('|  2.  Delete Data                        |');
    gotoxy(50,10); writeln('|  3.  Search Data                        |');
    gotoxy(50,11); writeln('|  4.  Show Data                          |');
    gotoxy(50,12); writeln('|  5.  Exit                               |');
    gotoxy(50,13); writeln('-------------------------------------------');
    gotoxy(50,14); write('Select  : '); readln(select);
end; // EndProcedure showMenu()

procedure addData(var pHead, pTail : Ptr);
{I.S. : }
{F.S. : }
var
   select : integer;
{ Algoritma }
begin
  gotoxy(50,5);  writeln('-------------------------------------------');
  gotoxy(50,6);  writeln('|         Select insertion method         |');
  gotoxy(50,7);  writeln('-------------------------------------------');
  gotoxy(50,8);  writeln('|  1.  Insert at Front                    |');
  gotoxy(50,9);  writeln('|  2.  Insert at Middle                   |');
  gotoxy(50,10); writeln('|  3.  Insert at Back                     |');
  gotoxy(50,11); writeln('-------------------------------------------');
  gotoxy(50,12); write('Select  : '); readln(select);

  clrscr;
  //mencari berdasarkan judul
  if (select = 1) then
  begin
    insertAtFront(pHead, pTail);
    // write('front'); readln;
  end
  else if (select = 2) then
  begin
    // insertAtBack(pHead, pTail);
    write('middle'); readln;
  end
  else if (select = 3) then
  begin
    insertAtBack(pHead, pTail);
    write('back'); readln;
  end;
end;

procedure showData(pHead : Ptr);
{I.S. : }
{F.S. : }
{Kamus Lokal}
var
   pHelp    : Ptr;
   i, k     : integer;
{Algoritma}
begin
  gotoxy(15,9);  writeln('------------------------------------------------------------------------------------');
  gotoxy(15,10); writeln('|                             Display Student Data                                 |');
  gotoxy(15,11); writeln('------------------------------------------------------------------------------------');
  gotoxy(15,12); writeln('|  No  |         Student ID         |                Name                  |  GPA  |');
  gotoxy(15,13); writeln('------------------------------------------------------------------------------------');

  pHelp := pHead;
  i := 1; k := 13;

  while (pHelp <> nil) do
  begin
    gotoxy(15,k+i); writeln('|      |                            |                                      |       |');
    gotoxy(17,k+i); write(i);
    gotoxy(24,k+i); write(pHelp^.info.id);
    gotoxy(53,k+i); write(pHelp^.info.name);
    gotoxy(92,k+i); write(pHelp^.info.gpa:2:1);

    inc(i);
    pHelp := pHelp^.pNext;
  end;

  gotoxy(15,k+i); writeln('------------------------------------------------------------------------------------');
  readln;
end;

// procedure CariJudul();
// {I.S. : }
// {F.S. : }
// var
//    pHelp    : Ptr;
//    Cari     : string;
//    found   : boolean;

// begin
//      found := False;
//      pHelp := pHead;
//      Cari := upcase(Cari);
//      gotoxy(15,11); writeln('------------------------------------------------------------------------------------------------------');
//      gotoxy(15,12); writeln('|  CARI JUDUL FILM     |                                                                             |');
//      gotoxy(15,13); writeln('------------------------------------------------------------------------------------------------------');
//      gotoxy(34,12); write(''); readln(Cari);

//      while (not found) and (pHelp <> nil) do
//           begin
//               if (Cari = pHelp^.info.Judul) then
//                  found := True
//                  else
//                      pHelp := pHelp^.pNext;
//           end;

//      clrscr;
//      if (found) then
//        begin
//            gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
//            gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
//            gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

//            gotoxy(1,4);   writeln('|');
//            gotoxy(1,4);   writeln('| ',upcase(pHelp^.info.Kode));
//            gotoxy(1,4);   writeln('| ',pHelp^.info.Index,'-',pHelp^.info.Kode);
//            gotoxy(16,4);  writeln('| ',upcase(pHelp^.info.Genre));
//            gotoxy(39,4);  writeln('|  ',upcase(pHelp^.info.Judul));
//            gotoxy(79,4);  writeln('|  ',pHelp^.info.Rating:2:1);
//            gotoxy(88,4);  writeln('| ',pHelp^.info.Tahun);
//            gotoxy(98,4);  writeln('|Rp. ',pHelp^.info.Harga);
//            gotoxy(117,4); writeln('|');

//            gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
//        end
//        else
//            writeln('Data tidak di temukan!');

//        readln;
// end;

// procedure CariGenre();
// {I.S. : }
// {F.S. : }
// var
//    pHelp      : Ptr;
//    dataCari   : string;
//    //found   : boolean;
//    i, j       : integer;

// begin
//      //found := False;
//      pHelp := pHead;
//      gotoxy(15,11); writeln('------------------------------------------------------------------------------------------------------');
//      gotoxy(15,12); writeln('|  CARI GENRE FILM     |                                                                             |');
//      gotoxy(15,13); writeln('------------------------------------------------------------------------------------------------------');
//      gotoxy(34,12); write(''); readln(dataCari);


//      clrscr;
//      //tamplet tampilan Cari Tahun
//      gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
//      gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
//      gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

//      i := 4;
//      j := 5;
//      while (pHelp <> nil)do //and (not found) do
//           begin
//               if (dataCari = pHelp^.info.Genre) then
//                  begin
//                       //found := True
//                       gotoxy(1,i);   writeln('|');
//                       gotoxy(1,i);   writeln('| ',pHelp^.info.Index,'-',pHelp^.info.Kode);
//                       gotoxy(1,i);   writeln('| ',upcase(pHelp^.info.Kode));
//                       gotoxy(16,i);  writeln('| ',upcase(pHelp^.info.Genre));
//                       gotoxy(39,i);  writeln('|  ',upcase(pHelp^.info.Judul));
//                       gotoxy(79,i);  writeln('|  ',pHelp^.info.Rating:2:1);
//                       gotoxy(88,i);  writeln('| ',pHelp^.info.Tahun);
//                       gotoxy(98,i);  writeln('|Rp. ',pHelp^.info.Harga);
//                       gotoxy(117,i); writeln('|');

//                       i := i+1;
//                       j := j+1;
//                       pHelp := pHelp^.pNext;
//                  end
//                  else
//                      pHelp := pHelp^.pNext;
//           end;

//       //penutup tamplet tampilan Cari Tahun
//       gotoxy(1,j);  writeln('---------------------------------------------------------------------------------------------------------------------');

//      {
//      if (found) then
//        begin
//            gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
//            gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
//            gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

//            gotoxy(1,4);   writeln('|');
//            gotoxy(16,4);  writeln('| ',upcase(pHelp^.info.Genre));
//            gotoxy(39,4);  writeln('|  ',upcase(pHelp^.info.Judul));
//            gotoxy(79,4);  writeln('|  ',pHelp^.info.Rating:2:1);
//            gotoxy(88,4);  writeln('| ',pHelp^.info.Tahun);
//            gotoxy(98,4);  writeln('|Rp. ',pHelp^.info.Harga);
//            gotoxy(117,4); writeln('|');

//            gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
//        end
//        else
//            writeln('Data tidak di temukan!');

//         }
//        readln;
// end;

// procedure CariTahun();
// {I.S. : }
// {F.S. : }
// var
//    pHelp    : Ptr;
//    dataCari : integer;
//    //found   : boolean;
//    i, j     : integer;

// begin
//      //found := False;
//      pHelp := pHead;
//      gotoxy(15,11); writeln('------------------------------------------------------------------------------------------------------');
//      gotoxy(15,12); writeln('|  CARI TAHUN FILM     |                                                                             |');
//      gotoxy(15,13); writeln('------------------------------------------------------------------------------------------------------');
//      gotoxy(34,12); write(''); readln(dataCari);

//      clrscr;
//      //tamplet tampilan Cari Tahun
//      gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
//      gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
//      gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

//      i := 4;
//      j := 5;
//      while (pHelp <> nil)do //and (not found) do
//           begin
//               if (dataCari = pHelp^.info.Tahun) then
//                  begin
//                       //found := True
//                       gotoxy(1,i);   writeln('|');
//                       gotoxy(1,i);   writeln('| ',pHelp^.info.Index,'-',pHelp^.info.Kode);
//                       gotoxy(1,i);   writeln('| ',upcase(pHelp^.info.Kode));
//                       gotoxy(16,i);  writeln('| ',upcase(pHelp^.info.Genre));
//                       gotoxy(39,i);  writeln('|  ',upcase(pHelp^.info.Judul));
//                       gotoxy(79,i);  writeln('|  ',pHelp^.info.Rating:2:1);
//                       gotoxy(88,i);  writeln('| ',pHelp^.info.Tahun);
//                       gotoxy(98,i);  writeln('|Rp. ',pHelp^.info.Harga);
//                       gotoxy(117,i); writeln('|');

//                       i := i+1;
//                       j := j+1;
//                       pHelp := pHelp^.pNext;
//                  end
//                  else
//                      pHelp := pHelp^.pNext;
//           end;

//       //penutup tamplet tampilan Cari Tahun
//       gotoxy(1,j);  writeln('---------------------------------------------------------------------------------------------------------------------');

//      {
//      if (found) then
//        begin
//            gotoxy(1,1);  writeln('---------------------------------------------------------------------------------------------------------------------');
//            gotoxy(1,2);  writeln('|     KODE     |        GENRE         |                JUDUL                  | RATING |  TAHUN  |       HARGA      |');
//            gotoxy(1,3);  writeln('---------------------------------------------------------------------------------------------------------------------');

//            gotoxy(1,4);   writeln('|');
//            gotoxy(16,4);  writeln('| ',upcase(pHelp^.info.Genre));
//            gotoxy(39,4);  writeln('|  ',upcase(pHelp^.info.Judul));
//            gotoxy(79,4);  writeln('|  ',pHelp^.info.Rating:2:1);
//            gotoxy(88,4);  writeln('| ',pHelp^.info.Tahun);
//            gotoxy(98,4);  writeln('|Rp. ',pHelp^.info.Harga);
//            gotoxy(117,4); writeln('|');

//            gotoxy(1,5);  writeln('---------------------------------------------------------------------------------------------------------------------');
//        end
//        else
//            writeln('Data tidak di temukan!');

//         }
//        readln;
// end;

// procedure MenuPencarian();
// {I.S. : }
// {F.S. :}
// var
//    select  : integer;

// begin
//      gotoxy(50,5);  writeln('-------------------------------------------');
//      gotoxy(50,6);  writeln('|             PILIH PENCARIAN             |');
//      gotoxy(50,7);  writeln('-------------------------------------------');
//      gotoxy(50,8);  writeln('|  1  |  MENCARI BERDASARKAN JUDUL        |');
//      gotoxy(50,9);  writeln('|  2  |  MENCARI BERDASARKAN GENRE        |');
//      gotoxy(50,15); writeln('|  3  |  MENCARI BERDASARKAN TAHUN        |');
//      gotoxy(50,11); writeln('-------------------------------------------');
//      gotoxy(50,13); write('Select  : '); readln(select);

//      clrscr;
//      //mencari berdasarkan judul
//      if (select = 1) then
//         CariJudul()
//         else if (select = 2) then
//                 CariGenre()
//                 else if (select = 3) then
//                        CariTahun()
//                        else
//                            gotoxy(50,13); writeln('Data yang anda masukan salah!');

// end;

//pengurutan berdasarkan selection sort (minimal)
// procedure UrutJudul(var pHead, pTail : Ptr);
// {I.S. : }
// {F.S. : }
// var
//     j, i, min, temp : Ptr;

// begin
//      i := pHead;
//      while (i <> pTail) do
//            begin
//                min^.info := i^.info;
//                j := i^.pNext;
//                while (j <> nil) do
//                      begin
//                          if (i^.info.Judul > j^.info.Judul) then
//                             min^.info :=  j
//                             else
//                                 j := j^.pNext
//                      end;
//                i := i^.pNext;
//             end;

//       min := temp;
//       i := j;
//       j := i;

//       showData();
//       readln;
// end;

// procedure Pengurutan();
// {I.S. : }
// {F.S. :}
// var
//    select  : integer;

// begin
//      gotoxy(50,5);  writeln('-------------------------------------------');
//      gotoxy(50,6);  writeln('|             PILIH PENGURUTAN            |');
//      gotoxy(50,7);  writeln('-------------------------------------------');
//      gotoxy(50,8);  writeln('|  1  |  PENGURUTAN BERDASARKAN JUDUL     |');
//      gotoxy(50,9);  writeln('|  2  |  PENGURUTAN BERDASARKAN GENRE     |');
//      gotoxy(50,15); writeln('|  3  |  PENGURUTAN BERDASARKAN RATING    |');
//      gotoxy(50,11); writeln('|  4  |  PENGURUTAN BERDASARKAN TAHUN     |');
//      gotoxy(50,12); writeln('-------------------------------------------');
//      gotoxy(50,14); write('Select  : '); readln(select);

//      clrscr;
//      //mencari berdasarkan judul
//      if (select = 1) then
//         UrutJudul(pHead, pTail)
//         else if (select = 2) then
//                 UrutGenre(pHead, pTail)
//                 else if (select = 3) then
//                        UrutRating(pHead, pTail)
//                        else if (select = 4) then
//                                UrutTahun(pHead, pTail)
//                                else
//                                gotoxy(50,14); writeln('Data yang anda masukan salah!');
// end;

// procedure Penghancuran(var pHead, pTail : Ptr);
// {I.S. : }
// {F.S. : }
// var
//    Phapus : Ptr;

// begin
//      Phapus := pHead;
//      while (Phapus <> nil) do
//      begin
//          pHead := pHead^.pNext;
//          Dispose(Phapus);
//          Phapus := pHead;
//      end; //EndWhile
//      pTail := nil;
// end;

{ Algoritma Utama }
begin
  create(pHead, pTail);

  repeat
    showMenu(select);
    clrscr;
    if (select = 1) then
    begin
      addData(pHead, pTail);
    end
    else if (select = 2) then
    begin
      // Pengurutan();
    end
    else if (select = 3) then
    begin
      // MenuPencarian()
    end
    else if (select = 4) then
    begin
      showData(pHead);
    end;
  until (select <= 0) or (select > 4);

  // Penghancuran(pHead, pTail);
  // if (pHead = nil) then
  // begin
  //   writeln('Data Sudah Kosong!');
  // end;
end.