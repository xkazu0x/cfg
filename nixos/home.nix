{ pkgs, inputs, ... }:

{
  home.username = "loser";
  home.homeDirectory = "/home/loser";
  home.stateVersion = "26.05";

  imports = [ inputs.noctalia.homeModules.default ];
  programs.noctalia.enable = true;
}
