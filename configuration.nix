{
  pkgs,
  meta,
  ...
}:
{
  imports = [
    ./modules/desktop.nix
    ./modules/neovim.nix
    ./modules/shell.nix
  ];

  security.sudo.wheelNeedsPassword = false; # Replace this with sudo-over-ssh

  programs.nix-ld.enable = true; # Allow dynamic linking of nix packages

  networking.hostName = meta.hostname; # Define your hostname.

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "dk-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shrek = {
    isNormalUser = true;
    description = "shrek";
    extraGroups = [
      "networkmanager"
      "wheel"
      "media"
    ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    btop
    git
    ripgrep
    bat
    eza
    tldr
    firefox
    wireguard-tools
    netcat-gnu
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    80 # HTTP
    443 # HTTPS
    3000 # shrek ports
    22 # shrek ports
  ];
}
