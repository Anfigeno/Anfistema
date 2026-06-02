{
  config,
  lib,
  ...
}:
{
  options.anfistema.paquetes = lib.mkOption {
    description = "Paquetes para instalar";
    type = with lib.types; listOf package;
    default = [ ];
  };

  config = {
    environment.systemPackages = config.anfistema.paquetes;
  };
}
