{
  lib,
  config,
  pkgs,
  usuario,
  ...
}:
{
  options.anfistema.gnome.activar = lib.mkEnableOption "Activa el módulo de Entorno Gnome";

  imports = [
    ./escritorios.nix
    ./atajosDeTeclado.nix
    ./desactivarAutosuspensionYApagadoDePantalla.nix
    ./escritorioRemoto.nix
    ./extensiones.nix
  ];

  config = lib.mkIf config.anfistema.gnome.activar {
    services.desktopManager.gnome.enable = true;

    services.gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
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
