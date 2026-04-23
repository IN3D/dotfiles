# Prerequisites

This directory contains all my old nix scripts. There's also a simple script to
copy the files into the default `/etc/nixos/` directory and trigger a rebuild.

Before installing, this config is dependent on two other channels, the official
`unstable` channel, as well as the NUR. This has to be run before an rebuild
will succeed.

```sh
nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --add https://github.com/nix-community/NUR/archive/main.tar.gz nur
nix-channel --update
```

