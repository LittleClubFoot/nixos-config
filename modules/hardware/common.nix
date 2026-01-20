{ config, pkgs, ... }:

{
  # Settings that apply to all hosts
  boot.loader.grub.device = "/dev/sda";
  networking.firewall.enable = true;
}
