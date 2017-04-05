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
  head, tail : point;
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
end;

// procedure addAtLast(var head, tail : point; elem : string);
// var
//   temp : point;
// begin
//   new(temp);
//   temp^.next := nil;
//   temp^.info.nim := elem;

//   if (head = nil) then
//   begin
//     temp^.prev := nil;
//     head := temp;
//   end
//   else
//   begin
//     temp^.next := head;
//     head^.prev := temp;
//   end;

//   tail := temp;
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

begin
  
  repeat
    addData(elem);
    addAtFirst(head, tail, elem);
    write('Masukkan lagi? (Y/T): ');
    repeat
      again := upCase(readkey);
    until again in ['Y', 'T'];
    writeln;
  until (again = 'T');

  // destroy(head, tail);
  // if (head = nil) then
  // begin
  //   writeln('Data kosong!');
  //   readln;
  // end;
end.