{ config, pkgs, lib, ... }:

{
  options.kernel.cachyos = {
    enable = lib.mkEnableOption "Enable CachyOS kernel for this host.";
  };

  config = lib.mkIf config.kernel.cachyos.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos;
    services.scx.enable.enable = true;
    services.scx.package = pkgs.scx.rustscheds;
    services.scx.scheduler = "scx_lavd";
  };
}
