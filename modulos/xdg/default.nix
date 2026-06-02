{
  config,
  lib,
  usuario,
  ...
}:
{
  options.anfistema.xdg.activar = lib.mkEnableOption {
    description = "Activa el módulo de XDG";
  };

  config = lib.mkIf config.anfistema.xdg.activar {
    home-manager.users.${usuario}.xdg = {
      enable = true;

      userDirs = {
        enable = true;
        createDirectories = true;

        desktop = "Escritorio";
        documents = "Documentos";
        download = "Descargas";
        music = "Música";
        pictures = "Imágenes";
        videos = "Videos";
        templates = "Plantillas";
        publicShare = "Público";
      };
    };
  };
}
