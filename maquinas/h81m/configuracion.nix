{ ... }:
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
  };
}
