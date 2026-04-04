function list_fonts --description "Human readable fc-list"
  fc-list : family | tr ',' '\n' | sed 's/^ //' | sort -u
end
