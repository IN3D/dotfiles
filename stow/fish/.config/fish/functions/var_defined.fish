function var_defined --description "Check if the provided variable is defined"
  test (count $argv) -ge 1; and test -n $argv[1]
end
