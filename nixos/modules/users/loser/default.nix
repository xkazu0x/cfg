{ config, pkgs, ... }:

{
  users.users.loser = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"
      "gamemode"
    ];
  };
}
