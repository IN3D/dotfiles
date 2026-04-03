function create_local_config -d "Append 1Password secrets to ~/.config/fish/local.fish using ~/.config/fish/local.opmap (TSV); optional path overrides the map file"
  if not command_exists op
    echo "create_local_config: 1Password CLI (op) is not installed or not on PATH" >&2
    return 1
  end
  if not command_exists jq
    echo "create_local_config: jq is not installed or not on PATH" >&2
    return 1
  end

  set -l mapfile $HOME/.config/fish/local.opmap
  if test (count $argv) -ge 1
    set mapfile $argv[1]
  end

  if not test -f $mapfile
    echo "create_local_config: map file not found: $mapfile" >&2
    echo "Expected TSV (tab-separated): 1Password item title, then env var name. Use # for comments." >&2
    return 1
  end

  set -l outfile $HOME/.config/fish/local.fish
  set -l fish_dir $HOME/.config/fish
  if not test -d $fish_dir
    mkdir -p $fish_dir
    or begin
      echo "create_local_config: could not create $fish_dir" >&2
      return 1
    end
  end

  set -l export_lines
  while read -l line
    set -l trimmed (string trim -- $line)
    test -z "$trimmed"; and continue
    string match -q '#*' -- $trimmed; and continue

    set -l parts (string split --max 2 \t -- $trimmed)
    if test (count $parts) -lt 2
      echo "create_local_config: line must be title<TAB>VAR_NAME (got: $line)" >&2
      return 1
    end

    set -l title (string trim -- $parts[1])
    set -l ename (string trim -- $parts[2])
    if test -z "$title"
      echo "create_local_config: empty 1Password item title (line: $line)" >&2
      return 1
    end
    if test -z "$ename"
      echo "create_local_config: empty variable name for item \"$title\"" >&2
      return 1
    end
    if not string match -qr '^[A-Za-z_][A-Za-z0-9_]*$' -- $ename
      echo "create_local_config: invalid variable name \"$ename\" (use export-style identifiers)" >&2
      return 1
    end

    set -l jf (mktemp)
    or begin
      echo "create_local_config: mktemp failed" >&2
      return 1
    end

    op item get "$title" --format json >$jf 2>/dev/null
    set -l op_stat $status
    if test $op_stat -ne 0
      rm -f $jf
      echo "create_local_config: op item get failed for \"$title\"" >&2
      return 1
    end

    set -l val (jq -r '.fields[0].value' <$jf)
    set -l jq_stat $status
    rm -f $jf
    if test $jq_stat -ne 0
      echo "create_local_config: jq failed for \"$title\"" >&2
      return 1
    end

    if test -z "$val"
      echo "create_local_config: empty secret for \"$title\" (fields[0].value)" >&2
      return 1
    end

    set -l escaped (string escape --style=script -- $val)
    set -a export_lines "set -gx $ename $escaped"
  end <$mapfile

  if test (count $export_lines) -eq 0
    echo "create_local_config: no entries found in $mapfile" >&2
    return 1
  end

  printf '\n# create_local_config %s\n' (date -Iseconds) >>$outfile
  for el in $export_lines
    printf '%s\n' $el >>$outfile
  end
end
