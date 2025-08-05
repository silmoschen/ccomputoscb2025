{***************************************************************
 *
 * Project  : MailDemo
 * Unit Name: MsgEditor
 * Purpose  : Sub form
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:28:29
 * Author  : Hadi Hari <hadi@pbe.com>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit MsgEditor;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,  QComCtrls,  QExtCtrls,
     QGrids,  QButtons,  QMenus,  QImgList,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,  ComCtrls,  ExtCtrls,  Grids,
     Buttons,  Menus,  ImgList,
{$ENDIF}
  windows, messages,  SysUtils,  Classes, IdBaseComponent, IdMessage, IdComponent,
    IdTCPConnection, IdTCPClient, IdMessageClient,

 {$IFDEF VER140}
 IdSMTP;
 {$ENDIF}
 {$IFDEF VER185}
 IdSMTP,IdSMTPBase, IdExplicitTLSClientServerBase, IdAttachmentFile;
 {$ENDIF}

type
  TfmMessageEditor = class(TForm)
    bbtnAdvanced: TBitBtn;
    bbtnCancel: TBitBtn;
    bbtnOk: TBitBtn;
    btnAttachment: TBitBtn;
    btnText: TBitBtn;
    cboPriority: TComboBox;
    chkReturnReciept: TCheckBox;
    Edit1: TEdit;
    edtBCC: TEdit;
    edtCC: TEdit;
    edtSubject: TEdit;
    edtTo: TEdit;
    grpAttachment: TGroupBox;
    IdMsgSend: TIdMessage;
    lblBCC: TLabel;
    lblCC: TLabel;
    lblPriority: TLabel;
    lblSubject: TLabel;
    lblTo: TLabel;
    lvFiles: TListView;
    Memo1: TMemo;
    pnlBottom: TPanel;
    pnlButtons: TPanel;
    pnlMainDetails: TPanel;
    pnlSmallButtons: TPanel;
    pnlTop: TPanel;
    pnlTopLeft: TPanel;
    StatusBar1: TStatusBar;
    SMTP: TIdSMTP;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    MAttach: TMemo;
    procedure bbtnAdvancedClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure btnAttachmentClick(Sender: TObject);
    procedure btnTextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ResetAttachmentListView;
  public
    { Public declarations }
    smtpSERVER, smtpDE, SmtpServerUser, SmtpServerPassword: String;
    smtpPUERTO, SmtpAuthType: Integer;
    //SmtpServerUser     := 'silmos@arnet.com.ar';
    //SmtpServerPassword := 'katmandu';

    Conectado, conexion_directa: Boolean;
    procedure CargarConfigServerSMTP;
  end;

var
  fmMessageEditor: TfmMessageEditor;

  {TODO:  Handle message body which is typed in the RichEdit}

implementation
uses msgEdtAdv, FormAuto, RasDial3, RasDial2, RasDial1, RasDial4, CUtiles, CCBandejaSalida, CBDT;

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfmMessageEditor.CargarConfigServerSMTP;
var
  archivo: TextFile;
begin
  if Length(Trim(smtpSERVER)) = 0 then Begin
    if FileExists('smtp.ini') then Begin
      AssignFile(archivo, dbs.DirSistema + '\smtp.ini');
      Reset(archivo);
      ReadLn(archivo, smtpSERVER);
      ReadLn(archivo, smtpPUERTO);
      closeFile(archivo);
    end;
  end;
  //smtpDE := 'silmos@datafull.com';

end;

procedure TfmMessageEditor.bbtnOkClick(Sender: TObject);
var
  i: Integer;
  l: Boolean;
begin
  if Length(Trim(smtpSERVER)) = 0 then CargarConfigServerSMTP;
  if Length(Trim(smtpSERVER)) = 0 then utiles.msgError('Configuración SMTP Inexistente o Incorrecta,' + chr(13) + 'Imposible realizar Envio.') else Begin
    if not conexion_directa then Begin
      {Application.CreateForm(TAutoForm, AutoForm);
      Application.CreateForm(TConfigureAutoForm, ConfigureAutoForm);
      Application.CreateForm(TAboutForm, AboutForm);
      Application.CreateForm(TRasDialerForm, RasDialerForm);
      Application.CreateForm(TTimeAutoForm, TimeAutoForm);
      if Length(Trim(RasDialerForm.setIPAdress)) = 0 then   // Si No esta conectado
        if utiles.msgSiNo('Desea Conectarse y Enviar el Mensaje ?') then RasDialerForm.ShowModal;}
    end;

    l := False;
    if conexion_directa then l := True else
      if Length(Trim(RasDialerForm.setIPAdress)) > 0 then l := True;  // Significa que hay conexión

    if l then Begin
      StatusBar1.Panels[0].Text := 'Enviando ...!'; StatusBar1.Refresh;
      with IdMsgSend do Begin
        Body.Assign(Memo1.Lines);
        //From.Text := UserEmail;
        if Length(Trim(smtpDE)) > 0 then From.Text := smtpDE;
        Recipients.EMailAddresses := edtTo.Text; { To: header }
        Subject := edtSubject.Text; { Subject: header }
        Priority := TIdMessagePriority(cboPriority.ItemIndex); { Message Priority }
        CCList.EMailAddresses := edtCC.Text; {CC}
        BccList.EMailAddresses := edtBCC.Text; {BBC}
        if chkReturnReciept.Checked then
        begin {We set the recipient to the From E-Mail address }
          ReceiptRecipient.Text := From.Text;
        end
        else
        begin {indicate that there is no receipt recipiant}
          ReceiptRecipient.Text := '';
        end;
      end;

      {authentication settings}
      case SmtpAuthType of
        {$IFDEF VER140}
        0: SMTP.AuthenticationType := atNone;
        1: SMTP.AuthenticationType := atLogin; {Simple Login}
        {$ENDIF}
        {$IFDEF VER185}
        0: SMTP.AuthType := atNone;
        1: SMTP.AuthType := atDefault; {Simple Login}
        {$ENDIF}
      end;
      {$IFDEF VER140}
      SMTP.UserId   := SmtpServerUser;
      SMTP.Password := SmtpServerPassword;
      {$ENDIF}
      {$IFDEF VER185}
      SMTP.UserName := SmtpServerUser;
      SMTP.Password := SmtpServerPassword;
      SMTP.ConnectTimeout := 6000000000;
      {$ENDIF}

      if Length(Trim(smtpSERVER)) > 0 then SMTP.Host := smtpSERVER;
      if smtpPUERTO > 0 then SMTP.Port := smtpPUERTO;

      {now we send the message}
      SMTP.Connect;
      try
        SMTP.Send(IdMsgSend);
      finally
        SMTP.Disconnect;
      end;

      SMTP.Disconnect;

      FreeAndNil( IdMsgSend );
      FreeAndNil( SMTP );

    end else Begin    // Transferimos en mensaje a la bandeja de salida
      {MAttach.Lines.Clear;
      For i := 1 to lvFiles.Items.Count do
        MAttach.Lines.Add(lvFiles.Items.Item[i-1].Caption);

      bandeja.conectar;
      bandeja.Registar(edtto.Text, edtSubject.Text, edtcc.Text, edtbcc.Text, Memo1.Text, MAttach.Text);
      bandeja.desconectar;}
    end;

    if not conexion_directa then Begin
      {TimeAutoForm.Release; TimeAutoForm := nil;
      RasDialerForm.Release; RasDialerForm := nil;
      AboutForm.Release; AboutForm := nil;
      ConfigureAutoForm.Release; ConfigureAutoForm := nil;
      AutoForm.Release; AutoForm := nil;}
    end;
  end;
end;

procedure TfmMessageEditor.bbtnAdvancedClick(Sender: TObject);
begin
  with TfrmAdvancedOptions.Create(Application) do
  try
    edtSender.Text := IdMsgSend.Sender.Text;
    mmoExtraHeaders.Lines := IdMsgSend.ExtraHeaders;
    if ShowModal = mrOk then
    begin
      {Sender header}
      IdMsgSend.Sender.Text := edtSender.Text;
      {Extra header}
      IdMsgSend.ExtraHeaders.Assign(mmoExtraHeaders.Lines);
    end;
  finally
    Free;
  end;
end;

procedure TfmMessageEditor.FormCreate(Sender: TObject);
begin
  cboPriority.ItemIndex := Ord(IdMsgSend.Priority);
end;

procedure TfmMessageEditor.btnAttachmentClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    {$IFDEF VER140}
    TIdAttachment.Create(IdMsgSend.MessageParts, OpenDialog1.FileName);
    ResetAttachmentListView;
    {$ENDIF}
    {$IFDEF VER185}
    TIdAttachmentFile.Create(IdMsgSend.MessageParts, OpenDialog1.FileName);
    IdMsgSend.ContentType := 'multipart/mixed';
    {$ENDIF}
  end;
end;

procedure TfmMessageEditor.ResetAttachmentListView;
var
  li: TListItem;
  idx: Integer;
begin
  lvFiles.Items.Clear;
  for idx := 0 to Pred(IdMsgSend.MessageParts.Count) do
  begin
    li := lvFiles.Items.Add;

     {$IFDEF VER140}
    if IdMsgSend.MessageParts.Items[idx] is TIdAttachment then
    begin
      li.ImageIndex := 0;
      li.Caption := TIdAttachment(IdMsgSend.MessageParts.Items[idx]).Filename;
      li.SubItems.Add(TIdAttachment(IdMsgSend.MessageParts.Items[idx]).ContentType);
    end
    else
    begin
      li.ImageIndex := 1;
      li.Caption := IdMsgSend.MessageParts.Items[idx].ContentType;
    end;
    {$ENDIF}

    {$IFDEF VER185}
    IdMsgSend.ContentType := 'multipart/mixed';  // es para que llegue el ajunto como se envia al destino
    if IdMsgSend.MessageParts.Items[idx] is TIdAttachmentFile then
    begin
      li.ImageIndex := 0;
      li.Caption := TIdAttachmentFile(IdMsgSend.MessageParts.Items[idx]).Filename;
      li.SubItems.Add(TIdAttachmentFile(IdMsgSend.MessageParts.Items[idx]).ContentType);
    end
    else
    begin
      li.ImageIndex := 1;
      li.Caption := IdMsgSend.MessageParts.Items[idx].ContentType;
    end;
    {$ENDIF}

  end;
end;

procedure TfmMessageEditor.btnTextClick(Sender: TObject);
begin
  {if Length(Edit1.Text) = 0 then
  begin
    MessageDlg('Indicate ContentType first', mtError, [mbOk], 0);
  end
  else
  begin
    with TIdText.Create(IdMsgSend.MessageParts, Memo1.Lines) do
    begin
      ContentType := Edit1.Text;
    end;
    Memo1.Clear;
    ResetAttachmentListView;
  end;}
end;

procedure TfmMessageEditor.FormShow(Sender: TObject);
begin
  ResetAttachmentListView;
  ActiveControl := edtSubject;
  CargarConfigServerSMTP;
end;

end.
