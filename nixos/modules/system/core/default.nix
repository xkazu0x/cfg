{ config, pkgs, lib, inputs, ... }:

{
  # --- Boot ------------------------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_zen;

  # --- Network ---------------------------------------------------------------
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # --- SSH Daemon ------------------------------------------------------------
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     PermitRootLogin = "no";
  #     # PasswordAuthentication = false;
  #   };
  # };

# --- Time & Locale ---------------------------------------------------------
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

  # --- Audio -----------------------------------------------------------------
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # --- Nix Settings ----------------------------------------------------------
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "@wheel" ];
    warn-dirty = false;
    max-jobs = 2;
    cores = 0;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.optimise.automatic = true;

  # --- Fonts -----------------------------------------------------------------
  fonts.packages = with pkgs; [ iosevka nerd-fonts.iosevka ];

  # --- Base Packages ---------------------------------------------------------
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    htop
    btop
    tree
    unzip
    fastfetch
  ];

  # --- System State Version --------------------------------------------------
  system.stateVersion = "26.05";
}
