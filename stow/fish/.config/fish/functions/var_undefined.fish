function var_undefined --description "Check if the provided variable is undefined: i.e. zero-length"
  test (count $argv) -ge 1; and test -z $argv[1]
end
