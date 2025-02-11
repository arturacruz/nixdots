{ pkgs, lib, config, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk
    maven
    jetbrains.idea-community
    brave
    vscode-fhs
    wine
  ];
  services.logmein-hamachi.enable = true;
}
