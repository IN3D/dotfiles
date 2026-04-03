# I think I got the original version of this from Kevin in 2016?
function sugrep --description "\"Super grep\" show header with 5 numbered lines of context"
  if command_exists rg
    rg -C 5 -H --hidden \
      --glob '!**/.git/**' --glob '!**/.hg/**' --glob '!**/.svn/**' --glob '!**/CVS/**' \
      $argv
  else
    grep -R -n -H -C 5 --exclude-dir={.git,.hg,.svn,CVS}
  end
end
