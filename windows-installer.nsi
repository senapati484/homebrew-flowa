# Flowa Windows Installer Configuration
# This script creates a Windows installer (.exe) using NSIS

!include "MUI2.nsh"

# Define application information
!define PRODUCT_NAME "Flowa"
!define PRODUCT_VERSION "1.0.0"
!define PRODUCT_PUBLISHER "Flowa Language Team"
!define PRODUCT_WEB_SITE "https://github.com/yourusername/flowa"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

# Installer settings
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "..\\packaging\\flowa-installer-windows.exe"
InstallDir "$PROGRAMFILES64\Flowa"
InstallDirRegKey HKLM "Software\${PRODUCT_NAME}" ""
RequestExecutionLevel admin

# Modern UI Configuration
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

# Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\\LICENSE"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Languages
!insertmacro MUI_LANGUAGE "English"

# Installer sections
Section "Flowa Runtime" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  
  # Copy the main executable
  File "..\\build\\flowa.exe"
  
  # Copy standard library and examples
  SetOutPath "$INSTDIR\\stdlib"
  File /r "..\\stdlib\\*.*"
  
  SetOutPath "$INSTDIR\\examples"
  File /r "..\\examples\\*.*"
  
  # Create uninstaller
  WriteUninstaller "$INSTDIR\\uninst.exe"
  
  # Add to PATH
  ReadRegStr $0 HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path"
  StrCpy $0 "$0;$INSTDIR"
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path" $0
  
  # Send HWND_BROADCAST WM_SETTINGCHANGE message to notify of PATH change
  SendMessage ${HWND_BROADCAST} ${WM_SETTINGCHANGE} 0 "STR:Environment" /TIMEOUT=5000
  
  # Registry entries
  WriteRegStr HKLM "Software\${PRODUCT_NAME}" "" "$INSTDIR"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\\flowa.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

# Uninstaller section
Section Uninstall
  # Remove files
  Delete "$INSTDIR\\flowa.exe"
  Delete "$INSTDIR\\uninst.exe"
  RMDir /r "$INSTDIR\\stdlib"
  RMDir /r "$INSTDIR\\examples"
  RMDir "$INSTDIR"
  
  # Remove from PATH
  ReadRegStr $0 HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path"
  ${StrRep} $1 $0 ";$INSTDIR" ""
  ${StrRep} $0 $1 "$INSTDIR;" ""
  WriteRegStr HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "Path" $0
  
  # Send HWND_BROADCAST WM_SETTINGCHANGE message
  SendMessage ${HWND_BROADCAST} ${WM_SETTINGCHANGE} 0 "STR:Environment" /TIMEOUT=5000
  
  # Remove registry entries
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "Software\${PRODUCT_NAME}"
SectionEnd
