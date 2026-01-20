{ config, pkgs, lib, ... }:

{
  services.openssh = { 
    enable = true;
    extraConfig = ''
      ListenAddress 0.0.0.0
    '';
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
}
