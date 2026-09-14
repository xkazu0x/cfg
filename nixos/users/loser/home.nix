{ config, pkgs, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/cfg";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    foot = "foot";
    fuzzel = "fuzzel";
    mako = "mako";
    niri = "niri";
    nvim = "nvim";
    tmux = "tmux";
    waybar = "waybar";
  };
in

{
  imports = [
    inputs.areofyl-fetch.homeManagerModules.default
  ];

  # --- Home Manager ----------------------------------------------------------
  home.username = "loser";
  home.homeDirectory = "/home/loser";
  home.stateVersion = "26.05";

  # --- Theme -----------------------------------------------------------------
  home.pointerCursor = {
    enable     = true;
    name       = "Bibata-Modern-Classic";
    package    = pkgs.bibata-cursors;
    size       = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name    = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name    = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name    = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size    = 24;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4 = {
      theme = config.gtk.theme; # Silence HM 26.05 default change warning
      extraConfig.gtk-application-prefer-dark-theme = 1;
    };
  };

  home.packages = [ pkgs.gtk3 ];

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    cursor-theme = "Bibata-Modern-Classic";
    cursor-size  = 24;
  };

  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = ":minimize,maximize,close";
  };

  # --- Nautilus --------------------------------------------------------------
  home.file.".config/gtk-3.0/bookmarks".text = ''
    file:///home/loser/Documents Documents
    file:///home/loser/Downloads Downloads
    file:///home/loser/Music Music
    file:///home/loser/Pictures Pictures
    file:///home/loser/Videos Videos
  '';

  # --- User Directories ------------------------------------------------------
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true; # Silence HM 26.05 default change warning

    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
  };

  # --- Dotfiles --------------------------------------------------------------
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  # --- Programs --------------------------------------------------------------
  programs.home-manager.enable = true;
  programs.fetch.enable = true;

  programs.git = {
    enable = true;
    signing.format = null; # Silence HM 25.05 default change warning (no signing configured)
    settings = {
      user.name = "xkazu0x";
      user.email = "kazuooficial@hotmail.com";
      init.defaultBranch = "master";
    };
  };

  services.ssh-agent.enable = true;
}
