{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # --- Bootloader ---------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Network ------------------------------------------------
  networking.hostName = "misery";
  networking.networkmanager.enable = true;

  # --- Time/Locale --------------------------------------------
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # --- Display Manager ----------------------------------------
  services.xserver.enable = true;
  services.xserver.xkb = { layout = "us"; variant = ""; };
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  # --- Audio (Pipewire) ---------------------------------------
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- Program Toggles ----------------------------------------
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

  # --- Graphics -----------------------------------------------
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ rocmPackages.clr ];
  };

  # --- Hardware (NVIDIA) --------------------------------------
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ] ;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # --- Users --------------------------------------------------
  users.users.loser = {
    isNormalUser = true;
    description = "loser";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # --- Fonts --------------------------------------------------
  fonts.packages = with pkgs; [
    iosevka
    nerd-fonts.iosevka
  ];

  # --- Packages -----------------------------------------------
  environment.systemPackages = with pkgs; [
    pulseaudio
    fastfetch
    ripgrep
    wget
    zip
    unzip
    btop
    git
    gh
    gcc
    clang
    gnumake
    spotify
    discord
    ghostty
    foot
    neovim
    brave
    rofi
    fuzzel
    swaybg
    waybar
    nautilus
    xwayland-satellite
    kdePackages.kdenlive
    obs-studio
    osu-lazer-bin
    libreoffice
    localsend
    tmux
    vlc
  ];

  # --- Settings -----------------------------------------------
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # --- Maintenance --------------------------------------------
  # system.autoUpgrade = {
  #   enable = false;
  #   allowReboot = false;
  #   date = "daily";
  # };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  nix.settings.auto-optimise-store = true;

  system.stateVersion = "26.05";
}
