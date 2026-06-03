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
    sddm.activar = true;
    pipewire.activar = true;

    paquetesHm = with pkgs; [
      nautilus
      brightnessctl
      zed-editor
      legcord
      prismlauncher
      amberol
      vesktop
    ];
  };

  networking.networkmanager = {
    enable = true;
    settings = {
      connection-wifi = {
        match-device = "type:wifi";
        "ipv4.route-metric" = 100;
        "ipv6.route-metric" = 100;
      };

      connection-ethernet = {
        match-device = "type:ethernet";
        "ipv4.route-metric" = 400;
        "ipv6.route-metric" = 400;
      };
    };
  };
}
