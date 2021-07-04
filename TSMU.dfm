object Form1: TForm1
  Left = 199
  Top = 107
  BorderStyle = bsSingle
  Caption = 'TSM'
  ClientHeight = 454
  ClientWidth = 688
  Color = clBlack
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
    999999999999999999999999999994444F00F40F444444444444444444499C44
    4F00F40F444444444444444444499CC44F0F0F0F444444440000004444499CCC
    4F0F0F0F444440008888880044499CCCCF04F00F444008888888888804499CCC
    CF00000F4008F8F8F8F8888804499CCCCF04F00F0F8F88888888800004499CCC
    CF0F0040F8F8F8F8F800078804499CCCCCF0040F8F888F880077787804499CCC
    CCCFC0F8F8F8F8F00787878044499CCCCCCC0F8F8F8F80070878788044499CCC
    CCC0F8F8F8F807770787880444499CCCCCC0FFFF8F8077780878780444499CCC
    CC08F8F8F80F77870787804444499CCCCC0FFF8F80F0F7780878044444499CCC
    C0F8F8F8078F0F870787044444499CCCC0FF8FF07777F0F80880444444499CCC
    C0F8F8F077878F0F0804444444499CCC0FFFFF07777878F00044444444499CCC
    0FF8F000000000000F4F444444499CCC0FFFF07778787880F0F0F44444499CCC
    0FF807878787870CCF00F44444499CCC0FFF0778787870CCF000F44444499CCC
    0FF8078787800CCCCFFF0F4444499CCC0FF07878780CCCCCCCCCFF4444499CCC
    C0F0777700CCCCCCCCCCCC4444499CCCC0F07700CCCCCCCCCCCCCCC444499CCC
    CC0000CCCCCCCCCCCCCCCCCC44499CCCCCCCCCCCCCCCCCCCCCCCCCCCC4499CCC
    CCCCCCCCCCCCCCCCCCCCCCCCCC49999999999999999999999999999999990000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    688
    454)
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 2
    Top = 248
    Width = 81
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'Encoding:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Bevel4: TBevel
    Left = 328
    Top = 248
    Width = 355
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 2
    Top = 414
    Width = 683
    Height = 38
    Anchors = [akLeft, akRight, akBottom]
  end
  object Bevel1: TBevel
    Left = 2
    Top = 2
    Width = 324
    Height = 244
    Shape = bsFrame
  end
  object Image1: TImage
    Left = 4
    Top = 4
    Width = 321
    Height = 240
    Stretch = True
  end
  object Label1: TLabel
    Left = 6
    Top = 419
    Width = 105
    Height = 28
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Encode'
    Color = 2236962
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label1Click
    OnMouseDown = Label1MouseDown
    OnMouseUp = Label1MouseUp
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object Label2: TLabel
    Left = 226
    Top = 419
    Width = 28
    Height = 28
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = '1'
    Color = 2236962
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label2Click
    OnMouseDown = Label1MouseDown
    OnMouseUp = Label1MouseUp
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object Label4: TLabel
    Left = 514
    Top = 419
    Width = 28
    Height = 29
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = '1'
    Color = 2236962
    Enabled = False
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label4Click
    OnMouseDown = Label1MouseDown
    OnMouseUp = Label1MouseUp
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object Label5: TLabel
    Left = 420
    Top = 420
    Width = 88
    Height = 27
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Output file'
    Color = clBlack
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label6: TLabel
    Left = 574
    Top = 419
    Width = 105
    Height = 28
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = 'Decode'
    Color = 2236962
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label6Click
    OnMouseDown = Label1MouseDown
    OnMouseUp = Label1MouseUp
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object Label3: TLabel
    Left = 140
    Top = 420
    Width = 80
    Height = 27
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'Input file'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label7: TLabel
    Left = 328
    Top = 250
    Width = 359
    Height = 17
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Text length: 0/0'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label8: TLabel
    Left = 286
    Top = 419
    Width = 105
    Height = 28
    Alignment = taCenter
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = 'Delete data'
    Color = 2236962
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    OnClick = Label8Click
    OnMouseDown = Label1MouseDown
    OnMouseUp = Label1MouseUp
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object Label10: TLabel
    Left = 76
    Top = 267
    Width = 29
    Height = 29
    Alignment = taCenter
    Anchors = [akRight, akBottom]
    AutoSize = False
    Caption = '1'
    Color = 2236962
    Enabled = False
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    Visible = False
    OnClick = Label10Click
    OnMouseDown = Label1MouseDown
    OnMouseUp = Label1MouseUp
    OnMouseEnter = Label1MouseEnter
    OnMouseLeave = Label1MouseLeave
  end
  object Label11: TLabel
    Left = 6
    Top = 274
    Width = 64
    Height = 16
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    Caption = 'Filename'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object Bevel3: TBevel
    Left = 2
    Top = 248
    Width = 325
    Height = 21
    Shape = bsFrame
  end
  object RadioButton1: TRadioButton
    Left = 88
    Top = 250
    Width = 59
    Height = 17
    Caption = 'Text'
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 154
    Top = 250
    Width = 59
    Height = 17
    Caption = 'File'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object Memo1: TMemo
    Left = 2
    Top = 270
    Width = 683
    Height = 143
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkSoft
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = Memo1Change
  end
  object Memo2: TMemo
    Left = 328
    Top = 2
    Width = 357
    Height = 245
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    Color = clBlack
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 214
    Top = 252
    Width = 109
    Height = 13
    Min = 0
    Max = 20000
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmaps|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Input File'
    Left = 388
    Top = 266
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.*'
    Filter = 'Any files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Output File'
    Left = 424
    Top = 266
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.*'
    Filter = 'Any files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Data File'
    Left = 388
    Top = 296
  end
end
