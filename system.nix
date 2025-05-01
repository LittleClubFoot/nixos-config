{ config, pkgs, ... }:

{
  networking.hostName = "LittleNixFoot-11e";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set Time Zone
  time.timeZone = "America/Los_Angeles"; # adjust to your location

  # Select internationalisation properties  
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # TODO: Figure out what this does
  console.keyMap = "us";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # TODO: Figure out what this does
  services.timesyncd.enable = true;

  # Enable Networking
  networking.networkmanager.enable = true;

  # Enable virtualisation support (for later use)
  virtualisation.virtualbox.host.enable = true;

  # Enable sudo
  security.sudo.enable = true;

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11";
}

