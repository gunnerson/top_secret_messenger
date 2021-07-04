unit TSMU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Image1: TImage;
    Bevel1: TBevel;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    RadioButton1: TRadioButton;
    Label9: TLabel;
    RadioButton2: TRadioButton;
    Label10: TLabel;
    Label11: TLabel;
    OpenDialog2: TOpenDialog;
    ProgressBar1: TProgressBar;
    Bevel3: TBevel;
    Bevel4: TBevel;
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
  private
  public
    procedure UpdateInfo;
  end;

  TBuf = array[0..$FFFFFF] of Byte;

const
  pn = 'Top Secret Messenger v2.0';

var
  Form1: TForm1;
  sf, df, ef: String;
  ms: Cardinal = 0;
  sfen: Boolean = False;
  sfds: Cardinal = 0;
  sfdt: Cardinal = 0;
  sfpk: Boolean = False;
  em: Boolean = False;
  bs, efs: Cardinal;
  c1, c2: Byte;
  prg: Integer;

implementation

{$R *.dfm}

function GetBMPHI(fin: String; var bmph: BITMAPFILEHEADER; var bmpi: BITMAPINFO): Boolean;
var
  f: Integer;
  sz: Cardinal;
begin
  Result := False;
  f := FileOpen(fin, fmOpenRead);
  if f < 0 then
    Exit;
  sz := FileSeek(f, 0, 2);
  FileSeek(f, 0, 0);
  if sz < 86 then
  begin
    FileClose(f);
    Exit;
  end;
  bmpi.bmiHeader.biSize := 40;
  FileRead(f, bmph, SizeOf(bmph));
  FileRead(f, bmpi.bmiHeader, 40);
  if (bmph.bfType <> $4D42) or (bmpi.bmiHeader.biPlanes <> 1) or (bmpi.bmiHeader.biBitCount <> 24) then
  begin
    FileClose(f);
    Exit;
  end;
  FileClose(f);
  Result := True;
end;

function GetEDSize(fin: String): Cardinal;
var
  bh: BITMAPFILEHEADER;
  bi: BITMAPINFO;
  f: Integer;
  buf: Pointer;
  n: Byte;
begin
  Result := 0;
  if not GetBMPHI(fin, bh, bi) then
    Exit;
  GetMem(buf, 32);
  f := FileOpen(fin, fmOpenRead);
  FileSeek(f, 54, 0);
  FileRead(f, buf^, 32);
  for n := 0 to 31 do
  begin
    Result := Result shl 1;
    Result := Result or (TBuf(buf^)[n] and 1);
  end;
  FreeMem(buf, 32);
  FileClose(f);
end;

procedure EncData(bf: Pointer; sz: Cardinal; fin, fout: String);
var
  bfh: BITMAPFILEHEADER;
  bi: BITMAPINFO;
  f, fo: Integer;
  buf: Pointer;
  n: Cardinal;
  k, t, t2: Byte;
begin
  Form1.ProgressBar1.Position := 0;
  Form1.ProgressBar1.Max := sz;
  c1 := Random(255);
  for k := 0 to Random(255) do
  begin
  end;
  c2 := Random(255);
  for k := 0 to Random(255) do
  begin
  end;
  c1 := Random(255);
  for k := 0 to Random(255) do
  begin
  end;
  c2 := Random(255);
  if sz < 1 then
    Exit;
  bi.bmiHeader.biSize := 40;
  f := FileOpen(fin, fmOpenRead);
  FileRead(f, bfh, SizeOf(bfh));
  FileRead(f, bi.bmiHeader, 40);
  bs := bi.bmiHeader.biWidth*bi.bmiHeader.biHeight*3;
  GetMem(buf, bs);
  FileRead(f, buf^, bs);
  FileClose(f);
  for k := 0 to 31 do
  begin
    t := ((1 shl (31-k)) and sz) shr (31-k);
    if t > 0 then
      TBuf(buf^)[k] := TBuf(buf^)[k] or 1
    else
      TBuf(buf^)[k] := TBuf(buf^)[k] and 254;
  end;
  for n := 0 to sz-1 do
  begin
    t2 := TBuf(bf^)[n] xor c1 xor c2;
    for k := 0 to 7 do
    begin
      t := ((1 shl (7-k)) and t2) shr (7-k);
      if t > 0 then
        TBuf(buf^)[32+n*8+k] := TBuf(buf^)[32+n*8+k] or 1
      else
        TBuf(buf^)[32+n*8+k] := TBuf(buf^)[32+n*8+k] and 254;
    end;
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    Form1.ProgressBar1.Update;
  end;
  if em then
    bi.bmiHeader.biXPelsPerMeter := Integer($FF11FF00+c1)
  else
    bi.bmiHeader.biXPelsPerMeter := Integer($7F11FF00+c1);
  bi.bmiHeader.biYPelsPerMeter := Integer($11FF1100+c2);
  fo := FileCreate(fout);
  FileWrite(fo, bfh, SizeOf(bfh));
  FileWrite(fo, bi.bmiHeader, 40);
  FileWrite(fo, buf^, bs);
  FileClose(fo);
  FreeMem(buf, bs);
  Form1.ProgressBar1.Position := 0;
end;

procedure DecData(var bf: Pointer; var sz: Cardinal; fin: String; fn: String = 'NOP');
var
  bfh: BITMAPFILEHEADER;
  bi: BITMAPINFO;
  f, fo: Integer;
  buf: Pointer;
  n: Cardinal;
  k, t, t2: Byte;
begin
  bi.bmiHeader.biSize := 40;
  f := FileOpen(fin, fmOpenRead);
  FileRead(f, bfh, SizeOf(bfh));
  FileRead(f, bi.bmiHeader, 40);
  bs := bi.bmiHeader.biWidth*bi.bmiHeader.biHeight*3;
  GetMem(buf, bs);
  FileRead(f, buf^, bs);
  c1 := bi.bmiHeader.biXPelsPerMeter and 255;
  c2 := bi.bmiHeader.biYPelsPerMeter and 255;
  sz := 0;
  for k := 0 to 31 do
  begin
    sz := sz shl 1;
    t := TBuf(buf^)[k] and 1;
    sz := sz or t;
  end;
  Form1.ProgressBar1.Position := 0;
  Form1.ProgressBar1.Max := sz;
  GetMem(bf, sz);
  for n := 0 to sz-1 do
  begin
    t2 := 0;
    for k := 0 to 7 do
    begin
      t2 := t2 shl 1;
      t := TBuf(buf^)[32+n*8+k] and 1;
      t2 := t2 or t;
    end;
    TBuf(bf^)[n] := t2 xor c1 xor c2;
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    Form1.ProgressBar1.Update;
  end;
  if fn <> 'NOP' then
  begin
    fo := FileCreate(fn);
    FileWrite(fo, bf^, sz);
    FileClose(fo);
    FreeMem(bf, sz);
    sz := 0;
  end;
  FreeMem(buf, bs);
  FileClose(f);
  Form1.ProgressBar1.Position := 0;
end;

procedure DelData(fin: String);
var
  bfh: BITMAPFILEHEADER;
  bi: BITMAPINFO;
  f: Integer;
  buf: Pointer;
  n, sz: Cardinal;
  k, t: Byte;
begin
  bi.bmiHeader.biSize := 40;
  f := FileOpen(fin, fmOpenReadWrite);
  FileRead(f, bfh, SizeOf(bfh));
  FileRead(f, bi.bmiHeader, 40);
  bs := bi.bmiHeader.biWidth*bi.bmiHeader.biHeight*3;
  GetMem(buf, bs);
  FileRead(f, buf^, bs);
  sz := 0;
  for k := 0 to 31 do
  begin
    sz := sz shl 1;
    t := TBuf(buf^)[k] and 1;
    sz := sz or t;
  end;
  Form1.ProgressBar1.Position := 0;
  Form1.ProgressBar1.Max := sz;
  for n := 0 to sz+32-1 do
  begin
    for k := 0 to 7 do
      TBuf(buf^)[n*8+k] := TBuf(buf^)[n*8+k] and 254;
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    Form1.ProgressBar1.Update;
  end;
  bi.bmiHeader.biXPelsPerMeter := 0;
  bi.bmiHeader.biYPelsPerMeter := 0;
  FileSeek(f, 0, 0);
  FileWrite(f, bfh, SizeOf(bfh));
  FileWrite(f, bi.bmiHeader, 40);
  FileWrite(f, buf^, bs);
  FreeMem(buf, bs);
  FileClose(f);
  Form1.ProgressBar1.Position := 0;
end;

procedure TForm1.UpdateInfo;
var
  bfh: BITMAPFILEHEADER;
  bi: BITMAPINFO;
begin
  Label6.Enabled := False;
  Label8.Enabled := False;
  Memo2.Clear;
  if em then
    Label7.Caption := 'File size: '+IntToStr(efs)+'/'+IntToStr(ms)
  else
    Label7.Caption := 'Text length: '+IntToStr(Length(Memo1.Text))+'/'+IntToStr(ms);
  if sf = '' then
  begin
    Label1.Enabled := False;
    Label8.Enabled := False;
    Label4.Enabled := False;
    Label10.Enabled := False;
    Memo2.Lines.Add('Input file: Not selected');
    Exit;
  end
  else
    Memo2.Lines.Add('Input file: '+sf);
  Memo2.Lines.Add('');
  Image1.Picture.Bitmap.LoadFromFile(sf);
  Label4.Enabled := True;
  Label10.Enabled := True;
  if not GetBMPHI(sf, bfh, bi) then
    Exit;
  sfds := 0; sfen := False; sfpk := False;
  sfdt := bi.bmiHeader.biXPelsPerMeter and $80000000;
  if (bi.bmiHeader.biXPelsPerMeter and $7FFFFF00 = $7F11FF00) and
     (bi.bmiHeader.biYPelsPerMeter and $7FFFFF00 = $11FF1100) then
    sfen := True;
  if bi.bmiHeader.biCompression <> 0 then
    sfpk := True;
  sfds := GetEDSize(sf);
  Memo2.Lines.Add('  Resolution: '+IntToStr(bi.bmiHeader.biWidth)+' X '+IntToStr(bi.bmiHeader.biHeight));
  if sfpk then
    Memo2.Lines.Add('  BMP Compressed: Yes')
  else
    Memo2.Lines.Add('  BMP Compressed: No');
  if sfen then
  begin
    Memo2.Lines.Add('  BMP Encoded: Yes');
    if sfdt = $80000000 then
      Memo2.Lines.Add('  Data type: File')
    else
      Memo2.Lines.Add('  Data typr: Text');
    Memo2.Lines.Add('  Data size: '+IntToStr(GetEDSize(sf)));
  end
  else
  begin
    Memo2.Lines.Add('  BMP Encoded: No');
    Memo2.Lines.Add('  Data type: No data');
    Memo2.Lines.Add('  Data size: No data');
  end;
  Memo2.Lines.Add('');
  if sfen then
  begin
    Label8.Enabled := True;
    if sfdt = $00000000 then
      Label6.Enabled := True
    else
      if df <> '' then
        Label6.Enabled := True
      else
        Label6.Enabled := False;
  end;
  bs := bi.bmiHeader.biWidth*bi.bmiHeader.biHeight*3;
  ms := bs div 8;
  if em then
  begin
    Label7.Caption := 'File size: '+IntToStr(efs)+'/'+IntToStr(ms);
    if (ef <> '') and (efs <= ms) then
      Label1.Enabled := True
    else
      Label1.Enabled := False;
  end
  else
  begin
    Label7.Caption := 'Text length: '+IntToStr(Length(Memo1.Text))+'/'+IntToStr(ms);
    if (Cardinal(Length(Memo1.Text)) <= ms) and (Length(Memo1.Text) > 0) then
      Label1.Enabled := True
    else
      Label1.Enabled := False;
  end;
  if df <> '' then
    Memo2.Lines.Add('Output file: '+df)
  else
    Memo2.Lines.Add('Output file: Not selected');
  Memo2.Lines.Add('');
  if ef <> '' then
    Memo2.Lines.Add('Data file: '+ef)
  else
    Memo2.Lines.Add('Data file: Not selected');
end;

procedure TForm1.Label1MouseEnter(Sender: TObject);
begin
  if TLabel(Sender).Enabled then
    TLabel(Sender).Color := clGreen;
end;

procedure TForm1.Label1MouseLeave(Sender: TObject);
begin
  if TLabel(Sender).Enabled then
    TLabel(Sender).Color := $222222;
end;

procedure TForm1.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if TLabel(Sender).Enabled then
    TLabel(Sender).Color := clLime;
end;

procedure TForm1.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if TLabel(Sender).Enabled then
    TLabel(Sender).Color := clGreen;
end;

procedure TForm1.Label2Click(Sender: TObject);
var
  bfh: BITMAPFILEHEADER;
  bi: BITMAPINFO;
begin
  sf := '';
  UpdateInfo;
  Label2.Color := $222222;
  if not OpenDialog1.Execute then
    Exit;
  if not GetBMPHI(OpenDialog1.FileName, bfh, bi) then
  begin
    ShowMessage('Wrong input file!');
    Exit;
  end;
  sf := OpenDialog1.FileName;
  UpdateInfo;
  if sfdt = $00000000 then
    if Label6.Enabled and sfen then
    begin
      RadioButton1.Checked := True;
      RadioButton1Click(Self);
      Label6Click(Form1);
    end;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  df := '';
  UpdateInfo;
  Label4.Color := $222222;
  if not SaveDialog1.Execute then
    Exit;
  df := SaveDialog1.FileName;
  UpdateInfo;
end;

procedure TForm1.Label1Click(Sender: TObject);
var
  f: Integer;
  efb: Pointer;
begin
  Label1.Color := $222222;
  if (not em) and (Length(Memo1.Text) = 0) then
    Exit;
  if em and (ef = '') then
    Exit;
  Caption := pn+' - Encoding...';
  if not em then
    if df <> '' then
      EncData(Pointer(Memo1.Text), Length(Memo1.Text), sf, df)
    else
      EncData(Pointer(Memo1.Text), Length(Memo1.Text), sf, sf);
  if em then
  begin
    GetMem(efb, efs);
    f := FileOpen(ef, fmOpenRead);
    FileRead(f, efb^, efs);
    FileClose(f);
    if df <> '' then
      EncData(efb, efs, sf, df)
    else
      EncData(efb, efs, sf, sf);
    FreeMem(efb, efs);
  end;
  Caption := pn;
  df := ''; ef := '';
  Memo1.Clear;
  UpdateInfo;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Label7.Caption := 'Text length: '+IntToStr(Length(Memo1.Text))+'/'+IntToStr(ms);
  if (Cardinal(Length(Memo1.Text)) <= ms) and (Length(Memo1.Text) > 0) then
    Label1.Enabled := True
  else
    Label1.Enabled := False;
end;

procedure TForm1.Label6Click(Sender: TObject);
var
  bp: Pointer;
  s: Cardinal;
begin
  Label6.Color := $222222;
  if (sfdt = $80000000) and (df = '') then
    Exit;
  Memo1.Clear;
  Caption := pn+' - Decoding...';
  if sfdt = $80000000 then
    DecData(bp, s, sf, df)
  else
    if df <> '' then
      DecData(bp, s, sf, df)
    else
      DecData(bp, s, sf);
  if s > 0 then
  begin
    Memo1.Text := TCaption(bp);
    FreeMem(bp, s);
  end;
  Caption := pn;
  if sfdt = $80000000 then
    ef := '';
  df := '';
  UpdateInfo;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := pn;
  Randomize;
  UpdateInfo;
end;

procedure TForm1.Label8Click(Sender: TObject);
begin
  if Label8.Enabled then
    Label8.Color := $333333;
  Memo1.Clear;
  Caption := pn+' - Deletion...';
  DelData(sf);
  Caption := pn;
  UpdateInfo;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    Label10.Visible := False;
    Label11.Visible := False;
    Memo1.Visible := True;
    em := False;
  end
  else
  begin
    Memo1.Visible := False;
    Label10.Visible := True;
    Label11.Visible := True;
    em := True;
  end;
  if em then
    Label7.Caption := 'File size: '+IntToStr(efs)+'/'+IntToStr(ms)
  else
    Label7.Caption := 'Text length: '+IntToStr(Length(Memo1.Text))+'/'+IntToStr(ms);
  UpdateInfo;
end;

procedure TForm1.Label10Click(Sender: TObject);
var
  f: Integer;
begin
  ef := ''; efs := 0;
  UpdateInfo;
  Label10.Color := $222222;
  if not OpenDialog2.Execute then
    Exit;
  f := FileOpen(OpenDialog2.FileName, fmOpenRead);
  if f < 0 then
  begin
    ShowMessage('Wrong data file!');
    Exit;
  end;
  efs := FileSeek(f, 0, 2);
  FileClose(f);
  ef := OpenDialog2.FileName;
  UpdateInfo;
end;

end.
