{
  config,
  usuario,
  lib,
  ...
}:
{
  options.anfistema.paquetesHm = lib.mkOption {
    description = "Paquetes para instalar en Home Manager";
    type = with lib.types; listOf package;
    default = [ ];
  };

  config = {
    home-manager.users.${usuario}.home.packages = config.anfistema.paquetesHm;
  };
}
