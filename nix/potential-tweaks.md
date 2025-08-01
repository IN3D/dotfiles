# Potential tweaks for the future

This is for keeping track of configurations that I'm aware of, but that I don't
currently want to use. However, I don't want to leave a bunch of blocks of
commented out code.

## From default config

Lines that came commented out by default. I don't want to forget what they were,
and to keep them easily at hand. But without them taking up space in the config
file.

Header comment
```nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
```

Network settings
```nix
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
```

Additional audio configuration (inside pipewire settings)
```nix
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
```

Touchpad
```nix
# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;
```

```nix
# List packages installed in system profile. To search, run:
# $ nix search wget

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;

# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:
```

Firewall config
```nix
# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;
```

State version comment
```nix
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

# Did you read the comment?
```

## Gaming tweaks

### Memory and storage optimizations

```nix
# This compresses RAM swap. Instead of using the disk, it puts unused memory
# pages into RAM. Typically more useful for more RAM constrained systems.
# Unlikely to be of use to me, but keeping it in the back pocket.
zramSwap.enable = true;
```

### Kernel and scheduling optimizations

```nix
# Swap the default Linux kernel for the Zen kernel. Is more performance
# focused than the regular, generalist kernel. Consider enabling this if
# games seem like they aren't running as fast as they could be.
boot.kernelPackages = pkgs.linuxPackages_zen;

# CPU governor
powerManagement.cpuFreqGovernor = "performance";

# These are (potentially) dangerous kernel params.
# "mitigations" disables protections against vulnerabilities like Spectre,
# Meltdown, Heartbleed, etc. Depending on the task, these can do very little,
# or give up to a potential 20% CPU performance boost. These are near certainly
# not worth it, outside of some kind of completely offline gaming PC.
#
# "split_lock_detect" Some games will throw false positive split locks which
# cause stuttering. This stops the CPU from detecting them. Would be a problem
# if a real split lock happened though. Like mitigations, probably not worth
# it, but can increase CPU performance.
boot.kernelParams = [
  "mitigations=off"
  "split_lock_detect=off"
];
```
