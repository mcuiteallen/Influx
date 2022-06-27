# Development

## Change Version

1. Using Advanced Installer to open installer/Windows/project.aip and edit ProductVersion.

## Build installer for Windows with digital signature

1. Run installer/Windows/archives.bat

2. Create a folder AdvIns in Digital Signature VM
  * \\\ESSVM-5\NonSigned\YourAccount\AdvIns

3. Copy below files and folder to Digital Signature VM into AdvIns folder
  * installer\Windows\archives
  * installer\Windows\EULA
  * installer\Windows\script
  * installer\Windows\project.aip

4. Copy below files to Digital Signature VM into AdvIns folder, it will trigger Digital Signature VM to build project.
  * installer\Windows\AdvanInsBuild.bat

5. After a while, installer will be generated in below path
  * \\\ESSVM-5\Signed\YourAccount\AdvIns
