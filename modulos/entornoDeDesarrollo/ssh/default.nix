{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.entornoDeDesarrollo.ssh.activar = lib.mkEnableOption {
    description = "Activa el módulo de SSH";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.ssh.activar {
    services.openssh = {
      enable = true;
      allowSFTP = true;
    };

    anfistema.paquetes = with pkgs; [
      sshfs
      sshfs-fuse
    ];
  };
}
