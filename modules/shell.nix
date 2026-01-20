{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "";
    };
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh
    zsh-powerlevel10k
    starship
    fzf
    ripgrep
    bat
    fd
    eza
    tmux
    meslo-lgs-nf
  ];
}
