{ config, pkgs, ... }:

{
  home.username = "littlefoot";
  home.homeDirectory = "/home/littlefoot";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "sudo" ];
    };

    initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
    fzf
    ripgrep
    bat
    fd
    eza
    tmux
    meslo-lgs-nf
  ];
}
