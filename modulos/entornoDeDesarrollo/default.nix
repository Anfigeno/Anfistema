{
  config,
  lib,
  ...
}:
{
  imports = [
    ./fish
    ./git
    ./direnv
  ];

  options.anfistema.entornoDeDesarrollo.activar = lib.mkEnableOption {
    description = "Activa el entorno de desarrollo";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.activar {
    anfistema.entornoDeDesarrollo = {
      fish.activar = true;
      git.activar = true;
      direnv.activar = true;
    };
  };
}
