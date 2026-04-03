# syntax sugar instead of writing `command -v foo > /dev/null 2>&1` all over the
# config file. Also helpful for checking in shell sessions
function command_exists --description "Check if provided command exists"
  test (count $argv) -ge 1; and command -v $argv[1] > /dev/null 2>&1
end