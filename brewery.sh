if [ `uname` == "Darwin" ]; then
  for pak in `cat brewList`; do
    `brew install $pak`
  done
fi
