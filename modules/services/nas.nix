{ config, pkgs, nasIp, ... }:

{
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  # NAS mounts - IP defined in flake.nix
  fileSystems."/mnt/nas/media" = {
    device = "//${nasIp}/Media";
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
    device = "//${nasIp}/workspaces";
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
