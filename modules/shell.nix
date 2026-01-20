{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      customPkgs = [ pkgs.zsh-powerlevel10k ];
      theme = "powerlevel10k/powerlevel10k";
    };
  };

  environment.systemPackages = with pkgs; [
    zsh
    starship
    fzf
    ripgrep
    bat
    fd
    eza
    tmux
    meslo-lgs-nf  # Recommended font for powerlevel10k
  ];
}
