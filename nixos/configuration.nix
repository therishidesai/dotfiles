# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, options, ... }:
let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = unstable.linuxPackages_5_10;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "ah64-msi-nixos";
  # Add Google timeservers
  networking.timeServers = options.networking.timeServers.default ++ [ "time.google.com" ];

  # Set your time zone.
  time.timeZone = "UnitedStates/LosAngeles";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    brave
    tmux
    vim 				# Extra Text Editor
    git					# Source Control
    emacs 				# Default Text Editor
    alacritty 				# Default Terminal Emulator
    unzip 				# .zip file utility
    xclip				# COPY/PASTE utility
    arandr				# GUI for xrandr
    scrot 				# Screen Locker
    zsh					# Default Shell
    htop                                # Don't be a peasant
  ];

  # Apply xkb settings outside of X11
  # https://unix.stackexchange.com/questions/377600/in-nixos-how-to-remap-caps-lock-to-control
  i18n.consoleUseXkbConfig = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Use chrony to keep your clocks up to date with networking.timeServers
  services.chrony.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the X11 windowing system.
  # Settings for desktop, display, and window managers.
  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
		   defaultSession = "none+i3";
    };
    # xkbOptions = "ctrl:swapcaps";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ dmenu
				   i3status
				   i3lock
				   i3lock-fancy
				   i3blocks
 			         ];
    };
    videoDrivers = [ "nvidia" ];
  };

  
  # Enable zsh as default shell
  programs.zsh.enable = true;
  programs.zsh.promptInit = ''
    if which tmux 2>&1 >/dev/null; then
      if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
        tmux attach -t hack || tmux new -s hack; exit
      fi
    fi
  '';
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "cloud";
  };

  # User Account(s)
  users.users.rishi = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?

  # You'll be free hackers.
  nixpkgs.config.allowUnfree = true;
}
