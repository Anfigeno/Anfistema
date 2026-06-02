{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  anfistema = {
    entornoDeDesarrollo.activar = true;
    kitty.activar = true;
    niri.activar = true;
    awww.activar = true;
    xdg.activar = true;
    firefox.activar = true;
    gtkYQt.activar = true;

    paquetesHm = with pkgs; [
      nautilus
      brightnessctl
      zed-editor
      legcord
      prismlauncher
      amberol
    ];
  };

  programs = {
    neovim.enable = true;
  };
}
