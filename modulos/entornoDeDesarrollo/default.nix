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
    ./ssh
  ];

  options.anfistema.entornoDeDesarrollo.activar = lib.mkEnableOption {
    description = "Activa el entorno de desarrollo";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.activar {
    anfistema.entornoDeDesarrollo = {
      fish.activar = true;
      git.activar = true;
      direnv.activar = true;
      ssh.activar = true;
    };
  };
}
