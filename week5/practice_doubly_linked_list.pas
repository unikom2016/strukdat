program practice_dllist;

uses
  crt;

type
  point = ^data;

  mahasiswa = record
    nim, nama : string;
  end;

  data = record
    info       : mahasiswa;
    prev, next : point;
  end;

{ Kamus Global }
var
  head1, tail1, head2, tail2 : point;
  elem       : string; // as nim temporary
  again      : char; // to hold user input for more data
  datahapus  : boolean;

{ Create }
procedure create(var head, tail : point);
begin
  new(head); new(tail);
  head := nil;
  tail := nil;

end;

{ Addition }
// procedure addData(var dmhs : mahasiswa);
procedure addData(var elem : string);
begin
  // write('Masukkan NIM   : '); readln(dmhs.nim);
  // write('Masukkan Nama  : '); readln(dmhs.nama);
  write('Masukkan NIM   : '); readln(elem);
end; // addData

{ Insertion }
// procedure addAtFirst(var head, tail : point; elem : mahasiswa);
procedure addAtFirst(var head, tail : point; elem : string);
var
  temp, temp2 : point;
  found       : boolean;
begin
  new(temp);
  temp^.prev := nil;
  temp^.info.nim := elem;
  // buat insert name di sini?
  // temp^.info.nim := elem;
  // write('masukkan nama'); readln(temp^.info.nama);

  if (head = nil) then
  begin
    write('Masukkan Nama  : '); readln(temp^.info.nama);
    temp^.next := nil;
    tail := temp;
  end
  else
  begin
    temp2 := head;
    found := false;
    while (not found) and (temp2 <> nil) do
    begin
      if (temp2^.info.nim = temp^.info.nim) then
      begin
        found := true;
      end
      else
      begin
        temp2 := temp2^.next;
      end;
    end;

    if (found) then
    begin
      writeln('Maaf NIM sudah terdaftar!');
    end
    else
    begin
      write('Masukkan Nama  : '); readln(temp^.info.nama);
    end;

    temp^.next := head;
    head^.prev := temp;
  end;

  head := temp;
end; // addAtFirst

procedure addAtMid(var head, tail: point; elem: string);
{I.S.:}
{F.S.:}
{Kamus}
var
  temp, change : point;
{Algoritma}
begin
  new(change); new(temp);
  
  change^.info.nim := elem;
  change^.prev := nil;
  change^.next := nil;

  temp := head;
  
  while (temp^.next <> tail) and (change^.info.nim > temp^.info.nim) do
  begin
    write(temp^.info.nim, ' ');
    temp := temp^.next;
  end;
  
  change^.prev := temp;
  change^.next := temp^.next;
  temp^.next^.prev := change;
  temp^.next := change;
  writeln;
end; // addAtMid

procedure addAtLast(var head, tail : point; elem : string);
var
  temp, temp2 : point;
  found       : boolean;
begin
  new(temp);
  temp^.next := nil;
  temp^.info.nim := elem;
  
  if (head = nil) then
  begin
    temp^.prev := nil;
    head := temp;
    write('Masukkan Nama  : '); readln(temp^.info.nama);
  end
  else
  begin
    new(temp2);
    temp2 := head;
    found := false;
    while (not found) and (temp2 <> nil) do
    begin
      if (temp2^.info.nim = temp^.info.nim) then
      begin
        found := true;
      end
      else
      begin
        temp2 := temp^.next;
      end;
    end;

    if (found) then
    begin
      writeln('Maaf NIM sudah terdaftar!');
    end
    else
    begin
      write('Masukkan Nama  : '); readln(temp^.info.nama);
    end;

    temp^.prev := tail;
    tail^.next := temp;
  end;

  tail := temp;
end; // addAtLast

procedure sort(head1, tail1: point; var head2, tail2: point);
{I.S.: Copy previous list }
{F.S.: Paste the previous list with sorted data }
{Kamus}
var
  temp, change, change2 : point;
{Algoritma}
begin
  new(temp); new(change); new(change2);

  temp := head1;
  create(head2, tail2);
  
  while (temp <> nil) do
  begin

    change := temp;

    if (head2 = nil) then
    begin
      change^.next := nil;
      change^.prev := nil;
      head2 := change; tail2 := change;
      write('head2 = empty ', change^.info.nim, ' - ', head2^.info.nim); readln;
    end // head2 = nil
    else
    begin

      write('head2 != empty'); readln;

      if (temp^.info.nim < head2^.info.nim) then
      begin

        // addAtFirst(head2, tail2, temp^.info.nim); // elaborate more
        // change^.prev := nil;
        // change^.next := head2;
        // head2^.prev := change;
        // head2 := change;
        write('insertAtFront ', change^.info.nim, ' - ', head2^.info.nim);
        readln;

      end // addAtFirst
      else if (temp^.info.nim > tail2^.info.nim) then
      begin

        // addAtLast(head2, tail2, temp^.info.nim); // elaborate more
        // change^.prev := tail2;
        // change^.next := nil;
        // tail2^.next := change;
        // tail2 := change;
        write('insertAtBack ', change^.info.nim, ' - ', head2^.info.nim);
        readln;

      end; // addAtLast
    //   else
    //   begin
    //     // addAtMid(head2, tail2, temp^.info.nim); // elaborate more
    //     // change2 := head2;

    //     // while (change2 <> nil) and (change2^.info.nim < change^.info.nim) do
    //     // begin
    //     //   change2 := change2^.next;
    //     // end;
        
    //     // change^.prev := change2^.prev;
    //     // change^.next := change2;
    //     // change2^.prev^.next := change;
    //     // change2^.prev := change;
    //     write('insertAtMid ', change^.info.nim, ' - ', head2^.info.nim);
    //     readln;

    //   end; // addAtMid
    end; // head2 <> nil

    write('temp : ', temp^.info.nim); readln;
    temp := temp^.next;
  end;
end;

procedure show(head, tail : point);
var
  temp : point;
begin
  temp := head;
  while (temp <> nil) do
  begin
    writeln('NIM  : ', temp^.info.nim);
    writeln('Nama : ', temp^.info.nama);
    temp := temp^.next;
  end;
end;

// procedure search(head, tail : point);
function search(head, tail : point): boolean;
var
  temp  : point;
  nim   : string;
  found : boolean;
begin
  write('Masukkan NIM yang dicari : '); readln(nim);
  temp := head;
  found := false;
  while (not found) and (temp <> nil) do
  begin
    if (temp^.info.nim = nim) then
    begin
      // writeln('executed true?');
      found := true;
    end
    else
    begin
      // writeln('executed false?');
      temp := temp^.next;  
    end;
  end;

  if (found) then
  begin
    writeln('Data ditemukan: ', found);
  end
  else
  begin
    writeln('Data ditemukan: ', found);
  end;

  search := found;
end;

// procedure deleteAtFirst(head, tail : point);
// begin
  
// end;

{ Destroy }
procedure destroy(var head, tail : point);
var
  temp : point;
begin
  new(temp); temp := head;
  while (temp <> nil) do
  begin
    head := head^.next;
    dispose(temp);
    temp := head;
  end;
  tail := nil;
end;

{ Start Menu Display }

{ End Menu Display }

begin
  
  repeat
    addData(elem);
    addAtFirst(head1, tail1, elem);
    write('Masukkan lagi? (Y/T): ');
    repeat
      again := upCase(readkey);
    until again in ['Y', 'T'];
    writeln;
  until (again = 'T');

  clrscr;
  show(head1, tail1);
  readln;
  writeln;

  // sort list
  sort(head1, tail1, head2, tail2);
  show(head2, tail2);


  // datahapus := search(head2, tail2);
  // if (datahapus) then
  // begin
  //   deleteAtFirst()
  // end;
  // hapus

  // destroy(head, tail);
  // if (head = nil) then
  // begin
  //   writeln('Data kosong!');
  //   readln;
  // end;
end.