{ config, lib, ... }:
{
  options.anfistema.playit.activar = lib.mkEnableOption "Activa el módulo de Playit";

  config = lib.mkIf config.anfistema.playit.activar {
    services.playit = {
      enable = true;
      secretPath = config.age.secrets.playit.path;
    };
  };
}
