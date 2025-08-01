# This file is for tweaking additional performance out of a Nvidia graphics card

{ config, pkgs, ... }:

{
  # Enable OpenGL/graphics support
  # NOTE: `hardware.graphics` replaces `hardware.opengl`
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    # Use open source kernel modules. Nvidia reccomends this for Turing gen
    # cards and newer
    open = true;

    # Enable the settings menu
    nvidiaSettings = true;

    # Select the appropriate driver version, prefer the stable version
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # power management (usually for laptops, unnecessary on desktops)
    powerManagement.enable = false;

    # Modesetting is needed for Wayland
    modesetting.enable = true;

    # prime.offload.enableOffloadCmd = true; # for hybrid graphics
    forceFullCompositionPipeline = false; # Can interfere with Wayland
  };

  # Loads nvidia drivers for Wayland as well, not just xserver
  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    # provides utilities for interacting with OpenGL and Mesa
    mesa-demos
  ];

  environment.sessionVariables = {
    # For Nvidia Wayland support
    GBM_BACKEND = "nvidia-drm";
    # __NV_PRIME_RENDER_OFFLOAD = "0"; # disables prime offloading
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };
}
