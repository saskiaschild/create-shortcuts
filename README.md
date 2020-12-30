# create-shortcuts

This Powershell script is used to create shortcuts of programs on a custom path or on desktop by default. This script uses the folder's name as the name for the new shortcut. The path of the shortcut is the path to the .exe file inside the folder.

  


## Usage
```Powershell
script.ps1 -Path <path-of-program-folders> -Target <path-of-shortcuts>
```

## Example
There are two programs
* C:\Programs\Basic\exampe.exe
* C:\Programs\Foo\bar.exe

```Powershell
script.ps1 -Path C:\Programs
```
The script would create two shortcuts on the current user's desktop with names "Basic" and "Foo" with paths "C:\Programs\Basic\example.exe" and "C:\Programs\Foo\bar.exe".
