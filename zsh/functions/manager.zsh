manager() {
  case $1 in
    'apt') cat ~/.config/zsh/managers/apt.txt;;
    'brew') cat ~/.config/zsh/managers/brew.txt;;
    'dnf') cat ~/.config/zsh/managers/yum.txt;;
    'pacman') cat ~/.config/zsh/managers/pacman.txt;;
    'yum') cat ~/.config/zsh/managers/yum.txt;;
    'zypper') cat ~/.config/zsh/managers/zypper.txt;;
    *) echo 'Not a packages manager with documentation'
  esac
}
