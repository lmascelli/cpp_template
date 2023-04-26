function build {
  New-Item -Type Directory -Path build -ErrorAction Ignore
  Push-Location build
  cmake -G"Ninja" ..
  cmake --build .
  Pop-Location
}

function run {
  param (
      $command = "test"
      )
    Push-Location build
    ./$command
    Pop-Location
}

switch($args[0]) {
  "build" {
    build
  }

  "run" {
    build
    run $args[1]
  }

  default {
    run
  }
}
