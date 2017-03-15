function git_landscaping {
  if in_git_directory; then
    remote=`git config --get remote.origin.url`
    for branch in `git branch`; do
      # NOTE: this is a side effect of spliting the branches. The current
      # branch will be listed as `* branch-name` and the star is turned into
      # it's own line when you split branches.
      if ! [ "$branch" = "*" ]; then
        exists=`git ls-remote --heads $remote $branch | wc -l | sed -e 's/^[ \t]*//'`

        if [ $exists = "0" ]; then
          echo "Delete branch? $branch [y/n]"
          read yn
          case $yn in
            [Yy] ) git branch -D $branch;;
            * ) echo "Left $branch in place";;
          esac
        fi
      fi
    done
  else
    echo "You're not in a git directory"
  fi
}
