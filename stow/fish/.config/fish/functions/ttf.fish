# ttf == "touch timestamped file"
function ttf --description "Touch Timestamped File"
  set timestamp (date +%Y%m%d)
  touch {$timestamp}_$argv[1]
end
