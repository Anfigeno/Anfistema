{ config, lib, ... }:
{
  options.anfistema.steam.activar = lib.mkEnableOption "Activa el módulo de Steam";

  config = lib.mkIf config.anfistema.steam.activar {
    programs.steam.enable = true;
  };
}
