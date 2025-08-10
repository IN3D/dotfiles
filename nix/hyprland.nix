{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Required for Hyprland
  security.polkit.enable = true;

  # Enable XDG portals for better app integration
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    # Window manager and core tools
    hyprland
    hyprpaper       # wallpaper manager
    hyprlock        # screen locker
    hypridle        # idle daemon
    hyprpicker      # color picker
    hyprshot        # screenshot tool

    # Wayland utilities
    waybar          # status bar
    mako            # notification daemon
    tofi            # program launcher
    swaybg          # wallpaper setter
    swayosd         # OSD notifications
    wl-clipboard    # Wayland clipboard utilities
    wl-clip-persist

    # Media and system control
    brightnessctl   # brightness control
    playerctl       # media player control
    pamixer         # pulse audio mixer

    # Screenshot and screen recording
    grim            # screenshot tool
    slurp           # screen region selector
    satty           # screenshot annotation
    wf-recorder     # screen recorder

    # File management and utilities
    nautilus        # file manager
    sushi           # file previewer for nautilus

    # Drive mounting and filesystem support
    udisks2         # disk mounting service
    gvfs            # virtual filesystem support
    ntfs3g          # NTFS filesystem support
  ];

  # Services
  services = {
    # Display manager that works well with Hyprland
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };

    # Enable pipewire for audio (already enabled in your config but good to be explicit)
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    # Drive mounting support
    udisks2.enable = true;
    gvfs.enable = true;

    # GNOME services for authentication
    gnome.gnome-keyring.enable = true;
  };

  # Fonts (important for Waybar and overall UI)
  fonts.packages = with pkgs; [
    nerd-fonts.droid-sans-mono
    font-awesome
  ];

  # Environment variables for Hyprland
  environment.sessionVariables = {
    # Wayland-specific
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # Fix for some applications
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";

    # NVIDIA specific (you already have these in configuration.nix)
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # User-specific configuration will go in dotfiles
  # This module just sets up the system-level requirements
}
