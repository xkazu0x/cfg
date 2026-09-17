{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [ proton-ge-custom proton-cachyos ];
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
        softrealtime = "auto";
      };
      # gpu = {
      #   apply_gpu_optimisations = "accept-responsibility";
      #   gpu_device = 0;
      # };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode' 'Optimizations applied'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode' 'Optimizations removed'";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wine-staging
    winetricks
    protontricks

    gamemode
    mangohud

    gamescope
    gamescope-wsi

    vulkan-tools
    mesa-demos

    umu-launcher
    steam-run
  ];

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}
