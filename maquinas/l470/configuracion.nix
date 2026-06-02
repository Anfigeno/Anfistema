{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  anfistema = {
    kitty.activar = true;
    git.activar = true;
    niri.activar = true;
    fish.activar = true;
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
