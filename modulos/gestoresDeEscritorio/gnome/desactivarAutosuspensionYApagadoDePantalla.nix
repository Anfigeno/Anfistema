{
  config,
  lib,
  usuario,
  ...
}:
{
  config = lib.mkIf config.anfistema.gestoresDeEscritorio.gnome.activar {
    home-manager.users.${usuario} = {
      dconf.settings = {
        "org/gnome/desktop/screensaver" = {
          lock-enabled = false;
          lock-delay = lib.gvariant.mkUint32 0;
        };

        "org/gnome/desktop/session" = {
          idle-delay = lib.gvariant.mkUint32 0;
        };

        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
          sleep-inactive-battery-type = "nothing";
          sleep-inactive-ac-timeout = 0;
          sleep-inactive-battery-timeout = 0;
          power-button-action = "nothing";
        };

        "org/gnome/desktop/interface" = {
        };
      };
    };
  };
}
