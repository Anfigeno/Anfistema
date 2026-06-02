{
  config,
  lib,
  ...
}:
{
  imports = [
    ./fish
    ./git
  ];

  options.anfistema.entornoDeDesarrollo.activar = lib.mkEnableOption {
    description = "Activa el entorno de desarrollo";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.activar {
    anfistema = {
      fish.activar = true;
      git.activar = true;
    };
  };
}
