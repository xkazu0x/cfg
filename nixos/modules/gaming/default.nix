{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
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
      #   softrealtime = "auto";
      # };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode' 'Optimizations applied'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode' 'Optimizations removed'";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gamemode
    gamescope
    gamescope-wsi
    vulkan-tools
    mesa-demos
    steam-run
  ];

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}
