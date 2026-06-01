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

    paquetesHm = with pkgs; [
      brightnessctl
      zed-editor
      legcord
    ];
  };

  programs = {
    neovim.enable = true;
    firefox.enable = true;
  };
}
