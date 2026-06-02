{
  config,
  usuario,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.entornoDeDesarrollo.fish.activar = lib.mkEnableOption {
    description = "Activa el módulo de fish";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.fish.activar {
    home-manager.users.${usuario} =
      let
        complementos = import ./complementos |> map (ruta: import ruta { inherit pkgs; });
      in
      {
        programs.fish = {
          enable = true;
          plugins = complementos |> map (c: c.paquete);
          shellInit = complementos |> map (c: c.configuracion or "") |> lib.strings.concatStringsSep "\n";
        };

        home.packages = complementos |> map (c: c.dependencias or [ ]) |> lib.lists.flatten;
      };
  };
}
