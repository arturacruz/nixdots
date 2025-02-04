{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ (python311.withPackages (ps: [ ps.pygame ])) ];

  shellHook = ''
    echo "Entering NixOS shell."
  '';
}
