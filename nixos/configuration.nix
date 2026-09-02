{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # --- Bootloader ------------------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Network ---------------------------------------------------------------
  networking.hostName = "misery";
  networking.networkmanager.enable = true;

  # --- Time Zone/Locale ------------------------------------------------------
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

  # --- Display Manager -------------------------------------------------------
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  # --- Keyboard Layout -------------------------------------------------------
  services.xserver.xkb.layout = "us,br";
  services.xserver.xkb.variant = "";
  services.xserver.xkb.options = "grp:win_shift_toggle";
  environment.variables.XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
  environment.variables.XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  console.useXkbConfig = true;

  # --- Audio -----------------------------------------------------------------
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- Program Toggles -------------------------------------------------------
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.dconf.enable = true;
  programs.xwayland.enable = true;
  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    configPackages = [ pkgs.niri ];
  };

  services.gnome.gnome-keyring.enable = true;
  services.dbus.packages = [ pkgs.nautilus ];
  services.gvfs.enable = true;
  services.udisks2.enable = true;

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

  # --- Hardware --------------------------------------------------------------
  boot.kernelPackages = pkgs.linuxPackages_cachyos-bore;

  boot.initrd.kernelModules = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = pkgs.nvidia_cachyos-bore; # config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ rocmPackages.clr ];
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8192;
  }];

  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  # --- Users -----------------------------------------------------------------
  users.users.loser = {
    isNormalUser = true;
    description = "loser";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # --- Fonts -----------------------------------------------------------------
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    iosevka
  ];

  # --- Packages --------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    pavucontrol
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
    spotify
    discord
    foot
    fuzzel
    neovim
    brave
    swaybg
    waybar
    grim
    nautilus
    sushi
    zenity
    xdg-desktop-portal
    xwayland-satellite
    kdePackages.kdenlive
    obs-studio
    libreoffice
    tmux
    vlc
    # osu-lazer-bin
  ];

  # --- Settings --------------------------------------------------------------
  nixpkgs.config.allowUnfree = true;

  # system.autoUpgrade = {
  #   enable = false;
  #   allowReboot = false;
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
