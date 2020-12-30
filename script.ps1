param (
    [Parameter(Mandatory = $true)][String]$Path,
    [String]$TargetPath = "$($HOME)\Desktop"
)
function Get-Path-Exists() {
    [OutputType([Boolean])]
    param (
        [Parameter(Mandatory = $true)][String]$Path
    )
    
    return [System.IO.File]::Exists($Path)
}

function Get-Sanitized-Path {
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $true)][String]$Path
    )
        
    $Path = $Path.Trim()
    if (!$Path.EndsWith("\")) {
        $Path += "\"
    }
        
    return $Path
}

$Path = Get-Sanitized-Path -Path $Path
$TargetPath = Get-Sanitized-Path -Path $TargetPath

if ((Get-Path-Exists -Path $Path) -or (Get-Path-Exists -Path $TargetPath)) {
    exit
}

$WScriptShell = New-Object -ComObject WScript.Shell

Get-ChildItem -Attributes Directory -Path $Path |
ForEach-Object {
    $FolderPath = "$($Path)$($_.Name)"
    $File = Get-ChildItem -Attributes Hidden -Path $FolderPath
    $SourceFilePath = "$($FolderPath)\$($File.Name)"
    $TargetFilePath = "$($TargetPath)$($_.Name).lnk"
    
    $Shortcut = $WScriptShell.CreateShortcut($TargetFilePath)
    $Shortcut.TargetPath = $SourceFilePath
    $Shortcut.Save()
}
