{ config, lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
          border: none;
          font-family: JetBrains Mono, JetBrainsMono Nerd Font;
          font-size: 11px;
          border-radius: 20px;
          padding: 0 4px 0 4px;
      }
      
      
      
      window#waybar {
          background-color: rgba(38, 36, 35, 0.5);
          color: rgba(239, 223, 174, 1);
          transition-property: background-color;
          transition-duration: .5s;
          padding: 0px;
      }
      
      
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #mpd {
      
          padding: 0 10px;
          color: rgba(239, 223, 174, 1);
          background-color: rgba(38, 36, 35, 1);
          
      }
      
      #window, #workspaces {
          background-color: rgba(38, 36, 35, 1);
          color: rgba(239, 223, 174, 1);
      }
      
      
      button {
          box-shadow: inset 0 -3px transparent;
          background: inherit;
          
          color: rgba(239, 223, 174, 1);
      }
      
      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px rgba(239, 223, 174, 1);
      }
      
      button:active {
          background: inherit;
          box-shadow: inset 0 -3px rgba(239, 223, 174, 1);
      }

    '';

    settings = [{
      layer = "top";
      margin = "5";
      height = 30;
      spacing = 5;
      reload_style_on_change = true;

      modules-left = [
	"hyprland/workspaces"
      ];

      modules-center = [
	"hyprland/window"
      ];

      modules-right = [
	"pulseaudio"
	"network"
	"battery"
	"clock"
      ];

      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      battery = {
        states = {
	  warning = 30;
	  critical = 15;
	};

	format = "{capacity}% {icon}";
	format-full = "{capacity}% {icon}";
	format-charging = "{capacity}% ";
	format-plugged = "{capacity}% ";
	format-alt = "{time} {icon}";
	format-icons = ["" "" "" "" ""];
      };

      network = {
	tooltip = true;
	format-wifi = "";
	rotate = 0;
	format-ethernet = "󰈀";
	tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
	format-disconnected = "󰖪";
	tooltip-format-disconnected = "Disconnected";
	interval = 2;
	on-click = "alacritty --class=floating_waybar -e 'nmtui'";
      };

      pulseaudio = {
	format = "{volume}% {icon}";
	format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
	};
	on-click = "pavucontrol";
      };
    }];
  };
}
