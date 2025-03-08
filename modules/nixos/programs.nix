{ pkgs, lib, config, ... }:
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
  ];
  services.logmein-hamachi.enable = true;
}
