{ config, pkgs, ... }:

{
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;
  programs.dconf.enable = true;

  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.dconf ];

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];
  xdg.portal.config.common.default = "gnome";

  environment.systemPackages = with pkgs; [
    foot
    fuzzel
    waybar
    swaybg
    libnotify
    playerctl
    pavucontrol
    brightnessctl
    wl-clipboard
    cliphist
    nautilus
    sushi
    mako
    xwayland-satellite
  ];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
