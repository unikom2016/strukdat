program practice_dllist;

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
  elem     : string; // as nim temporary
  again      : char; // to hold when user needs to another data


{ Create }
procedure create(var head, tail : point);
begin
  head := nil;
  tail := nil;
end;

{ Addition }
procedure addData(var elem : string)
begin
  write('Masukkan NIM   : '); readln(elem);
  // write('Masukkan Nama  : '); readln(elem);
end;

{ Insertion }
procedure addAtFirst()
begin
  new(temp);
  temp^.prev := nil;
  temp^.info := dmhs;
  temp^.next := head;

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
    write('Masukkan lagi? (Y/T)'); readln(again);
  until (upcase(again) = 'T');

  destroy(head, tail);
  if (head = nil) then
  begin
    writeln('Data kosong!');
    readln;
  end;
end.