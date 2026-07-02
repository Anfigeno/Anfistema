{
  config,
  lib,
  ...
}:
{
  options.anfistema.servicios.ssh.activar = lib.mkEnableOption {
    description = "Activa el módulo de SSH";
  };

  config = lib.mkIf config.anfistema.servicios.ssh.activar {
    services.openssh = {
      enable = true;
      allowSFTP = true;
    };
  };
}
