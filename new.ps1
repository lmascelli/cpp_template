function Script:PrintHelp {
  param (
  )
  Write-Output @"
################################################################################
#                                                                              #
#                            LEONARDO MASCELLI                                 #
#                                                                              #
#                       C/C++ CMake project template                           #
#                                                                              #
################################################################################

Usage:

./new.ps1 PATH                initialize a project it PATH
"@
}

function Script:Initialize {
  param (
    [String]$path
  )
  $isvalid = (Test-Path -Path $path -IsValid)
  $exists = (Test-Path -Path $path)
  if ($isvalid) {
    if ($exists) {
      [String]$answer = Read-Host -Prompt "Choosen destination $path already exists. Overwrite present files? (y/n)"
      if ($answer -ne "y" -or - $answer -ne "Y") {
        Return
      }
    }
    else {
      New-Item -ItemType Directory $path -ErrorAction Stop
    }
    Copy-Item -Recurse -Force -Destination $path -Path .\src
    Copy-Item -Recurse -Force -Destination $path -Path .\include
    Copy-Item -Recurse -Force -Destination $path -Path .\cmake
    Copy-Item -Recurse -Force -Destination $path -Path .\CMakeLists.txt
    Copy-Item -Recurse -Force -Destination $path -Path .\project.ps1
    Copy-Item -Recurse -Force -Destination $path -Path .\.clang-tidy
    Copy-Item -Recurse -Force -Destination $path -Path .\.gitignore
  }
}

if ($args.Length -eq 0) {
  PrintHelp
}
else {
  Initialize $args[0]
  Set-Location $args[0]
}
