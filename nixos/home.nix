{ pkgs, inputs, ... }:

{
  home.username = "loser";
  home.homeDirectory = "/home/loser";
  home.stateVersion = "26.05";

  home.pointerCursor = {
    package = pkgs.bibata-cursors; # pkgs.phinger-cursors;
    name = "Bibata-Modern-Classic"; # "phinger-cursors-dark";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk.enable = true;

  imports = [ inputs.areofyl-fetch.homeManagerModules.default ];
  programs.fetch.enable = true;
}
