{Judul}
program quiz_copy_linkedlist;

{Kamus Global}
type
  ptr = ^node;
  node = record
    info : integer;
    next : ptr;
  end;

var 
  head1, head2, tail1, tail2 : ptr;
  
procedure create(var head, tail: ptr);
{I.S.:}
{F.S.:}
{Kamus}
{Algoritma}
begin
  head := nil; tail := nil;
end;

procedure insertAtFront(elem: integer; var head, tail: ptr);
{I.S.:}
{F.S.:}
{Kamus}
var
  temp : ptr;
{Algoritma}
begin
  new(temp);
  temp^.info := elem;
  if (head = nil) then
  begin
    tail := temp;
  end else
  begin
    temp^.next := head;
  end;
  head := temp;
end;

// procedure insertAtMid(elem, elemToInsert: integer; var head, tail: ptr);
procedure insertAtMid(elem: integer; var head, tail: ptr);
{I.S.:}
{F.S.:}
{Kamus}
var
  temp, change : ptr;
{Algoritma}
begin
  new(change); new(temp);
  change^.info := elem;
  change^.next := nil;
  temp := head;
  while (temp^.next <> tail) and (change^.info > temp^.info) do
  begin
    write(temp^.info, ' ');
    temp := temp^.next;
  end;
  change^.next := temp^.next;
  temp^.next := change;
  writeln;
end;

procedure insertAtBack(elem: integer; var head, tail: ptr);
{I.S.:}
{F.S.:}
{Kamus}
var
  temp : ptr;
{Algoritma}
begin
  new(temp);
  temp^.info := elem;
  temp^.next := nil;
  if (head = nil) then
  begin
    head := temp;
  end else
  begin
    tail^.next := temp;
  end;
  tail := temp;
end;

procedure destroy(var head, tail: ptr);
{I.S.:}
{F.S.:}
{Kamus}
{Algoritma}
begin
  head := nil; tail := nil;
end;

procedure show(head, tail: ptr);
{I.S.:}
{F.S.:}
{Kamus}
var
  temp : ptr;
{Algoritma}
begin
  temp := head;
  while (temp <> nil) do
  begin
    write(temp^.info, ' ');
    temp := temp^.next;
  end;
  writeln;
end;

procedure copyList(head1, tail1: ptr; var head2, tail2: ptr);
{I.S.: Copy }
{F.S.:}
{Kamus}
var
  temp : ptr;
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
      if (temp^.info < head2^.info) then
      begin
        insertAtFront(temp^.info, head2, tail2); // elaborate more
        writeln('insertAtFront ', temp^.info, ' - ', head2^.info);
        readln;
      end else if (temp^.info > tail2^.info) then
      begin
        insertAtBack(temp^.info, head2, tail2); // elaborate more
        writeln('insertAtBack ', temp^.info, ' - ', head2^.info);
        readln;
      end else
      begin
        insertAtMid(temp^.info, head2, tail2); // elaborate more
        writeln('insertAtMid ', temp^.info, ' - ', head2^.info);
        readln;
      end;
    end;
    temp := temp^.next;
  end;
end;

{Algoritma Utama}
begin
  // [3], [2], [4], [7], [5]
  create(head1, tail1);
  insertAtFront(5, head1, tail1);
  insertAtFront(7, head1, tail1);
  insertAtFront(4, head1, tail1);
  insertAtFront(2, head1, tail1);
  insertAtFront(3, head1, tail1);
  show(head1, tail1);

  create(head2, tail2);
  copyList(head1, tail1, head2, tail2);
  show(head2, tail2);
end.