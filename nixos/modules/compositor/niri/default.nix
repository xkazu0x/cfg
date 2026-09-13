{ config, pkgs, ... }:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];
  xdg.portal.config.common.default = "gnome";

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;
  programs.dconf.enable = true;

  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.dconf ];
}
