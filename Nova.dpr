program Nova;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Novastar';
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
