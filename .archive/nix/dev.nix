{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
  nur = import <nur> { pkgs = import <nixpkgs> { config = config.nixpkgs.config; }; };

  # My absolute core tools
  core_tools = with pkgs; [
    neovim
    tmux
    ghostty
  ];

  # Generally useful dev cli tools. I should probably think of better groups
  # for this stuff in the future
  generic = with pkgs; [
    ansible
    universal-ctags
    stow
    tldr
    hyperfine
    bat
    lazydocker
    lazysql
    thefuck
    eza
    tokei
    miller     # CSV/JSON/etc CLI processor
    jq         # CLI JSON processor
    yq         # CLI YAML processor
    xmlstarlet # CLI XML processor
    fd         # modern find replacement
    zoxide     # smart cd replacement
  ];

  # Programs that are just for fun, ricing, etc
  fun = with pkgs; [
    neofetch
    fastfetch
    onefetch
    cowsay
    fortune
  ];

  # Tools for looking stuff up, finding things, etc
  search = with pkgs; [
    ripgrep
    silver-searcher
    platinum-searcher
    fzf
  ];

  # All AI programs, from editors to CLI tools
  # NOTE: many of these are under very active development and make more sense
  # to run off the unstable channel to be as up-to-date as possible.
  ai_tools = with pkgs; [
    code-cursor
  ] ++ [
    unstable.zed-editor
    unstable.windsurf
    unstable.claude-code
  ];

  # system monitoring
  monitoring = with pkgs; [
    htop
    btop
  ];
  
  # Anything to do with networks, connections, etc
  networking = with pkgs; [
    curl
    wget
    netcat
    nmap
  ];

  # A whole mix of stuff. Only thruline is that they're programs I'm
  # experimenting with
  experiments = with pkgs; [
    opencode # very recently archived
    lazygit # I know get very well, but might still be nice to try out
    emacs-pgtk # Don't think I'll ever fully get away from this editor
    gh # GitHub CLI tool
    fish # It's been years, try this again
    zellij # I'm a longtime tmux user, but worth giving a shot
  ] ++ [
    nur.repos.charmbracelet.crush # *just* released to replace opencode
  ];
in
{
  # Ensure that git is installed, and that LFS is enabled
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  services.open-webui.enable = true;

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  environment.systemPackages =
    core_tools
    ++ generic
    ++ search
    ++ monitoring
    ++ networking
    ++ ai_tools
    ++ fun
    ++ experiments;
}
