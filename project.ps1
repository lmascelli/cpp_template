$project = Split-Path -Path (Get-Location) -Leaf
# this envoronment variable is used to locally install conan binaries if this
# package manager is used
$env:CONAN_HOME="$((Get-Location).Path)/devel/conan"

function _Build([string[]] $arg_list)
{
  New-Item -Type Directory -Path build -ErrorAction Ignore
  Push-Location build
  cmake -G"Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON $arg_list ..
  cmake --build .
  Pop-Location
}

function _Run
{
  Push-Location build
  $command = './' + $project
  Invoke-Expression $command
  Pop-Location
}

switch ($args[0])
{
  "build"
  {
    _Build $args[1..($args.Length)]
  }

  "run"
  {
    _Build $args[1..($args.Length)]
    _Run
  }

  "clean"
  {
    Remove-Item -Force -Recurse -Path "./build" -ErrorAction Ignore
  }
  
  default
  {
    run
  }
}
