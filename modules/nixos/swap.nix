{ pkgs, lib, config, ... }:
{
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 10*1024;
  } ];
}
