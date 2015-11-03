IFS='\n'
for c in `cat curls`; do
  `curl -O $c`
done
