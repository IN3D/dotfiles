# vim: set foldmethod=marker:
{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./graphical-tweaks.nix
      ./dev.nix
      ./virtualization.nix
      ./gaming-configuration.nix
    ];

  # Foundational setup {{{
  # This includes the bootloader, networking, sound, x11, etc

  # Setup the bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Detroit";

  # Select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # }}}

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eric = {
    isNormalUser = true;
    description = "eric";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Programs {{{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  # Unlike Firefox. this is Policy only, still need to install one or more
  # Chromium based browsers
  programs.chromium = {
    enable = true;
    # IDs are in the URL of the Chrome Web Store, last part of the path
    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
    ];
    # Find options ("policies") here: https://chromeenterprise.google/policies/
    extraOpts = {
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
    };
  };

  environment.systemPackages = with pkgs; [
    # --------------------------------------------------------------------------
    # Stuff that usually just exists on Linux systems. Ensure this exists for
    # the sake of compatibility
    gcc
    clang
    binutils
    perl
    python3
    gnumake
    # --------------------------------------------------------------------------
    aspell
    unzip
    chromium
    cmus
  ];

  programs.direnv.enable = true;

  # This enables support for traditional binaries, required for tools that
  # download or otherwise manage binaries. (Mason.nvim is an example)
  programs.nix-ld.enable = true;
  # }}}

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # For Electron apps on Wayland
    WLR_NO_HARDWARE_CURSORS = "1"; # Sometimes needed for Nvidia
  };

  services.openssh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.flatpak.enable = true;
  # Enable the Flatpak portal for better desktop integration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system.stateVersion = "25.05";
}
