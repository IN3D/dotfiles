IFS=$'\n'
for c in `cat clones`; do
  `git clone https://github.com/$c`
done
