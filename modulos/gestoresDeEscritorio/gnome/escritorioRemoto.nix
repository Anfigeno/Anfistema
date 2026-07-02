{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.anfistema.gestoresDeEscritorio.gnome.activar {
    services.gnome.gnome-remote-desktop.enable = true;
    systemd.services.gnome-remote-desktop.wantedBy = [ "graphical.target" ];
    networking.firewall.allowedTCPPorts = [ 3389 ];
    services.displayManager.autoLogin.enable = false;
    services.getty.autologinUser = null;

    systemd.targets.sleep.enable = false;
    systemd.targets.suspend.enable = false;
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;
  };
}
