{ pkgs, config, inputs, lib, host, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;

    settings = {
      "$main" = "Super";
      "$term" = "alacritty";
      "$browser" = "firefox";
      "$menu" = "rofi -show drun";
      xwayland.force_zero_scaling = true;

      bindm =
        [
          "$main, mouse:272, movewindow"
	  "$main, mouse:273, resizewindow"
        ];

      bindel =
        [
	",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	",XF86MonBrightnessDown, exec, brightnessctl s 10%-"

	];
      bind = 
        [
	  # actions
	  "$main, Q, killactive"
	  "$main, E, exec, $browser"
	  "$main, Return, exec, $term"
	  "$main, Delete, exit"
	  "$main, F, fullscreen"
	  "$main, Super_L, exec, $menu"
	  "Alt, Return, fullscreen, 1"

	  # workspaces

	  "$main, 1, workspace, 1"
	  "$main, 2, workspace, 2"
	  "$main, 3, workspace, 3"
	  "$main, 4, workspace, 4"
	  "$main, 5, workspace, 5"
	  "$main, 6, workspace, 6"
	  "$main, 7, workspace, 7"
	  "$main, 8, workspace, 8"
	  "$main, 9, workspace, 9"
	  "$main, 0, workspace, 10"

	  "$main SHIFT, 1, movetoworkspace, 1"
	  "$main SHIFT, 2, movetoworkspace, 2"
	  "$main SHIFT, 3, movetoworkspace, 3"
	  "$main SHIFT, 4, movetoworkspace, 4"
	  "$main SHIFT, 5, movetoworkspace, 5"
	  "$main SHIFT, 6, movetoworkspace, 6"
	  "$main SHIFT, 7, movetoworkspace, 7"
	  "$main SHIFT, 8, movetoworkspace, 8"
	  "$main SHIFT, 9, movetoworkspace, 9"
	  "$main SHIFT, 0, movetoworkspace, 10"

	  # print
	  ", PRINT, exec, hyprshot -m region --clipboard-only"
          "$main, PRINT, exec, hyprshot -m output --clipboard-only"

	];


      input = {
	kb_layout = "br";
	kb_variant = "";
	kb_model = "";

	follow_mouse = 1;
	touchpad = {
	  natural_scroll = false;
	};
      };

      general = {
	gaps_in = 5;
	gaps_out = 10;
	border_size = 2;
	resize_on_border = true;
	allow_tearing = true;
      };


      exec-once = 
        [
	  "hypridle"
	  "swww init && swww img ~/.config/nix/assets/gojira.jpeg"
	  "dunst"
	];
    };
  };
}
