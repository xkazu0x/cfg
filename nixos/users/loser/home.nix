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

  home.username = "loser";
  home.homeDirectory = "/home/loser";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # xdg.userDirs = {
  #   enable = true;
  #   createDirectories = true;
  #   setSessionVariables = true; # Silence HM 26.05 default change warning
  #   desktop = "${config.home.homeDirectory}/Desktop";
  #   documents = "${config.home.homeDirectory}/Documents";
  #   download = "${config.home.homeDirectory}/Downloads";
  #   music = "${config.home.homeDirectory}/Music";
  #   pictures = "${config.home.homeDirectory}/Pictures";
  #   videos = "${config.home.homeDirectory}/Videos";
  #   templates = "${config.home.homeDirectory}/Templates";
  #   publicShare = "${config.home.homeDirectory}/Public";
  # };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  programs.git = {
    enable = true;
    settings = {
      user.name = "xkazu0x";
      user.email = "kazuooficial@hotmail.com";
      init.defaultBranch = "master";
    };
  };

  services.ssh-agent.enable = true;
  programs.fetch.enable = true;
}
