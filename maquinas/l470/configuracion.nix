{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  anfistema = {
    entornoDeDesarrollo.activar = true;
    kitty.activar = true;
    # niri.activar = true;
    # awww.activar = true;
    xdg.activar = true;
    firefox.activar = true;
    gtkYQt.activar = true;
    # sddm.activar = true;
    pipewire.activar = true;
    droidcam.activar = true;
    mestizo256nix.activar = true;
    discord.activar = true;
    obs.activar = true;
    steam.activar = true;
    kdeconnect.activar = true;
    # nautilus.activar = true;
    kdenlive.activar = true;
    gestoresDeEscritorio.gnome.activar = true;
    gestoresDeVisualizacion.gdm.activar = true;

    paquetesHm = with pkgs; [
      brightnessctl
      # legcord
      prismlauncher
      # amberol
      # file-roller
      # vlc
      ffmpeg
      kdePackages.gwenview
      # totem
      yt-dlp
    ];
  };

  networking.networkmanager =
    let
      prioridadDeEthernet = 100;
      prioridadDeWifi = 900;
    in
    {
      enable = true;
      settings = {
        connection-wifi = {
          match-device = "type:wifi";
          "ipv4.route-metric" = prioridadDeWifi;
          "ipv6.route-metric" = prioridadDeWifi;
        };

        connection-ethernet = {
          match-device = "type:ethernet";
          "ipv4.route-metric" = prioridadDeEthernet;
          "ipv6.route-metric" = prioridadDeEthernet;
        };
      };
    };
}
