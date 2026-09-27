{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us,br";
    options = "grp:alt_shift_toggle";
  };
  services.xserver.windowManager.oxwm.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    xwallpaper
  ];
}
