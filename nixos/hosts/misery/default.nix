{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core/default.nix
    ../../modules/system/kernel/default.nix
    ../../modules/hardware/driver/default.nix
    ../../modules/compositor/niri/default.nix
    ../../modules/gaming/default.nix
  ];

  kernel.cachyos.enable = false;
  hardware.gpu = "nvidia";

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

  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

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

  fonts.packages = with pkgs; [ iosevka nerd-fonts.iosevka ];

  environment.systemPackages = with pkgs; with kdePackages; [
    git
    gh
    curl
    wget
    htop
    btop
    unzip
    tree
    dust
    fastfetch

    foot
    fuzzel
    waybar
    swaybg
    libnotify
    mako
    nautilus
    sushi
    xwayland-satellite

    pulseaudio
    pavucontrol
    playerctl

    neovim
    ripgrep
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
}
