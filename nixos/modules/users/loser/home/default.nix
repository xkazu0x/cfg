{ config, pkgs, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/cfg/dotfiles";
  symlink_make = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    fastfetch = "fastfetch";
    foot      = "foot";
    fuzzel    = "fuzzel";
    kitty     = "kitty";
    mako      = "mako";
    niri      = "niri";
    nvim      = "nvim";
    tmux      = "tmux";
    waybar    = "waybar";
  };
in

{
  imports = [
    inputs.areofyl-fetch.homeManagerModules.default
  ];

  # --- Home Manager ----------------------------------------------------------
  home.username      = "loser";
  home.homeDirectory = "/home/loser";
  home.stateVersion  = "26.05";

  # --- Theme -----------------------------------------------------------------
  home.pointerCursor = {
    enable     = true;
    name       = "Bibata-Modern-Classic";
    package    = pkgs.bibata-cursors;
    size       = 22;
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
      size    = 22;
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
    cursor-size  = 22;
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
    download  = "${config.home.homeDirectory}/Downloads";
    music     = "${config.home.homeDirectory}/Music";
    pictures  = "${config.home.homeDirectory}/Pictures";
    videos    = "${config.home.homeDirectory}/Videos";
  };

  # --- Dotfiles --------------------------------------------------------------
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = symlink_make "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  # --- Programs --------------------------------------------------------------
  programs.home-manager.enable = true;
  programs.fetch.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      nrf = "sudo nixos-rebuild switch --flake";
      nr = "sudo nixos-rebuild switch";
      lg = "lazygit";
    };
  };

  programs.git = {
    enable = true;
    settings.alias = {
      st = "status";
      co = "checkout";
      br = "branch";
      lg = "log --oneline --graph --decorate";
    };
  };

  programs.zoxide = {
    enable                = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable                = true;
    enableBashIntegration = true;
  };

  services.ssh-agent.enable = true;
}
