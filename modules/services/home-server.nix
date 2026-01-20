{ config, pkgs, lib, ... }:

{
  virtualisation.docker.enable = true;
  users.groups.docker = { };
}
