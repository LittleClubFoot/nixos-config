{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
      ./desktop.nix
      ./users.nix
      ./packages.nix
      ./system.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # optional pre-flake support
}

