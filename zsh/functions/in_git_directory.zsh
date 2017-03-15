function in_git_directory {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1
}
