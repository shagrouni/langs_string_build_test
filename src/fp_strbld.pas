//fpc fp_strbld.pas -v0 -o..\exe\fp_strbld.exe
program fpas_stress;
{$MODE OBJFPC}{$H+} 
uses
  SysUtils, DateUtils;

const file_path = 'out/free_pascal_output.txt';

procedure test(num: int64);
var
  f: TextFile;
  i, len: Int64;
  s: string;
  start, finish: TDateTime;
  elapsed:TDateTime;
  sb: TStringBuilder;
begin
  
  write('  FPas');
  start := Now;

  sb := TStringBuilder.Create('');
  try
    try
    for i := 1 to num do
      sb.Append(' P ' + IntToStr(i));
    except
      on E: Exception do
      begin
        WriteLn(' Error, stopped in ', i) ;
      end;
    end;
    finish := Now;
    elapsed := finish - start;
    len := sb.Length;
    WriteLn('  ', FormatDateTime('nn:ss:zzz', elapsed), '  Iter ', num, ' Len= ', len );
    AssignFile(f, file_path);
    Rewrite(f);
    
     Write(f, sb.ToString); 
      
  finally
    sb.Free;
    CloseFile(f);
  end;

end;

var
   num: int64;
begin
  if ParamCount <> 1 then
  begin
    Writeln('Usage: ', ExtractFileName(ParamStr(0)), ' <num>');
    Halt(1);
  end;
  num := StrToInt64(ParamStr(1));
  test(num);


end.

