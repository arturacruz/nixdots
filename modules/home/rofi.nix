{ pkgs, config, lib, ... }:

{
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
	modi = "drun,run,filebrowser,window";
	show-icons = true;
	icon-theme = "Papirus";
	font = "JetBrainsMono Nerd Font Mono 12";
        drun-display-format = "{icon} {name}";
        display-drun = " Apps";
        display-run = " Run";
        display-filebrowser = " File";
      };
    };
  };
}
