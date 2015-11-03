IFS='\n'
if [ `uname` == "Darwin" ]; then
  for tap in `cat brewTaps`; do
    `brew tap $tap`
  done
  for pak in `cat brewList`; do
    `brew install $pak`
  done
fi
