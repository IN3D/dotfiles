# Hops' dot files

![Medieval Dragon](https://github.com/user-attachments/assets/a5178471-8c6d-4b50-a6a2-6796e88fcee7 "Medieval Dragon")

Here be dragons

## Setup

My setup uses GNU stow for dotfile management.

Bash has aliases of `stow-link` and `stow-unlink`, otherwise run:
```sh
stow -d ~/.dotfiles/stow -t ~ x y z
```

Where x, y, and z are any of the names of any of the `stow/` subdirectories.

## Nix

My current desktop is running NixOS. The `nix/` directory contains its config
files. There's also a simple script to copy the files into the default `/etc/nixos/`
directory and trigger a rebuild.

## Archive

The `.archive/` directory is for configs I used at one point, but no longer do
for one reason or another. Rather than spelunk through Git commits to find them
if I ever want to use them again, I simply put it in `.archive/`.

