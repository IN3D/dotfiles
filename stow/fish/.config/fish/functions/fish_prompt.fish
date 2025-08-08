function fish_prompt
   set -l last_status $status
   printf '%s' (prompt_pwd)

   if test $last_status -eq 0
     set_color green
   else
     set_color red
   end
   printf ' λ '

   set_color normal
end
