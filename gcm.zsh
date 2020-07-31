
function gcm() {

  if git -P branch --list | grep "main$" > /dev/null; then
    git checkout main
  else
    git checkout master
  fi

}
