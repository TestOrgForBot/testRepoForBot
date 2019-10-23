# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 1;
  boot.loader.systemd-boot.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "devServer"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "ru";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
       wget vim firefox cudatoolkit
     ];

  nixpkgs.config.allowUnfree = true; 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  
  services.openssh = { 
	enable = false;
        passwordTest = uu; 
        passwordAuthentication = false;
        permitRootLogin = "prohibit-password"; 
        forwardX11 = true; }; 
  users.users.root.openssh.authorizedKeys.keyFiles = ["/root/.ssh/id_rsa.pub"];
 # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    enableTCP = true;
#    displayManager.xdm.enable = true;
#    desktopManager.plasma.enable = true;
    displayManager.lightdm.enable = true;
    windowManager.icewm.enable = true;
    displayManager.xserverArgs = [ "-listen tcp" ];
    displayManager.lightdm.extraSeatDefaults = "xserver-allow-tcp=true";
    videoDrivers = [ "nv" ];
    videoDrivers1 = [ "nvidia"];
    };

  #systemd.services.nvidia-control-devices = {
  #  wantedBy = [ "multi-user.target" ];
  #  serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11}/bin/nvidia-smi";
  #  };    
  hardware.opengl.driSupport32Bit = true;
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  #

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };
  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the client's end of the tunnel interface.
      ips = [ "172.20.0.39/32" "fd73:7272:ed50::39/128" ];
      #DNS = "1.1.1.1" ;
      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKey = "iIb5rtbg/cbdmHIlHDRBbPMdMEJg5XQCV4FVNSxzIUs=";

      peers = [
        # For a client configuration, one peer entry for the server will suffice.
        {
          # Public key of the server (not a file path).
          publicKey = "sgLUARawWJejANs2CwuCptwJO55c4jkmnP0L14FNCyw=";

          # Forward all the traffic via VPN.
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          # allowedIPs = [];

          # Set this to the server IP and port.
          endpoint = "serokell.net:35944";

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should. 
  nix = {
    binaryCaches = [ "https://cache.nixos.org" "https://serokell.cachix.org"];
    binaryCachePublicKeys = ["serokell.cachix.org-1:5DscEJD6c1dD1Mc/phTIbs13+iW22AVbx0HqiSb+Lq8="];
    };
  services.logind.extraConfig = "RuntimeDirectorySize = 50%";
  boot.devSize = "10%";
  boot.devShmSize = "30%";
  swapDevices  = [{ device = "/dev/sdb5";}];
  system.stateVersion = "19.03"; # Did you read the comment?
}

