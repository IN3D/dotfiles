########################################
# Pacman flags can be esoteric...
# -Ss = search
# -Qs = search local
# -Si = package info
# -Qi = local package info
# -Qdt = "It's not a meat grinder, it's an orphan stomper -- llamas with hats"
# -Sy = update database, no upgrade (analogus to apt-get update)
# -Syy = forced database refresh
# -Syu = update mirriors and upgrade (apt-get update && apt-get upgrade)
# -S = install
# -U = install from a local file
# -R = remove
# -Rns = remove, along with configuration and dependencies
########################################
alias pacs='pacman -Ss'
alias pacqs='pacman -Qs'
alias pacsi='pacman -Si'
alias pacqi='pacman -Qi'
alias pacorph='pacman -Qdt'
alias pacy='sudo pacman -Sy'
alias pacyy='sudo pacman -Syy'
alias pacyu='sudo pacman -Syu'
alias paci='sudo pacman -S'
alias pacil='sudo pacman -U'
alias pacr='sudo pacman -R'
alias pacR='sudo pacman -Rns'

# Yaourt ------------------------
alias yacon='yaourt -C'
alias yass='yaourt -Ss'
alias yasi='yaourt -Si'
alias yaqi='yaourt -Qi'
alias yaqs='yaourt -Qs'
alias yaorph='yaourt -Qtd'
alias yau='sudo yaourt -Syua'
alias yai='sudo yaourt -S'
alias yail='sudo yaourt -U'
alias yar='sudo yaourt -R'
alias yaR='sudo yaourt -Rns'
