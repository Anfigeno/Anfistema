{
  config,
  lib,
  ...
}:
{
  options.anfistema.servicios.pipewire.activar = lib.mkEnableOption "Activa el móulo de pipewire";

  config = lib.mkIf config.anfistema.servicios.pipewire.activar {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
