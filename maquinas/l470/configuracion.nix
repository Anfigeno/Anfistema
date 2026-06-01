{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  anfistema = {
    kitty.activar = true;
    git.activar = true;
  };

  programs = {
    neovim.enable = true;
    fish.enable = true;
    niri.enable = true;
    firefox.enable = true;
  };

  anfistema.paquetes = with pkgs; [
    brightnessctl
    fuzzel
    zed-editor
  ];
}
