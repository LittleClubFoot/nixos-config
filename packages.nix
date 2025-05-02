{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    nixpkgs-fmt
    tree
    unzip
    vim
    wget
  ];
}

