{ config, pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];
  # Enable the X11 windowing system.
  services.displayManager.defaultSession = "xfce+i3";
  services.xserver = {
    enable = true;
    autorun = false;

    # Enable the XFCE Desktop Environment.
    displayManager.lightdm.enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        # i3blocks #if you are planning on using i3blocks over i3status
      ];
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Picom tools
  services.picom.enable = true;

  environment.systemPackages = with pkgs; [
    feh
    kitty
    lxappearance
    nerdfonts
  ];
}

