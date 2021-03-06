program radix_sort;

const
  maks = 7;
  total = 10;

type
  arr_angka = array[0..maks] of longint;
  arr_total = array[0..total] of longint;

var
  i         : longint;
  arr_data  : arr_angka;
  arr_temp  : arr_angka;
  max       : longint;
  n         : longint;

  // create array
  procedure createArray(var data: arr_total);
  var
    i: integer;
  begin
    for i := 0 to total do
    begin
      data[i] := 0;
    end;
  end;

  procedure createArray(var data: arr_angka);
  var
    i: integer;
  begin
    for i := 0 to maks do
    begin
      data[i] := 0;
    end;
  end;

  function getMax(arr: arr_angka; n: longint): longint;
  var
    i, max: longint;
  begin
      writeln;
      writeln('=== MAXIMUM FUNCTION ===');
      max := arr[0];
      for i := 1 to (n - 1) do
      begin
          if (arr[i] > max) then
          begin
            max := arr[i]; 
          end;
      end;

      getMax := max;
      writeln('maximum: ', max);
  end;

  function getMin(arr: arr_angka; n: longint): longint;
  var
    i, min: longint;
  begin
      writeln;
      writeln('=== MINIMUM FUNCTION ===');
      min := arr[0];
      for i := 1 to (n - 1) do
      begin
          if (arr[i] < min) then
          begin
            min := arr[i]; 
          end;
      end;

      getMin := min;
      writeln('minimum: ', min);
  end;
{/* 
 * count sort of arr[]
 */}
procedure countSort(var arr: arr_angka; n: longint; exp: longint);
var
  output: arr_angka;
  count : arr_total;
  i     : longint;
  temp  : longint;
begin
    writeln;
    writeln('=== COUNT SORT PROCEDURE ===');
    i := 0;
    // count[10] := 0;
    createArray(count);
    createArray(output);
    for i := 0 to (n - 1) do
    begin
      writeln('data :', arr[i]);
      writeln('exp: ', exp);
      // count[ (arr[i]/exp)%10 ]++;
      inc( count[ ((arr[i] div exp) mod 10) ] );
      writeln('count first loop: ', count[i]);
    end;

    // for (i := 1; i < 10; i++)
    // greater than
    for i := 1 to (total - 1) do
    begin
      writeln('count: ', count[i]);
      count[i] := count[i] + count[i - 1];
    end;
    
    // for (i := n - 1; i >:= 0; i--)
    // greater than
    for i := (n - 1) downto 0 do
    begin
        output[ count[ ((arr[i] div exp) mod 10) ] - 1 ] := arr[i];
        dec(count[ ((arr[i] div exp) mod 10) ]);
    end;
    
    // for (i := 0; i < n; i++)
    for i := 0 to (n - 1) do
    begin
        arr[i] := output[i];
    end;
end;

{/* 
 * sorts arr[] of size n using Radix Sort
 */ }
procedure radixsort(var arr: arr_angka; n: longint);
var
  m, exp, cacah: longint;
begin
    writeln;
    writeln('=== START RADIX SORT PROCEDURE ===');
    exp := 1;
    m := getMax(arr, n);
    // m := getMin(arr, n);
    // for (int exp := 1; m / exp > 0; exp *:= 10)
    writeln;
    writeln('m: ', m);
    while ((m div exp) > 0) do
    begin
    // repeat
        exp := exp * 10;
        writeln;
        writeln('m / exp: ', (m div exp));
        writeln('exp: ', exp);
        countSort(arr, n, exp);
    end;
    // until ((m div exp) > 0);
    writeln('=== END RADIX SORT PROCEDURE ===');
    writeln;
end;

function reverseSort(arr: arr_angka; n: integer): arr_angka;
var
  i         : integer;
  arr_temp  : arr_angka;
begin
  createArray(arr_temp);
  for i := 1 to n do
  begin
    arr_temp[i - 1] := arr[n - i];
    // writeln(arr_temp[i]);
  end;
  reverseSort := arr_temp;
end;
 
{/*
 * Main
 */}
begin
    n := maks;
    {int arr[] := 170, 45, 75, 90, 802, 24, 2, 66}
    createArray(arr_data);
    arr_data[0] := 170;
    arr_data[1] := 45;
    arr_data[2] := 75;
    arr_data[3] := 90;
    arr_data[4] := 802;
    arr_data[5] := 24;
    arr_data[6] := 2;
    arr_data[7] := 66;
    
    arr_temp := arr_data;

    n := sizeof(arr_data) div sizeof(arr_data[0]);
    radixsort(arr_data, n);
    
    writeln;

    write('unsorted: ');
    for i := 0 to (n - 1) do
    begin
      write(arr_temp[i], ' ');
    end;

    writeln;

    arr_data := reverseSort(arr_data, n);
    write('sorted  : ');
    for i := 0 to (n - 1) do
    begin
      write(arr_data[i], ' ');
    end;
end.