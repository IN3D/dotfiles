function timestamp -d "Prefix the provided file with a `YYYYMMDD_` timestamp, if not already timestamped"
  if test (count $argv) -eq 0
    echo "Usage: timestamp <filename> [filename2 ...]"
    return 1
  end

  for file in $argv
    # Check if file exists
    if not test -e $file
      echo "Error: File '$file' does not exist"
      continue
    end

    # Check if it already has YYYYMMDD_ prefix
    if string match -q -r '^[0-9]{8}_' $file
      continue
    end

    # Get creation date in YYYYMMDD format
    set date_prefix (stat -c '%w' $file 2>/dev/null | cut -d' ' -f1 | tr -d '-')
    # Fallback to modification time if creation time is unavailable
    if test -z $date_prefix -o $date_prefix = '-'
      set date_prefix (stat -c '%Y' $file | xargs -I {} date -d @{} +%Y%m%d)
    end

    set new_name $date_prefix"_"$file
    mv $file $new_name
  end
end
