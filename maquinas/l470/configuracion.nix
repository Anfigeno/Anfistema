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
  };

  programs = {
    neovim.enable = true;
    fish.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    fuzzel
    zed-editor
  ];
}
