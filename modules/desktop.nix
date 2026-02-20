{ ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;

    # These settings should allow for RDP, but are untestd
    xrdp = {
      defaultWindowManager = "startplasma-x11";
      enable = true;
      openFirewall = true;
    };

    xserver = {
      enable = true;
    };
  };

  # NVidia support. Taken straight from my desktop configuration.
  hardware.nvidia = {
    open = true; # use closed source
    modesetting.enable = true; # something something better with wayland
    nvidiaSettings = true; # config menu `nvidia-settings`
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
