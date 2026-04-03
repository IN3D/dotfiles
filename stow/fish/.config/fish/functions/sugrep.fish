# Super grep: ripgrep when installed, else grep -R (same idea: -n -H -C 5, skip VCS dirs)
function sugrep
  if command_exists rg
    rg -C 5 -H --hidden \
      --glob '!**/.git/**' --glob '!**/.hg/**' --glob '!**/.svn/**' --glob '!**/CVS/**' \
      $argv
  else
    grep -R -n -H -C 5 --exclude-dir={.git,.hg,.svn,CVS}
  end
end
