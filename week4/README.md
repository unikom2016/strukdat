List 1, telah terdefinisi, unsorted
List 2, salin data ke list ini, dan sambil disortir

List 1:
[3], [2], [4], [7], [5]
                    tmp    
List 2:
[3], 
[2], [3]
 h    t
[2], [3], [4]
 h         t
[2], [3], [4], [7]
 h              t
[2], [3], [4], [7]
 h              t
               tmp2
[2], [3], [4], [5], [7] <- final

procedure create(i/o head, tail: pointer)
  head, tail <- nil
endprocedure

procedure insertAtFront(input elem; i/o head, tail: pointer)
{Kamus}
  temp : pointer
{Algoritma}
  alloc(temp)
  temp^.info < elem  
  if (head = nil) then
    tail <- temp
  else
    temp^.next <- head
  endif
  head <- temp
endprocedure

procedure insertAtMid(input elem; i/o head, tail: pointer)
endprocedure

procedure insertAtBack(input elem; i/o head, tail: pointer)
{Kamus}
  temp : pointer
{Algoritma}
  alloc(temp)
  temp^.info <- elem
  temp^.next <- nil
  if (head = nil) then
    head <- tail
  else
    tail^.next <- temp
  endif
  tail <- temp
endprocedure

procedure copyList(i/o head1, tail1, head2, tail2: pointer)
{I.S.: Copy }
{F.S.:}
{Kamus}
  temp, temp2 : pointer
  {Prototype}
  insertAtFront(input elem; i/o head, tail: pointer)
  insertAtMid(input elem; i/o head, tail: pointer)
  insertAtBack(input elem; i/o head, tail: pointer)
{Algoritma}
  create(head2, tail2)
  temp <- head1
  head2 <- temp
  while (temp != nil) do
    if (temp^.info < head2^.info) then
      insertAtFront(temp^.info, head2, tail2) // elaborate more
    else if (temp^.info > tail2^.info) then
      insertAtBack(temp^.info, head2, tail2) // elaborate more
    else
      insertAtMid(temp^.info, head2, tail2) // elaborate more
    endif
    temp <- temp^.next
  endwhile
endprocedure