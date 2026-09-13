{ config, pkgs, inputs, ... }:

{
  # imports = [ ./hardware-configuration.nix ];

  # --- Boot ------------------------------------------------------------------
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.efi.canTouchEfiVariables = true;

  # --- Network ---------------------------------------------------------------
  # networking.networkmanager.enable = true;
  # networking.firewall.enable = true;

  # --- Locale ----------------------------------------------------------------
  # time.timeZone = "America/Sao_Paulo";
  # i18n.defaultLocale = "en_US.UTF-8";
  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_US.UTF-8";
  #   LC_IDENTIFICATION = "en_US.UTF-8";
  #   LC_MEASUREMENT = "en_US.UTF-8";
  #   LC_MONETARY = "en_US.UTF-8";
  #   LC_NAME = "en_US.UTF-8";
  #   LC_NUMERIC = "en_US.UTF-8";
  #   LC_PAPER = "en_US.UTF-8";
  #   LC_TELEPHONE = "en_US.UTF-8";
  #   LC_TIME = "en_US.UTF-8";
  # };

  # --- Audio -----------------------------------------------------------------
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   jack.enable = true;
  #   wireplumber.enable = true;
  # };

  # --- Kernel ----------------------------------------------------------------
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # --- Scheduler -------------------------------------------------------------
  # services.scx = {
  #   enable = true;
  #   package = pkgs.scx.rustscheds;
  #   scheduler = "scx_lavd";
  # };

  # --- Swap ------------------------------------------------------------------
  # zramSwap = {
  #   enable = true;
  #   priority = 100;
  #   algorithm = "lz4";
  #   memoryPercent = 50;
  # };
  #
  # swapDevices = [{
  #   device = "/swap/swapfile";
  #   size = 4096;
  #   priority = 10;
  # }];

  # --- SSH -------------------------------------------------------------------
  # services.openssh.enable = true;
  # services.openssh.settings.PermitRootLogin = "no";
  # services.openssh.settings.PasswordAuthentication = false;

  # --- Programs --------------------------------------------------------------
  # programs.steam = {
  #   enable = true;
  #   gamescopeSession.enable = true;
  # };

  # programs.gamemode.enable = true;
  # programs.gamescope = {
  #   enable = true;
  #   capSysNice = true;
  # };

  # programs.appimage = {
  #   enable = true;
  #   binfmt = true;
  #   package = pkgs.appimage-run.override {
  #     extraPkgs = pkgs: [
  #       pkgs.icu
  #     ];
  #   };
  # };
  #
  # programs.localsend = {
  #   enable = true;
  #   openFirewall = true;
  # };

  # programs.niri.enable = true;
  # programs.xwayland.enable = true;

  # services.displayManager.ly.enable = true;
  # services.displayManager.defaultSession = "niri";

  # services.xserver.enable = true;
  # services.xserver.xkb = {
  #   layout = "us,br";
  #   variant = "";
  #   options = "grp:win_shift_toggle";
  # };

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-gnome
  #     xdg-desktop-portal-gtk
  #   ];
  #   config.common.default = "gnome";
  # };

  # services.gnome.gnome-keyring.enable = true;
  # security.pam.services.login.enableGnomeKeyring = true;

  # services.upower.enable = true;
  # services.power-profiles-daemon.enable = true;
  #
  # services.gvfs.enable = true;
  # services.udisks2.enable = true;
  #
  # services.flatpak.enable = true;
  # programs.dconf.enable = true;
  #
  # services.dbus.enable = true;
  # services.dbus.packages = [ pkgs.dconf ];

  # --- Fonts -----------------------------------------------------------------
  # fonts.packages = with pkgs; [
  #   nerd-fonts.iosevka
  #   iosevka
  # ];
  #
  # # --- Packages --------------------------------------------------------------
  # environment.systemPackages = with pkgs; with kdePackages; [
  #   git
  #   gh
  #   curl
  #   wget
  #   htop
  #   btop
  #   unzip
  #   tree
  #   dust
  #   fastfetch
  #
  #   foot
  #   fuzzel
  #   waybar
  #   swaybg
  #   mako
  #   libnotify
  #   nautilus
  #   sushi
  #   xwayland-satellite
  #
  #   pulseaudio
  #   pavucontrol
  #   playerctl
  #
  #   neovim
  #   ripgrep
  #   tmux
  #   gcc
  #   clang
  #   gnumake
  #
  #   brave
  #   spotify
  #   discord
  #   obs-studio
  #   libreoffice
  #   kdenlive
  #   inkscape
  #   vlc
  #
  #   zenity
  #   xdg-desktop-portal
  # ];

  # --- Nix -------------------------------------------------------------------
  # nixpkgs.config.allowUnfree = true;
  #
  # nix.settings = {
  #   experimental-features = [ "nix-command" "flakes" ];
  #   trusted-users = [ "root" "@wheel" ];
  #   warn-dirty = false;
  #   max-jobs = 2;
  #   cores = 0;
  # };
  #
  # nix.gc = {
  #   automatic = true;
  #   dates = "weekly";
  #   options = "--delete-older-than 30d";
  # };
  #
  # nix.optimise.automatic = true;
  #
  # system.stateVersion = "26.05";
}
