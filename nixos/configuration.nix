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
  # nixpkgs.config = {
  #   packageOverrides = super: let
  #     self = super.pkgs;
  #   in {
  #     iosevka-misery = self.iosevka.override {
  #       set = "Misery";
  #       privateBuildPlan = ''
  #         [buildPlans.IosevkaMisery]
  #         family = "Iosevka Misery"
  #         spacing = "normal"
  #         serifs = "sans"
  #         noCvSs = true
  #         exportGlyphNames = false
  #         noLigation = true
  #
  #         [buildPlans.IosevkaMisery.variants]
  #         inherits = "ss06"
  #
  #         [buildPlans.IosevkaMisery.variants.design]
  #         lig-single-arrow-bar = "without-notch"
  #
  #         [buildPlans.IosevkaMisery.weights.Regular]
  #         shape = 400
  #         menu = 400
  #         css = 400
  #
  #         [buildPlans.IosevkaMisery.weights.Bold]
  #         shape = 700
  #         menu = 700
  #         css = 700
  #
  #         [buildPlans.IosevkaMisery.weights.Light]
  #         shape = 300
  #         menu = 300
  #         css = 300
  #
  #         [buildPlans.IosevkaMisery.slopes.Upright]
  #         angle = 0
  #         shape = "upright"
  #         menu = "upright"
  #         css = "normal"
  #       '';
  #     };
  #   };
  # };

  fonts.packages = with pkgs; [
    iosevka
    # iosevka-misery
    nerd-fonts.iosevka
  ];

  # --- Packages -----------------------------------------------
  environment.systemPackages = with pkgs; [
    pulseaudio
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
