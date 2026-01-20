{ config, pkgs, lib, ... }:

{
  imports = [
    ../modules/hardware/kamrui-e1.nix
    ../modules/hardware/common.nix
  ];

  networking.hostName = "kamrui-e1";
  time.timeZone = "America/Los_Angeles";

  users.users.littlefoot = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Bootloader and system-specific settings can go here
}
