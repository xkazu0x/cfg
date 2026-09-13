{ config, pkgs, lib, ... }:

{
  options.hardware.gpu = lib.mkOption {
    type = lib.types.enum [ "nvidia" ];
    description = "Enable GPU drivers for this host.";
  };

  config = lib.mkMerge [
    (lib.mkIf (config.hardware.gpu == "nvidia") {
      boot.initrd.kernelModules = [ "nvidia" ];
      boot.blacklistedKernelModules = [ "nouveau" ];
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ rocmPackages.clr ];
      };

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = true;
        nvidiaSettings = true;
        package =
          if config.kernel.cachyos.enable
          then pkgs.nvidia_cachyos
          else config.boot.kernelPackages.nvidiaPackages.stable;
      };
    })
  ];
}
