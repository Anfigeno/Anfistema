{ pkgs, ... }:
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  anfistema = {
    gestoresDeEscritorio.gnome.activar = true;
    gestoresDeVisualizacion.gdm.activar = true;
    aplicacionesGraficas = {
      kitty.activar = true;
      firefox.activar = true;
      kdenlive.activar = true;
      discord.activar = true;
      obs.activar = true;
      steam.activar = true;
      kdeconnect.activar = true;
      droidcam.activar = true;
      vscode.activar = true;
    };
    servicios = {
      pipewire.activar = true;
      ssh.activar = true;
    };
    personalizacionDeEscritorio = {
      gtkYQt.activar = true;
      fontconfig.activar = true;
      xdg.activar = true;
    };
    aplicacionesDeTerminal = {
      btop.activar = true;
      direnv.activar = true;
      fish.activar = true;
      git.activar = true;
      neovix.activar = true;
      yazi.activar = true;
      zellij.activar = true;
    };
    nix.mestizo256nix.activar = true;

    paquetesHm = with pkgs; [
      brightnessctl
      prismlauncher
      ffmpeg
      yt-dlp

      zip
      unzip
      curl
      sshfs
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
