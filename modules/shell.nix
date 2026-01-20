{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = powerlevel10k/powerlevel10k;

  environment.systemPackages = with pkgs; [
    zsh
    starship
    fzf
    ripgrep
    bat
    fd
    exa
    tmux
  ];
}
