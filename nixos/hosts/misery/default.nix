{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core/default.nix
    ../../modules/system/kernel/default.nix
    ../../modules/hardware/nvidia/default.nix
    ../../modules/compositor/niri/default.nix
    ../../modules/gaming/default.nix
  ];

  # --- Kernel ----------------------------------------------------------------
  kernel.cachyos.enable = false;
  kernel.cachyos.variant = "lts";

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

  # --- User Account ----------------------------------------------------------
  users.users.loser = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # sudo access
      "networkmanager" # manage network connections without sudo
      "video" # access to video devices
      "audio" # access to audio devices
      "input" # access to input devices (controllers, etc)
      "gamemode" # access to GameMode daemon
    ];
  };

  # --- Display Manager -------------------------------------------------------
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  # --- Fonts -----------------------------------------------------------------
  fonts.packages = with pkgs; [ iosevka nerd-fonts.iosevka ];

  # --- System Packages -------------------------------------------------------
  environment.systemPackages = with pkgs; with kdePackages; [
    gh
    dust
    procs
    p7zip
    pulseaudio

    ripgrep
    neovim
    tmux
    gcc
    clang
    gnumake

    brave
    spotify
    discord
    obs-studio
    libreoffice
    kdenlive
    inkscape
    vlc
  ];

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
}
