{ pkgs, lib, ... }:
# { options, config, systemConfig, inputs, lib, pkgs, ... }:

{
  imports =
    [
      ./modules/kblayouts
      ./modules/discord-screenaudio.nix
      ./modules/nixos-fhs-compat.nix 
      ./modules/aboutlife.nix
      ./modules/xmousepasteblock
      #./modules/auto-shutdown
    ]
    ++ lib.optional (builtins.pathExists ./mounts.nix) ./mounts.nix;

  # system / hardware
  # ===========================================================================

  # before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system.stateVersion = "23.11"; # did you read the comment?
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''experimental-features = nix-command flakes'';
  };

  # bootloader

  boot.loader.grub = lib.mkForce {
    enable = true;
    useOSProber = false; # reduce build time
    efiSupport = true;
    default = "saved";
    device = "nodev";
  };
  boot.loader.efi = lib.mkForce {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernel.sysctl."vm.swappiness" = 1;

  # networking

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  time.timeZone = "America/Bogota";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  # X11

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.libinput.enable = true;

  # sound with pipewire

  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # to use JACK apps
  };

  # user. Don't forget to set a password with ‘passwd’.

  users.users.woynert = {
    isNormalUser = true;
    description = "woynert";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "libvirtd" "docker" "storage" "scanner" "lp" ];
  };

  # user space
  # ===========================================================================

  # misc

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    comic-relief
  ];

  qt.enable = true; # make qt programs look like gtk
  qt.platformTheme = "gtk2";
  qt.style = "gtk2";

  nixpkgs.config.permittedInsecurePackages = [
    # only for obsidian
    "electron-25.9.0"
  ];

  # services

  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #services.safeeyes.enable = true;
  services.locate.enable = true; # updatedb
  services.openssh.enable = true;
  programs.ssh.askPassword = "";

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  hardware.acpilight.enable = true; # allow users in the video group to use xbacklight

  # see https://nixos.wiki/wiki/Printing
  services.printing.enable = true; # CUPS printing
  services.printing.drivers = [ pkgs.hplip ];
  hardware.sane.enable = true; # scanner
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];

  services.syncthing = {
    enable = true;
    user = "woynert";
    configDir = "/home/woynert/.config/syncthing";
  };

  # SUID wrapped programs

  programs.neovim.enable = true;
  programs.neovim.vimAlias = true;
  programs.neovim.defaultEditor = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman thunar-media-tags-plugin ];
  services.tumbler.enable = true;
  programs.npm.enable = true;
  programs.steam.enable = true; # for when things get better


  # packages installed in system profile

  environment.systemPackages = with pkgs; [

    # cli tool

    neovim
    vimPlugins.packer-nvim
    ripgrep # nvim telescope
    xclip
    fzf

    tmux
    file
    xorg.xkill
    killall
    tree
    wget
    htop
    btop
    unzip
    cheat
    zoxide
    lf
    pistol # only for lf
    bat # for pistol
    acpi
    acpilight # xbacklight
    gummy

    # dev

    python3
    gcc11
    git
    git-credential-oauth
    go
    cargo
    gnumake
    ffmpeg-full
    docker-compose
    podman-compose

    # ui tool

    xfce.xfce4-whiskermenu-plugin
    keynav
    rofi
    pavucontrol
    caffeine-ng
    volctl
    flameshot
    gparted
    mpv
    gnome.file-roller # archiver
    gnome.simple-scan
    vokoscreen # screen recorder
    gpick

    # system util

    mpg123
    libnotify
    lxde.lxsession # I think this is for lxpolkit
    steamPackages.steam-fhsenv-without-steam.run
    vanilla-dmz # cursor theme I like
    xfce.xfce4-settings
    xbindkeys
    pulseaudio # pactl command for changing volume
    pkgsi686Linux.gperftools # tf2 workaround
    qemu

    # app

    alacritty
    firefox
    chromium
    obsidian
    megasync
    deadbeef
    ferdium
    obs-studio
    audacity
    libreoffice-fresh
  ];
}
