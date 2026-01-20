{ config, pkgs, lib, ... }:

{
  virtualisation.docker.enable = true;
  users.groups.docker = { };

  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  fileSystems."/mnt/nas-media" = {
    device = "//192.168.1.100/Media";
    fsType = "cifs";
    options = [
      "credentials=/root/.nascredentials"
      "uid=1000"
      "gid=1000"
      "file_mode=0755"
      "dir_mode=0755"
    ];
  };

#   fileSystems."/mnt/nas-media" = {
#     device = "//192.168.1.244/Media";
#     fsType = "cifs";
#     options = "credentials=/root/.nascredentials,uid=1000,gid=1000,file_mode=0755,dir_mode=0755";
#   };
}
