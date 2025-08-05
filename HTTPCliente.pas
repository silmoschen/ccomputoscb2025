{***************************************************************
 *
 * Project  : HTTPClient
 * Unit Name: Main
 * Purpose  : Demonstrates use of HTTPClient component
 * NOtes  : Demo for Windows only
 * Date  : 21/01/2001  -  14:26:51
 * Author: Hadi Hariri
 * History  :
 *
 ****************************************************************}

unit HTTPCliente;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,  QExtCtrls,  QButtons,
     QComCtrls,
{$ELSE}
    Windows, Messages,  Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,
    ExtCtrls,  Buttons,  ComCtrls, CUtiles,
{$ENDIF}
  SysUtils,  Classes, IdComponent, IdTCPConnection,
    IdTCPClient, IdHTTP, IdBaseComponent, IdSSLOpenSSL, IdIntercept,
    {IdSSLIntercept,} IdAntiFreezeBase, IdAntiFreeze, IdLogBase, IdLogDebug,
  Mask;

type
  TfmClientHTML = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnGo: TBitBtn;
    btnStop: TBitBtn;
    cbURL: TComboBox;
    cbProtocol: TComboBox;
    cbSSL: TCheckBox;
    cbMethod: TComboBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edUsername: TEdit;
    edPassword: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edProxyServer: TEdit;
    edProxyPort: TEdit;
    GroupBox3: TGroupBox;
    mePostData: TMemo;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    edPostFile: TEdit;
    edContentType: TEdit;
    memoHTML: TMemo;
    ProgressBar1: TProgressBar;
    HTTP: TIdHTTP;
    OpenDialog1: TOpenDialog;
    LogDebug: TIdLogDebug;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    theURL: TMaskEdit;
    Label10: TLabel;
    Edit1: TEdit;
    btnDisparar: TButton;
    Label13: TLabel;
    txtNombre: TLabel;
    txtDireccion: TLabel;
    txtLocalidad: TLabel;
    procedure btnGoClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbURLChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HTTPStatus(axSender: TObject; const axStatus: TIdStatus;
      const asStatusText: string);
    procedure HTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure HTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HTTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure cbProtocolChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edPostFileExit(Sender: TObject);
    procedure mePostDataExit(Sender: TObject);
    procedure cbSSLClick(Sender: TObject);
    procedure LogDebugLogItem(ASender: TComponent; var AText: string);
    procedure btnDispararClick(Sender: TObject);
  private
    bPostFile: Boolean;
  public
    nodesconectar: Boolean;
    procedure desconectar;
  end;

var
  fmClientHTML: TfmClientHTML;

implementation

{$R *.DFM}

procedure TfmClientHTML.desconectar;
Begin
  btnStop.OnClick(nil);
  try
    cbURL.Items.SaveToFile(ExtractFilePath(ParamStr(0)) + 'history.dat');
  except
  end;
end;

procedure TfmClientHTML.btnGoClick(Sender: TObject);
var
  Source: TMemoryStream;
  Response: TStringStream;
begin
  // Add the URL to the combo-box.
  if cbURL.Items.IndexOf(cbURL.Text) = -1 then
    cbURL.Items.Add(cbURL.Text);
  Screen.Cursor := crHourGlass;
  btnStop.Enabled := True;
  btnGo.Enabled := False;
  try
    memoHTML.Clear;
    // Set the properties for HTTP
    HTTP.Request.Username := edUsername.Text;
    HTTP.Request.Password := edPassword.Text;

    {$IFDEF VER140}
    HTTP.Request.ProxyServer := edProxyServer.Text;
    HTTP.Request.ProxyPort := StrToIntDef(edProxyPort.Text, 80);
    {$ENDIF}
    {$IFDEF VER185}
    HTTP.Request.ProxyConnection := edProxyServer.Text;
    //HTTP.Request. := StrToIntDef(edProxyPort.Text, 80);
    {$ENDIF}

    HTTP.Request.ContentType := edContentType.Text;
    //utiles.msgError(cbURL.Text);
    case cbMethod.ItemIndex of
      0: // Head
        begin
          HTTP.Head(cbURL.Text);
          memoHTML.Lines.Add('This is an example of some of the headers returned: ');
          memoHTML.Lines.Add('---------------------------------------------------');
          memoHTML.Lines.Add('Content-Type: ' + HTTP.Response.ContentType);
          memoHTML.Lines.Add('Date: ' + DatetoStr(HTTP.Response.Date));
          memoHTML.Lines.Add('');
          memoHTML.Lines.Add('You can view all the headers by examining HTTP.Response');
        end;
      1: // Get
        begin
          memoHTML.Lines.Text := HTTP.Get(cbURL.Text);
        end;
      2: // Post
        begin
          Response := TStringStream.Create('');
          try
            if not bPostFile then
              HTTP.Post(cbURL.Text, mePostData.Lines, Response)
            else
            begin
              Source := TMemoryStream.Create;
              try
                Source.LoadFromFile(edPostFile.Text);
                HTTP.Post(cbURL.Text, Source, Response);
              finally
                Source.Free;
              end;
            end;
            memoHTML.Lines.Text := Response.DataString;
          finally
            Response.Free;
          end;
        end;
    end;
  finally
    Screen.Cursor := crDefault;
    btnStop.Enabled := False;
    btnGo.Enabled := True;
  end;
end;

procedure TfmClientHTML.btnStopClick(Sender: TObject);
begin
  {$IFDEF VER140}
  http.DisconnectSocket;
  {$ENDIF}
  {$IFDEF VER140}
  http.Disconnect;
  {$ENDIF}

  // Clicking this does not get rid of the hourclass cursor
  btnStop.Enabled := False;
  Screen.Cursor := crDefault;
end;

procedure TfmClientHTML.FormActivate(Sender: TObject);
begin
  btnStop.Enabled := False;
  cbMethod.ItemIndex := 1; // Set to GET
  cbProtocol.ItemIndex := 0; // Set to 1.0
  cbProtocol.OnChange(nil);
  bPostFile := False;
  // Load history
  if FileExists(ExtractFilePath(ParamStr(0)) + 'history.dat') then
  begin
    cbURL.Items.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'history.dat');
  end;
end;

procedure TfmClientHTML.cbURLChange(Sender: TObject);
begin
  btnGo.Enabled := Length(cbURL.Text) > 0;
  cbSSL.Checked := Pos('HTTPS', UpperCase(cbURL.Text)) > 0;
end;

procedure TfmClientHTML.FormCreate(Sender: TObject);
begin
  // Set the progress bar
  ProgressBar1.Parent := StatusBar1;
  ProgressBar1.Top := 2;
  ProgressBar1.Left := 1;
end;

procedure TfmClientHTML.HTTPStatus(axSender: TObject; const axStatus: TIdStatus;
  const asStatusText: string);
begin
  StatusBar1.Panels[1].Text := asStatusText;
end;

procedure TfmClientHTML.HTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  ProgressBar1.Position := 0;
  ProgressBar1.Max := AWorkcountMax;
  if AWorkCountMax > 0 then
    StatusBar1.Panels[1].Text := 'Transfering: ' + IntToStr(AWorkCountMax);
end;

procedure TfmClientHTML.HTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  StatusBar1.Panels[1].Text := 'Done';
  ProgressBar1.Position := 0;
end;

procedure TfmClientHTML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not nodesconectar then desconectar;
end;

procedure TfmClientHTML.HTTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if ProgressBar1.Max > 0 then
  begin
    StatusBar1.Panels[1].Text := IntToStr(AWorkCount) + ' bytes of ' +
      IntToStr(ProgressBar1.Max) + ' bytes.';
    ProgressBar1.Position := AWorkCount;
  end
  else
    StatusBar1.Panels[1].Text := IntToStr(AworkCount) + ' bytes.';
end;

procedure TfmClientHTML.cbProtocolChange(Sender: TObject);
begin
  case cbProtocol.ItemIndex of
    0: HTTP.ProtocolVersion := pv1_0;
    1: HTTP.ProtocolVersion := pv1_1;
  end;
end;

procedure TfmClientHTML.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edPostFile.Text := OpenDialog1.FileName;
    edPostFile.OnExit(nil);
  end;
end;

procedure TfmClientHTML.edPostFileExit(Sender: TObject);
begin
  if Length(edPostFile.Text) > 0 then
  begin
    mePostData.Clear;
    bPostFile := True;
  end;
end;

procedure TfmClientHTML.mePostDataExit(Sender: TObject);
begin
  if mePostData.Lines.Count > 0 then
  begin
    edPostFile.Text := '';
    bPostFile := False;
  end;
end;

procedure TfmClientHTML.cbSSLClick(Sender: TObject);
var
  p: Integer;
begin
  // check if the url has proper protocol set
  if cbSSL.Checked then
  begin
    if Pos('HTTPS', UpperCase(cbURL.Text)) <= 0 then
    begin
      p := Pos('://', UpperCase(cbURL.Text));
      if p > 0 then
      begin
        cbURL.Text := 'https://' + Copy(cbURL.Text, p + 3, Length(cbURL.Text) -
          (p + 2));
      end
      else
      begin
        cbURL.Text := 'https://' + cbURL.Text;
      end;
    end;
  end
  else
  begin
    if Pos('HTTPS', UpperCase(cbURL.Text)) > 0 then
    begin
      p := Pos('://', UpperCase(cbURL.Text));
      cbURL.Text := 'http://' + Copy(cbURL.Text, p + 3, Length(cbURL.Text) - (p
        + 2));
    end;
  end;

end;

procedure TfmClientHTML.LogDebugLogItem(ASender: TComponent;
  var AText: string);
begin
  Memo1.Lines.Add(AText);
end;

procedure TfmClientHTML.btnDispararClick(Sender: TObject);
const
  lineasabajo = 15;
var
  espera, b: Boolean;
  i, j, SelPos: Integer;
  linea: String;
begin    
  cbURL.Text := Edit1.Text;  // Procesa
  btnGoClick(Self);

  while not espera do
    espera := btnGo.Enabled;     // Averigua cuando el procesamiento termino

end;

end.

