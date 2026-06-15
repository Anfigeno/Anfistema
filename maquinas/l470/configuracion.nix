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
    droidcam.activar = true;
    mestizo256nix.activar = true;
    vesktop.activar = true;
    obs.activar = true;
    steam.activar = true;
    kdeconnect.activar = true;

    paquetesHm = with pkgs; [
      nautilus
      brightnessctl
      zed-editor
      legcord
      prismlauncher
      amberol
      file-roller
      vlc
      ffmpeg
      kdePackages.kdenlive
      yt-dlp
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
