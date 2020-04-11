function idea() {
  if test -z "$1"; then
    project=`pwd`
  else
    project="$1:A"
  fi
  open -na "PhpStorm.app" --args "$project"
}

