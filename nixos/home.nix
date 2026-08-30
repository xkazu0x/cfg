{ config, pkgs, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/cfg";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    foot = "foot";
    fuzzel = "fuzzel";
    niri = "niri";
    nvim = "nvim";
    tmux = "tmux";
    waybar = "waybar";
  };
in

{
  home.username = "loser";
  home.homeDirectory = "/home/loser";
  home.stateVersion = "26.05";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.pointerCursor = {
    package = pkgs.bibata-cursors; # pkgs.phinger-cursors;
    name = "Bibata-Modern-Classic"; # "phinger-cursors-dark";
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

  imports = [ inputs.areofyl-fetch.homeManagerModules.default ];
  programs.fetch.enable = true;
}
