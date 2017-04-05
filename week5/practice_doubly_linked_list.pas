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
  elemen     : string; // as nim temporary


{ Create }
procedure create(var head, tail : point);
begin
  head := nil;
  tail := nil;
end;


{ Destroy }
procedure destroy(var head, tail : point);
begin
  head := nil;
  tail := nil;
end;

begin
  
end.