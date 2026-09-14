{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "nvidia" ];
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
    package = if config.kernel.cachyos.enable
      then pkgs.nvidia_cachyos
      else config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
