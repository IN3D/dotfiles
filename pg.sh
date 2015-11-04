# setup postgresql on OS X
if [ `uname` == "Darwin" ]; then
  initdb /usr/local/var/postgres
  mkdir -p ~/Library/LaunchAgents
  ln -svf /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  createdb `whoami`
fi
