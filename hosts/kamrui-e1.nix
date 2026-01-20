{ config, pkgs, lib, ... }:

{
  imports = [
    ../modules/hardware/kamrui-e1.nix
    ../modules/hardware/common.nix
  ];

  networking.hostName = "kamrui-e1";
  time.timeZone = "America/Los_Angeles";

  # https://nixos.org/manual/nixos/stable/options.html#opt-system.stateVersion
  system.stateVersion = "25.05";

  users.users.littlefoot = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.littlefoot = import ../modules/home/littlefoot.nix;
  };
}
