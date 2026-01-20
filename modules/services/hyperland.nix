{ config, pkgs, ... }:

{
  # Enable the Hyprland compositor (Wayland)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable essential Wayland-related packages
  environment.systemPackages = with pkgs; [
    waybar
    rofi
    hyprpaper
    hyprlock
    hypridle
    wl-clipboard
    grim
    slurp
    mako
    alacritty
  ];

  # Optional: set Hyprland as default session for display manager
  services.displayManager.defaultSession = "hyprland";
}
