{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./fish
    ./git
    ./direnv
    ./ssh
    ./btop
  ];

  options.anfistema.entornoDeDesarrollo.activar = lib.mkEnableOption {
    description = "Activa el entorno de desarrollo";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.activar {
    anfistema = {
      entornoDeDesarrollo = {
        fish.activar = true;
        git.activar = true;
        direnv.activar = true;
        ssh.activar = true;
        btop.activar = true;
      };

      paquetesHm = with pkgs; [
        zip
        unzip
        curl
      ];
    };
  };
}
