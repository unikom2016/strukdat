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
  again      : char; // to hold when user needs to another data

{ Create }
procedure create(var head, tail : point);
begin
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
end;

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
    temp^.next := nil;
    tail := temp;
    write('Masukkan Nama  : '); readln(temp^.info.nama);
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

    temp^.next := head;
    head^.prev := temp;
  end;

  head := temp;
end; // addAtFirst

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

procedure sort(head1, tail1: point; var head2, tail2: point);
{I.S.: Copy previous list }
{F.S.: Paste the previous list with sorted data }
{Kamus}
var
  temp : point;
{Algoritma}
begin
  new(temp);
  temp := head1;
  while (temp <> nil) do
  begin
    if (head2 = nil) then
    begin
      head2 := temp; tail2 := temp;
    end else
    begin
      if (temp^.info.nim < head2^.info.nim) then
      begin
        addAtFirst(head2, tail2, temp^.info.nim); // elaborate more
        // writeln('insertAtFront ', temp^.info.nim, ' - ', head2^.info.nim);
        // readln;
      end else if (temp^.info.nim > tail2^.info.nim) then
      begin
        addAtLast(head2, tail2, temp^.info.nim); // elaborate more
        // writeln('insertAtBack ', temp^.info.nim, ' - ', head2^.info.nim);
        // readln;
      end else
      begin
        addAtMid(head2, tail2, temp^.info.nim); // elaborate more
        // writeln('insertAtMid ', temp^.info.nim, ' - ', head2^.info.nim);
        // readln;
      end;
    end;
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

  // sort list
  sort(head1, tail1, head2, tail2);
  show(head2, tail2);

  // destroy(head, tail);
  // if (head = nil) then
  // begin
  //   writeln('Data kosong!');
  //   readln;
  // end;
end.