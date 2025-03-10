{...}: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;

      minegrub-theme = {
        enable = true;
        splash = "I use NixOS btw";
        background = "background_options/1.20 - [Trails & Tales].png";
        boot-options-count = 4;
      };
    };
  };
}
