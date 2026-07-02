{ ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  anfistema = {
    gestoresDeEscritorio.gnome.activar = true;
    gestoresDeVisualizacion.gdm.activar = true;

    aplicacionesGraficas = {
      kitty.activar = true;
      firefox.activar = true;
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

    servicios = {
      pipewire.activar = true;
      ssh.activar = true;
    };

    personalizacionDeEscritorio = {
      gtkYQt.activar = true;
      fontconfig.activar = true;
      xdg.activar = true;
    };

    nix.mestizo256nix.activar = true;
  };
}
