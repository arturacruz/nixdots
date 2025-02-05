{ config, lib, pkgs, ... }:
{
  services.logind = {
    powerKey = "ignore";
    powerKeyLongPress = "ignore";
  };
}
