# vim: set foldmethod=marker:
{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;

  users.extraGroups.docker.members = [ "eric" ];

  # VirtualBox {{{
  # NOTE: this is the configuration to make VirtualBox work. I'm currently
  # running Zen kernel, and VBox has compatibility issues with it. If ever go
  # back to the standard Kernel *and* want VBox, uncomment this
  # virtualisation.virtualbox.host = {
  #   enable = true;
  #   # This is a pain to build, just skip it for now
  #   # enableExtensionPack = true;
  # };

  # users.extraGroups.vboxusers.members = [ "eric" ];

  # environment.systemPackages = with pkgs; [
  #   virtualbox
  # ];

  # boot.kernelModules = [ "vboxdrv" "vboxnetflt" "vboxnetadp" "vboxpci" ];

  # # Explicitly add these, user doesn't have permissions without
  # services.udev.packages = [ pkgs.virtualbox ];
  # }}}
}
