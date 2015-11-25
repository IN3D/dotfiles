# prints a small clock on the screen
clock() {
  while true;do
    clear
    echo "==========="
    date +"%r"
    echo "==========="
    sleep 1
  done
}
