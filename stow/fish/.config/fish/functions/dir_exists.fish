function dir_exists --description "Check if provided directory exists"
  test (count $argv) -ge 1; and test -d $argv[1]
end
