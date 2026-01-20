{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs;
    import ./base.nix pkgs ++
    import ./dev.nix pkgs ++
    import ./media.nix pkgs ++
    import ./terminals.nix pkgs ++
    import ./kamrui-e1.nix pkgs;
}
