set -e

if [ ! -d $HOME/GitHub ]; then
  mkdir $HOME/GitHub
fi
cd $HOME/GitHub

IFS=$'\n'
for c in `cat $HOME/.config/.setup/clones`; do
  `git clone https://github.com/$c`
done
