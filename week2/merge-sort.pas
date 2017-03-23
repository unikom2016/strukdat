program merge_sort;

const
  max  = 10;

type
  arr_number = array[0..max] of integer;
  arr_total  = array[0..max] of integer;

var
  data      : arr_number;
  data_size : integer;

procedure createArray(var data: arr_number; n: integer);
var
  i : integer;
begin
  for i := 0 to n do
  begin
    data[i] := 0;
  end;
end;

{ Pascal program for Merge Sort }
// Merges two subarrays of data[].
// First subarray is data[l..m]
// Second subarray is data[m+1..r]
procedure merge(var data: arr_number; l, m, r: integer);
var
  i, j, k       : integer;
  n1, n2        : integer;
  left, right   : arr_number;
begin
    n1 := m - l + 1;
    n2 := r - m;

    { create temp arrays }
    // createArray(L);
    // createArray(R);
    left[n1] := 0;
    right[n2] := 0;

    { Copy data to temp arrays left[] and right[] }
    for i := 0 to (n1 - 1) do
    begin
        left[i] := data[l + i];
    end;

    for j := 0 to (n2 - 1) do
    begin
        right[j] := data[m + 1+ j];
    end;

    { Merge the temp arrays back into data[l..r]}
    i := 0; // Initial index of first subarray
    j := 0; // Initial index of second subarray
    k := l; // Initial index of merged subarray
    while ((i < n1) and (j < n2)) do
    begin
        if (left[i] <= right[j]) then
        begin
          data[k] := left[i];
          inc(i);
        end
        else
        begin
            data[k] := right[j];
            inc(j);
        end;
        inc(k);
    end;

    { Copy the remaining elements of left[], if there
       are any }
    while (i < n1) do
    begin
        data[k] := left[i];
        inc(i);
        inc(k);
    end;

    { Copy the remaining elements of right[], if there
       are any }
    while (j < n2) do
    begin
        data[k] := right[j];
        inc(j);
        inc(k);
    end;
end;

{ l is for left index and r is right index of the
   sub-array of arr to be sorted }
procedure mergeSort(var arr: arr_number; l, r: integer);
var
  m   : integer;
begin
    if (l < r) then
    begin
        // Same as (l+r)/2, but avoids overflow for
        // large l and h
        m := l + (r - l) div 2;

        // Sort first and second halves
        mergeSort(arr, l, m);
        mergeSort(arr, m+1, r);

        merge(arr, l, m, r);
    end;
end;

{ UTILITY FUNCTIONS }
{ Function to print an array }
procedure printArray(A: arr_number; size: integer);
var
  i   : integer;
begin
    for i := 0 to (size - 1) do
    begin
        write(A[i], ' ');
    end;
    writeln;
end;

{ Driver program to test above functions }
begin
    createArray(data, 6);
    data[0] := 120; // , 11, 13, 5, 6, 7};
    data[1] := 1;
    data[2] := 13;
    data[3] := 52;
    data[4] := 6001;
    data[5] := 70;
    data_size := sizeof(data) div sizeof(data[0]);

    writeln('Given array is :');
    printArray(data, data_size);

    mergeSort(data, 0, data_size - 1);

    writeln;
    writeln('Sorted arraay is :');
    printArray(data, data_size);
end.