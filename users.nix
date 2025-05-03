{ config, pkgs, ... }:

{
  users.users.littlefoot = {
    isNormalUser = true;
    description = "LittleFoot";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      neovim
      xclip
      zsh
      starship
      i3
      firefox
      kitty
      lxappearance
      flameshot
      redshift

      # Dev
      gh
      gcc
    ];
  };

  programs.zsh.enable = true;
  programs.starship.enable = true;

  programs.adb.enable = true;
}

