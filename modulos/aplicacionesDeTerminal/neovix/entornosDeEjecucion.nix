{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.anfistema.aplicacionesDeTerminal.neovix.activar {
    home-manager.users.${usuario}.programs.neovix.entornosDeEjecucion = {
      "bun" = {
        paquete = pkgs.bun;
        configuracionDeCodeRunner = "bun";
      };
      "python" = {
        paquete = pkgs.python3;
        configuracionDeCodeRunner = "python -m";
      };
      "lua" = {
        paquete = pkgs.lua;
        configuracionDeCodeRunner = "lua";
      };
    };
  };
}
