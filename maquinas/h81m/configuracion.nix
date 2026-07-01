{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  anfistema = {
    entornoDeDesarrollo.activar = true;
    kitty.activar = true;
    xdg.activar = true;
    firefox.activar = true;
    gtkYQt.activar = true;
    pipewire.activar = true;
    mestizo256nix.activar = true;
    gnome.activar = true;
    playit.activar = true;
    agenix.activar = true;
  };

  networking = {
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 ];
      allowedUDPPorts = [ 19132 ];
    };
  };
}
