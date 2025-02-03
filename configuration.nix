# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      inputs.minegrub-theme.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
    ];

  nix.settings = {
	experimental-features = [ "nix-command" "flakes" ];

  };

  environment.sessionVariables = rec {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  # Grub config
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];

      minegrub-theme = {
        enable = true;
	splash = "I use NixOS btw";
	background = "background_options/1.20 - [Trails & Tales].png";
	boot-options-count = 4;
      };
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";
  services.printing.enable = true;
  services.pulseaudio.enable = false;

  hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.zsh.enable = true;
  users.users.artur = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Artur";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.steam.enable = true;


  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  programs.neovim = {
	enable = true;
	defaultEditor = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      artur = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    blueman
    dunst
    unrar
    p7zip
    swww
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];

  services.openssh = {
    enable = true;
  };



  system.stateVersion = "24.11"; # Did you read the comment

  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than +10";
  };

}
