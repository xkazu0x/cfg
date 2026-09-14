{ config, pkgs, lib, ... }:

{
  options.kernel.cachyos = {
    enable = lib.mkEnableOption "Enable CachyOS kernel for this host.";
    variant = lib.mkOption {
      default = null;
      type = lib.types.nullOr (lib.types.enum ["lto" "lts" "server" "hardened"]);
      description = "This option determines the CachyOS kernel variant to use.";
    };
  };

  config = lib.mkIf config.kernel.cachyos.enable {
    boot.kernelPackages = lib.mkMerge [
      (lib.mkIf (config.kernel.cachyos.variant == null) pkgs.linuxPackages_cachyos)
      (lib.mkIf (config.kernel.cachyos.variant == "lts") pkgs.linuxPackages_cachyos-lts)
      (lib.mkIf (config.kernel.cachyos.variant == "lto") pkgs.linuxPackages_cachyos-lto)
      (lib.mkIf (config.kernel.cachyos.variant == "server") pkgs.linuxPackages_cachyos-server)
      (lib.mkIf (config.kernel.cachyos.variant == "hardened") pkgs.linuxPackages_cachyos-hardened)
    ];
    services.scx.enable = true;
    services.scx.package = pkgs.scx.rustscheds;
    services.scx.scheduler = "scx_lavd";
  };
}
