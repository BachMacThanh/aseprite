#define MyAppName "Aseprite"
#define MyAppPublisher "Aseprite Team"
#define MyAppURL "https://www.aseprite.org/"
#define MyAppExeName "aseprite.exe"

[Setup]
AppId={{42138032-0D08-4A83-B5EE-AEA13912991E}
AppName={#MyAppName}
AppVersion={#AppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\LICENSE.txt
OutputDir=..\
OutputBaseFilename=aseprite-{#AppVersion}-windows-{#Architecture}-installer
SetupIconFile=..\data\icons\ase256.png
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed={#ArchitecturesAllowed}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "associateaseprite"; Description: "Associate .ase/.aseprite files"; GroupDescription: "File associations:"; Flags: checkedonce
Name: "associateanimation"; Description: "Associate .gif/.webp files"; GroupDescription: "File associations:"; Flags: unchecked

[Files]
Source: "..\build\bin\aseprite.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\bin\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKCR; Subkey: ".ase"; ValueType: string; ValueName: ""; ValueData: "AsepriteImage"; Flags: uninsdeletevalue; Tasks: associateaseprite
Root: HKCR; Subkey: ".aseprite"; ValueType: string; ValueName: ""; ValueData: "AsepriteImage"; Flags: uninsdeletevalue; Tasks: associateaseprite
Root: HKCR; Subkey: "AsepriteImage"; ValueType: string; ValueName: ""; ValueData: "Aseprite Image"; Flags: uninsdeletekey; Tasks: associateaseprite
Root: HKCR; Subkey: "AsepriteImage\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"; Tasks: associateaseprite
Root: HKCR; Subkey: "AsepriteImage\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Tasks: associateaseprite

Root: HKCR; Subkey: ".gif"; ValueType: string; ValueName: ""; ValueData: "AsepriteAnimation"; Flags: uninsdeletevalue; Tasks: associateanimation
Root: HKCR; Subkey: ".webp"; ValueType: string; ValueName: ""; ValueData: "AsepriteAnimation"; Flags: uninsdeletevalue; Tasks: associateanimation
Root: HKCR; Subkey: "AsepriteAnimation"; ValueType: string; ValueName: ""; ValueData: "Aseprite Animation"; Flags: uninsdeletekey; Tasks: associateanimation
Root: HKCR; Subkey: "AsepriteAnimation\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"; Tasks: associateanimation
Root: HKCR; Subkey: "AsepriteAnimation\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Tasks: associateanimation
