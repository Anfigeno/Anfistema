{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.discord.activar = lib.mkEnableOption "Activa el módulo de Discord";

  config = lib.mkIf config.anfistema.discord.activar {
    home-manager.users.${usuario}.programs.discord.enable = true;
  };
}
