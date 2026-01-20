{ config, pkgs, ... }:

{
  # Settings that apply to all hosts

  # Use systemd-boot for EFI systems
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.enable = true;
}
