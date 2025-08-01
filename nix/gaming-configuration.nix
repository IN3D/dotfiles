# NOTE: this file has an implied dependency on `graphical-tweaks.nix`, and on
# the default audio configuration in `configuration.nix`. If either of those are
# ever removed. Most of their settings would need to be recreated here.
{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;

    # NOTE: uncomment this if having compatability issues
    # extraCompatPackages = with pkgs; [
    #   proton-ge-bin # Community enhanced version with additional packages/fixes
    # ];
  };

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  # Memory and storage optimizations ===========================================

  # File system optimization. Disables access time tracking on the root file
  # system. Minor optimization, squeezes a little performance out. Also extends
  # the life of drives a little bit.
  fileSystems."/".options = [ "noatime" "nodiratime" ];

  # Gaming specific packages ===================================================

  environment.systemPackages = with pkgs; [
    # Gaming tools
    lutris
    heroic
    bottles
    mangohud
    goverlay

    # Improves font rendering in some Windows games
    corefonts

    # Adds support for Windows libraries required by some games
    protontricks

    # Wine and compatibility
    wineWowPackages.stable
    winetricks
  ];

  # Network optimizations ======================================================

  networking.firewall = {
    allowedTCPPorts = [ 27036 27037 ];
    allowedUDPPorts = [ 27031 27036 ];
  };
}
