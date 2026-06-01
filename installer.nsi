; NSIS Installer Script for Flutter Windows App
; Place this file in your project root directory

!include "MUI2.nsh"

; Basic Settings
Name "Flutter App"
OutFile "FlutterApp-Setup.exe"
InstallDir "$PROGRAMFILES\FlutterApp"
InstallDirRegKey HKCU "Software\FlutterApp" ""

; MUI Settings - Install Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

; Installer Section
Section "Install"
  SetOutPath "$INSTDIR"
  
  ; Copy application files from build output
  File /r "build\windows\runner\Release\*.*"
  
  ; Create Start Menu folder
  CreateDirectory "$SMPROGRAMS\FlutterApp"
  
  ; Create Start Menu shortcuts
  CreateShortCut "$SMPROGRAMS\FlutterApp\Flutter App.lnk" "$INSTDIR\flutter_app.exe"
  CreateShortCut "$SMPROGRAMS\FlutterApp\Uninstall.lnk" "$INSTDIR\uninstall.exe"
  
  ; Create Desktop shortcut
  CreateShortCut "$DESKTOP\Flutter App.lnk" "$INSTDIR\flutter_app.exe"
  
  ; Write uninstaller
  WriteUninstaller "$INSTDIR\uninstall.exe"
  
  ; Write registry for uninstall in Control Panel
  WriteRegStr HKCU "Software\FlutterApp" "" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FlutterApp" "DisplayName" "Flutter App"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FlutterApp" "UninstallString" "$INSTDIR\uninstall.exe"
SectionEnd

; Uninstaller Section
Section "Uninstall"
  ; Remove installed files
  RMDir /r "$INSTDIR"
  
  ; Remove Start Menu shortcuts
  RMDir /r "$SMPROGRAMS\FlutterApp"
  
  ; Remove Desktop shortcut
  Delete "$DESKTOP\Flutter App.lnk"
  
  ; Remove registry entries
  DeleteRegKey HKCU "Software\FlutterApp"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FlutterApp"
SectionEnd
