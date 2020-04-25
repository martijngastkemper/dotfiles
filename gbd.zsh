
function gbd () {

    if ! git branch --delete $1; then
        read -q "FORCE?Do you want to force delete the branch?"
        printf "\n"

        if test "$FORCE" = "y"; then
          git branch --delete --force $1
        fi
    fi

}
