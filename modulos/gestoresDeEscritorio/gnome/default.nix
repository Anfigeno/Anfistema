{
  lib,
  config,
  pkgs,
  usuario,
  ...
}:
{
  options.anfistema.gestoresDeEscritorio.gnome.activar =
    lib.mkEnableOption "Activa el módulo de Entorno Gnome";

  imports = [
    ./escritorios.nix
    ./atajosDeTeclado.nix
    ./desactivarAutosuspensionYApagadoDePantalla.nix
    ./escritorioRemoto.nix
    ./extensiones.nix
    ./aplicacionesExtra.nix
  ];

  config = lib.mkIf config.anfistema.gestoresDeEscritorio.gnome.activar {
    services.desktopManager.gnome.enable = true;

    services.gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
      gnome-weather
      epiphany
      gnome-contacts
      gnome-clocks
      gnome-maps
    ];

    home-manager.users.${usuario} = {
      programs.gnome-shell.enable = true;

      dconf = {
        enable = true;
        settings."org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "red";
        };
      };
    };
  };
}
