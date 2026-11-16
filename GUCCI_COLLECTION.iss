; GUCCI COLLECTION - Windows x64 VST3 Installer
#define MyAppName "GUCCI COLLECTION"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "GUCCI COLLECTION"
#define MyAppURL "https://github.com/incanziani-2013/INSTALLADOR-ZAYKEEYYYS"

[Setup]
AppId={{8D2E8C71-4B16-4C9D-A8A7-61A74C8D3F20}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={commoncf}\VST3
DisableProgramGroupPage=yes
DisableDirPage=no
DefaultGroupName=GUCCI COLLECTION
OutputDir=output
OutputBaseFilename=GUCCI_COLLECTION_Setup_v{#MyAppVersion}
SetupIconFile=assets\generated\zaykeys.ico
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
Uninstallable=yes
UninstallDisplayName=GUCCI COLLECTION
CloseApplications=yes
RestartApplications=no
ShowLanguageDialog=no
UsePreviousAppDir=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: "full"; Description: "Full installation (both instruments)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "zaykeys"; Description: "ZAY KEYS — Vintage Keyboard Instrument"; Types: full custom
Name: "mpc3000"; Description: "MPC3000 SIMULATOR — Vintage Sampling Instrument"; Types: full custom

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut to the installation folder"; GroupDescription: "Additional options:"; Flags: unchecked

[Files]
Source: "payload\ZAY KEYS.vst3\*"; DestDir: "{app}\ZAY KEYS.vst3"; Components: zaykeys; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "payload\MPC3000 SIMULATOR.vst3\*"; DestDir: "{app}\MPC3000 SIMULATOR.vst3"; Components: mpc3000; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "payload\Documentation\*"; DestDir: "{app}\GUCCI COLLECTION Documentation"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autodesktop}\GUCCI COLLECTION VST3 Folder"; Filename: "{sys}\explorer.exe"; Parameters: """{app}"""; Tasks: desktopicon

[Code]
function InitializeSetup(): Boolean;
var
  ZayBinary, MpcBinary: String;
begin
  Result := True;
  ZayBinary := ExpandConstant('{src}\payload\ZAY KEYS.vst3\Contents\x86_64-win\ZAY KEYS.vst3');
  MpcBinary := ExpandConstant('{src}\payload\MPC3000 SIMULATOR.vst3\Contents\x86_64-win\MPC3000 SIMULATOR.vst3');

  if not FileExists(ZayBinary) then begin
    if MsgBox('The ZAY KEYS VST3 payload is missing or incomplete. Continue anyway?', mbConfirmation, MB_YESNO) = IDNO then
      Result := False;
  end;

  if not FileExists(MpcBinary) then begin
    if MsgBox('The MPC3000 SIMULATOR VST3 payload is missing or incomplete. Continue anyway?', mbConfirmation, MB_YESNO) = IDNO then
      Result := False;
  end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = wpSelectComponents then begin
    if not WizardIsComponentSelected('zaykeys') and not WizardIsComponentSelected('mpc3000') then begin
      MsgBox('Select at least one instrument to install.', mbError, MB_OK);
      Result := False;
    end;
  end;
end;
