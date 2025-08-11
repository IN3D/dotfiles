# Hops dotfiles

## Here be dragons

![My desktop](https://github.com/in3d/dotfiles/blob/master/attachments/desktop.png)

Inspiration is encouraged, but unknown how well it will work for anyone else.

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

Before installing, this config is dependent on two other channels, the official
`unstable` channel, as well as the NUR. This has to be run before an rebuild
will succeed.

```sh
nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --add https://github.com/nix-community/NUR/archive/main.tar.gz nur
nix-channel --update
```

## Archive

The `.archive/` directory is for configs I used at one point, but no longer do
for one reason or another. Rather than spelunk through Git commits to find them
if I ever want to use them again, I simply put it in `.archive/`.

