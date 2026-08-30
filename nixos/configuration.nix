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
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";

  # --- Keyboard Layout ----------------------------------------
  services.xserver.xkb.layout = "us,br";
  services.xserver.xkb.variant = "";
  services.xserver.xkb.options = "grp:alt_shift_toggle";
  environment.variables.XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
  environment.variables.XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  console.useXkbConfig = true;

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

  # --- Graphics -----------------------------------------------
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ rocmPackages.clr ];
  };

  # --- Users --------------------------------------------------
  users.users.loser = {
    isNormalUser = true;
    description = "loser";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # --- Fonts --------------------------------------------------
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    iosevka
  ];

  # --- Packages -----------------------------------------------
  environment.systemPackages = with pkgs; [
    pavucontrol
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
    usbutils
    gparted
    spotify
    discord
    foot
    fuzzel
    neovim
    brave
    swaybg
    waybar
    grim
    solaar
    sushi
    nautilus
    zenity
    xdg-desktop-portal
    xwayland-satellite
    kdePackages.kdenlive
    obs-studio
    libreoffice
    localsend
    tmux
    vlc
  ];

  # --- Settings -----------------------------------------------
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
