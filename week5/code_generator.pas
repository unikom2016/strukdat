program code_generator;

var
  genre, code : string;
  i           : integer;

begin
  Write('Masukkan genre: '); Readln(genre);
  for i := 1 to Length(genre) do
  begin
    // write(genre[i], '; ');
    if (i >= (Length(genre) - 1)) then
    begin
      code := code + genre[i]; // string <- array of char
    end;
  end;

  Writeln('code succesfully generated: ', code, '-randomthings');
end.