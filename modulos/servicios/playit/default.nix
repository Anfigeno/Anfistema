{ config, lib, ... }:
{
  options.anfistema.servicios.playit.activar = lib.mkEnableOption "Activa el módulo de Playit";

  config = lib.mkIf config.anfistema.servicios.playit.activar {
    services.playit = {
      enable = true;
      secretPath = config.age.secrets.playit.path;
    };
  };
}
