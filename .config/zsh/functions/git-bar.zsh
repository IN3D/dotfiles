git-bar() {
  for rev in `git rev-list --reverse HEAD`; do
    num=`git ls-tree -r $rev | awk '{print $3}' | xargs git show | wc -l | tr -d ' '`
    bar=`echo $num / 100 | bc`
    sha=`git log --oneline -1 $rev | awk '{print $1}'`
    printf "\033[0;33m$sha\033[0m $num "
    printf '\033[1;32m=%.0s\033[0m' $(seq 1 $bar); echo ""
  done
}
