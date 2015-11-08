ll () {
  ls -l
}

ret () {
  cd "$OLDPWD"
}

weblog () {
  tail -25 /var/log/apache2/error_log
}

syslog () {
  tail -10 /var/log/system.log
}

get_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [01;37m(\1)[0m/'
}

