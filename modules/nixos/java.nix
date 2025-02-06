{ pkgs, lib, config, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk
    maven
  ];
}
