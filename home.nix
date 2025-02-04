{ inputs, config, pkgs, homeManagerModules, ... }:

{
  imports = 
    [
      homeManagerModules
    ];

  nixpkgs.config.allowUnfree = true;

  home.username = "artur";
  home.homeDirectory = "/home/artur";

  programs.git = {
    enable = true;
    userName = "arturacruz";
    userEmail = "arturacruz@icloud.com";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/.config/nix";
      cdnix = "cd ~/.config/nix/";
    };
    
    history = {
      size = 10000;
      ignoreAllDups = true;
      append = true;
      ignoreSpace = true;
    };
    
    historySubstringSearch = {
      enable = true;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

  };

  programs = {
    firefox.enable = true;

    alacritty = {
      enable = true;
      settings = {
	window = {
	  opacity = 0.8;

	  padding.x = 10;
	  padding.y = 10;

	  decorations = "Full";
	  decorations_theme_variant = "Dark"; # "Dark"
	};
      };

    };

  };
  
  home.packages = with pkgs; [
    nix-prefetch-github
    vesktop
    fastfetch
  ];  

  home.sessionVariables = {
    EDITOR = "nvim";
  };



  home.file = {

  };


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.stateVersion = "24.11"; # Please read the comment before changing.
  programs.home-manager.enable = true;

}
