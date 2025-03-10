unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Registry, CPort;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComPortList: TComboBox;
    ComPort1: TComPort;
    Button2: TButton;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComPortListDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function listComPorts:TStringList;
var
  i: Integer;
  Ports: TStringList;
  reg: TRegistry;
begin
  Ports := TStringList.Create;
  result:=TStringList.Create;
  reg := TRegistry.Create(KEY_READ);
    with reg do
    try
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if reg.OpenKey('hardware\devicemap\serialcomm', false) then
        try
          ports.BeginUpdate();
          try
            reg.GetValueNames(ports);
            for i := ports.Count -1 downto 0 do            // ����������� � �������� �������
            ports.Strings[i] := reg.ReadString(ports.Strings[i]);
            result:=ports;                  // ��� ��� ����������� ��������
            ports.sort()

          finally
            ports.EndUpdate()
          end
        finally
          reg.CloseKey()
        end
      else
        ports.clear()
    finally
    reg.free()
    end

end;

procedure TForm1.Button1Click(Sender: TObject);

const

  //-------------------------------------------------- ����� ��� ����������� � ����� ------------------------------------------------------------- //

  bytestosend: array [1..21] of Byte = ($55, $AA, $00, $62, $FE, $FF, $00, $00, $00, $00, $01, $00, $00, $00, $00, $01, $01, $00, $00, $B7, $57);

  bytestosend2: array [1..20] of Byte = ($55, $AA, $00, $A9, $FE, $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $02, $00, $00, $57);

  bytestosend3: array [1..20] of Byte = ($55, $AA, $00, $4E, $FE, $00, $00, $00, $00, $00, $00, $00, $16, $00, $00, $00, $08, $00, $BF, $56);

  bytestosend4: array [1..20] of Byte = ($55, $AA, $00, $85, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $14, $58, $00, $44, $57);

  bytestosend5: array [1..20] of Byte = ($55, $AA, $00, $5B, $FE, $00, $00, $00, $00, $00, $00, $00, $06, $00, $00, $00, $01, $00, $B5, $56);

  bytestosend6: array [1..20] of Byte = ($55, $AA, $00, $F2, $FE, $01, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $02, $00, $4A, $57);

  //-------------------------------------------------------------------------------------------------------------------------------------------- //

begin

     If CheckBox1.Checked then
      Begin

         CheckBox1.Checked:=False;

         ComPort1.Connected:=False;

         Button1.Caption:='����.';

         Button2.Enabled:=False;


      End

      else

      Begin

         CheckBox1.Checked:=True;

         Button1.Caption:='����.';

         ComPort1.Port:=ComPortList.Text;
         ComPort1.Connected:=True;

         if ComPort1.Connected then

           begin

             sleep(40);
             ComPort1.Write(bytestosend,21);
             sleep(1);
             ComPort1.Write(bytestosend2,20);
             sleep(16);
             ComPort1.Write(bytestosend3,20);
             sleep(10);
             ComPort1.Write(bytestosend4,20);
             sleep(1000);
             ComPort1.Write(bytestosend5,20);
             sleep(10);
             ComPort1.Write(bytestosend6,20);
             sleep(1000);
             Button2.Enabled:=True;

           end;


      End;



end;

procedure TForm1.Button2Click(Sender: TObject);

const

Brig_0: array [1..21] of Byte = ($55, $AA, $00, $B0, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $00, $07, $59);

Brig_5: array [1..21] of Byte = ($55, $AA, $00, $F9, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $0D, $5D, $59);

Brig_10: array [1..21] of Byte = ($55, $AA, $00, $8F, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $1A, $00, $59);

Brig_15: array [1..21] of Byte = ($55, $AA, $00, $3D, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $26, $BA, $58);

Brig_20: array [1..21] of Byte = ($55, $AA, $00, $E9, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $33, $73, $59);

Brig_25: array [1..21] of Byte = ($55, $AA, $00, $5D, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $40, $F4, $58);

Brig_30: array [1..21] of Byte = ($55, $AA, $00, $0A, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $4D, $AE, $58);

Brig_35: array [1..21] of Byte = ($55, $AA, $00, $BB, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $59, $6B, $59);

Brig_40: array [1..21] of Byte = ($55, $AA, $00, $00, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $66, $BD, $58);

Brig_45: array [1..21] of Byte = ($55, $AA, $00, $89, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $73, $53, $59);

Brig_50: array [1..21] of Byte = ($55, $AA, $00, $8C, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $80, $63, $59);

Brig_55: array [1..21] of Byte = ($55, $AA, $00, $7B, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $8C, $5E, $59);

Brig_60: array [1..21] of Byte = ($55, $AA, $00, $E9, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $99, $D9, $59);

Brig_65: array [1..21] of Byte = ($55, $AA, $00, $97, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $A6, $94, $59);

Brig_70: array [1..21] of Byte = ($55, $AA, $00, $95, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $B3, $9F, $59);

Brig_75: array [1..21] of Byte = ($55, $AA, $00, $E5, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $BF, $FB, $59);

Brig_80: array [1..21] of Byte = ($55, $AA, $00, $00, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $CC, $23, $59);

Brig_85: array [1..21] of Byte = ($55, $AA, $00, $93, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $D9, $C3, $59);

Brig_90: array [1..21] of Byte = ($55, $AA, $00, $8B, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $E6, $C8, $59);

Brig_95: array [1..21] of Byte = ($55, $AA, $00, $2A, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $F2, $73, $59);

Brig_100: array [1..21] of Byte = ($55, $AA, $00, $39, $FE, $00, $01, $00, $FF, $FF, $01, $00, $01, $00, $00, $02, $01, $00, $FF, $8F, $59);

begin

    if ComboBox1.ItemIndex = 0  then  ComPort1.Write(Brig_0,21);
    if ComboBox1.ItemIndex = 1  then  ComPort1.Write(Brig_5,21);
    if ComboBox1.ItemIndex = 2  then  ComPort1.Write(Brig_10,21);
    if ComboBox1.ItemIndex = 3  then  ComPort1.Write(Brig_15,21);
    if ComboBox1.ItemIndex = 4  then  ComPort1.Write(Brig_20,21);
    if ComboBox1.ItemIndex = 5  then  ComPort1.Write(Brig_25,21);
    if ComboBox1.ItemIndex = 6  then  ComPort1.Write(Brig_30,21);
    if ComboBox1.ItemIndex = 7  then  ComPort1.Write(Brig_35,21);
    if ComboBox1.ItemIndex = 8  then  ComPort1.Write(Brig_40,21);
    if ComboBox1.ItemIndex = 9  then  ComPort1.Write(Brig_45,21);
    if ComboBox1.ItemIndex = 10 then  ComPort1.Write(Brig_50,21);
    if ComboBox1.ItemIndex = 11 then  ComPort1.Write(Brig_55,21);
    if ComboBox1.ItemIndex = 12 then  ComPort1.Write(Brig_60,21);
    if ComboBox1.ItemIndex = 13 then  ComPort1.Write(Brig_65,21);
    if ComboBox1.ItemIndex = 14 then  ComPort1.Write(Brig_70,21);
    if ComboBox1.ItemIndex = 15 then  ComPort1.Write(Brig_75,21);
    if ComboBox1.ItemIndex = 16 then  ComPort1.Write(Brig_80,21);
    if ComboBox1.ItemIndex = 17 then  ComPort1.Write(Brig_85,21);
    if ComboBox1.ItemIndex = 18 then  ComPort1.Write(Brig_90,21);
    if ComboBox1.ItemIndex = 19 then  ComPort1.Write(Brig_95,21);
    if ComboBox1.ItemIndex = 20 then  ComPort1.Write(Brig_100,21);

end;

procedure TForm1.ComPortListDropDown(Sender: TObject);
begin
    ComPortList.Items.Assign(listComPOrts);
end;

end.
