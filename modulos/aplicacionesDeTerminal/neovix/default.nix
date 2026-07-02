{
  config,
  usuario,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./entornosDeEjecucion.nix
    ./formateadores.nix
    ./lenguajes.nix
    ./lsps.nix
    ./complementos
  ];

  options.anfistema.aplicacionesDeTerminal.neovix.activar =
    lib.mkEnableOption "Activa el módulo de neovix";

  config = lib.mkIf config.anfistema.aplicacionesDeTerminal.neovix.activar {
    home-manager.users.${usuario}.programs.neovix = {
      activar = true;
      editorPorDefecto = true;
      configuracion = import ./configuracion.nix { inherit pkgs; };
    };
  };
}
