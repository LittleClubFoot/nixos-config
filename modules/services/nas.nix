{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  fileSystems."/mnt/nas/media" = {
    device = "//192.168.1.100/Media";
    fsType = "cifs";
    options = [
      "credentials=/root/.nascredentials"
      "uid=1000"
      "gid=100"
      "file_mode=0755"
      "dir_mode=0755"
      "vers=3.1.1"
      "serverino"
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "nofail"
    ];
  };

  fileSystems."/mnt/nas/workspaces" = {
    device = "//192.168.1.100/workspaces";
    fsType = "cifs";
    options = [
      "credentials=/root/.nascredentials"
      "uid=1000"
      "gid=100"
      "file_mode=0755"
      "dir_mode=0755"
      "vers=3.1.1"
      "serverino"
      "x-systemd.automount"
      "x-systemd.idle-timeout=600"
      "nofail"
    ];
  };
}
