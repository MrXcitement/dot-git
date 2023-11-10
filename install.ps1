# install.ps1 -- Install the git config files

# Mike Barker <mike@thebarkers.com>
# July 23rd, 2018

# Test-SymbolicLink
Function Test-SymbolicLink([string]$path) {
    $file = Get-ChildItem $path -Force -ea SilentlyContinue
    Return [bool]($file.LinkType -eq "SymbolicLink")
}

# Backup an existing file
Function Backup-File([string]$file) {
    # If the file/folder exists and is not a link
    if ((Test-Path $link) -And (-Not (Test-SymbolicLink $link))) {
        # backup the file/folder
        Write-Warning "Backup $link $link.backup"
        Move-Item -Path $link -Destination "$($link).backup"
    }
}

# Link a file to a target
Function Link-File([string]$link, [string]$target) {

    # Backup existing link file
    Backup-File $link

    # If the link does not exist
    if (-Not (Test-Path $link)) {
        # Create a link to file/folder
        Write-Output "Linking: $($link) to $($target)"
        New-Item -ItemType SymbolicLink -Path $link -Value $target -Force | Out-Null
    }
}

Link-File "~/.gitconfig" "$PSScriptRoot/home/.gitconfig"
Link-File "~/.gitconfig-os" "$PSScriptRoot/home/.gitconfig-windows"
Link-File "~/.gitignore_global" "$PSScriptRoot/home/.gitignore_global"
