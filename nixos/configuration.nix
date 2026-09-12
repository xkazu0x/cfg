{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "misery";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = config.i18n.defaultLocale;
    LC_IDENTIFICATION = config.i18n.defaultLocale;
    LC_MEASUREMENT = config.i18n.defaultLocale;
    LC_MONETARY = config.i18n.defaultLocale;
    LC_NAME = config.i18n.defaultLocale;
    LC_NUMERIC = config.i18n.defaultLocale;
    LC_PAPER = config.i18n.defaultLocale;
    LC_TELEPHONE = config.i18n.defaultLocale;
    LC_TIME = config.i18n.defaultLocale;
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,br";
      variant = "";
      options = "grp:win_shift_toggle";
    };
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.dconf.enable = true;
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    configPackages = [ pkgs.niri ];
  };

  security.pam.services.login.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;

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

  # --- Audio -----------------------------------------------------------------
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- Kernel ----------------------------------------------------------------
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };

  # --- Hardware --------------------------------------------------------------
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = pkgs.nvidia_cachyos; # config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ rocmPackages.clr ];
  };

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

  # --- Users -----------------------------------------------------------------
  users.users.loser = {
    isNormalUser = true;
    description = "loser";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # --- Packages --------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    pulseaudio
    pavucontrol

    libnotify
    fastfetch
    ripgrep
    dysk
    wget
    zip
    unzip
    btop
    git
    gh
    gcc
    clang
    gnumake
    usbutils

    foot
    fuzzel
    swaybg
    waybar
    mako
    tmux

    librewolf
    brave
    neovim
    spotify
    discord
    nautilus
    obs-studio
    libreoffice
    kdePackages.kdenlive
    inkscape
    vlc

    sushi
    zenity
    xdg-desktop-portal
    xwayland-satellite
  ];

  # --- Font ------------------------------------------------------------------
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    iosevka
  ];

  # --- Settings --------------------------------------------------------------
  nixpkgs.config.allowUnfree = true;

  # system.autoUpgrade = {
  #   enable = false;
  #   allowReboot = false;
  #   flake = "/etc/nixos/misery";
  #   date = "daily";
  # };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      auto-optimise-store = true;
    };
  };

  system.stateVersion = "26.05";
}
