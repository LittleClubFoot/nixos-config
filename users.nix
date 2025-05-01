{ config, pkgs, ... }:

{
  users.users.littlefoot = {
    isNormalUser = true;
    description = "LittleFoot";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      neovim
      zsh
      starship
      i3
      firefox
      kitty
      lxappearance
      flameshot
      redshift

      # Fonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
  };

  programs.zsh.enable = true;
  programs.starship.enable = true;
}

