{
  pkgs,
  usuario,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.anfistema.entornoDeDesarrollo.neovix.activar {
    home-manager.users.${usuario}.programs.neovix.entornosDeEjecucion = {
      "bun" = {
        paquete = pkgs.bun;
        configuracionDeCodeRunner = "bun";
      };
    };
  };
}
