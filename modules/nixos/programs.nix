{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk
    maven
    jetbrains.idea-community
    brave
    vscode-fhs
    wine
    gimp
    filelight
    wget
    postman
    gnome-disk-utility
  ];

  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = p: [
        p.kdePackages.breeze
      ];
    };
  };
  services.logmein-hamachi.enable = true;
}
