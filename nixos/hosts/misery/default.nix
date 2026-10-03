{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core/default.nix
    ../../modules/hardware/nvidia/default.nix
    ../../modules/compositors/niri/default.nix
    ../../modules/gaming/default.nix
  ];

  # --- Display Manager -------------------------------------------------------
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  # --- Swap ------------------------------------------------------------------
  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 4096;
    priority = 10;
  }];

  # --- Programs --------------------------------------------------------------
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.icu
      ];
    };
  };

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  # --- System Packages -------------------------------------------------------
  environment.systemPackages = with pkgs; with kdePackages; [
    nvtopPackages.nvidia
    pulseaudio
    cmatrix
    jq

    gcc
    gnumake
    clang
    clang-tools
    nodejs

    ripgrep
    neovim
    tmux
    gh

    brave
    spotify
    discord
    kdenlive
    inkscape
    obs-studio
    libreoffice
    vlc
  ];
}
