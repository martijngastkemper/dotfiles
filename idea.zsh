function idea() {
  if test -z "$1"; then
    project=`pwd`
  else
    project="$1:A"
  fi

  if test ! -d "$project"; then
    echo "Path $project does not exists"
    return 1
  fi

  open -na "PhpStorm.app" --args "$project" || (test -e "$project/README.md" && vim "$project/README.md" || vim "$project" )
}

