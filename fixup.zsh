
function fixup () {
    commit=`git rev-parse HEAD`
    if (( $# >= 1 )); then
      # When the first argument is a valid rev use it
      git rev-parse -q --verify "$1"
      if git rev-parse -q --verify "$1" > /dev/null; then
         commit="$1"
         shift 1 # the remaining arguments must be appended to the git command
      fi
    fi
    git commit -q --fixup=$commit "$@"
}

