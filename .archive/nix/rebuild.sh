#!/run/current-system/sw/bin/sh

sudo cp *.nix /etc/nixos
sudo nixos-rebuild switch
