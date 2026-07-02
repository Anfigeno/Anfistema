{
  config,
  lib,
  usuario,
  ...
}:
{
  options.anfistema.aplicacionesDeTerminal.git.activar = lib.mkEnableOption {
    description = "Activa el módulo de Git";
  };

  config = lib.mkIf config.anfistema.aplicacionesDeTerminal.git.activar {
    home-manager.users.${usuario} = {
      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "main";
          user.name = "Anfitrion";
          user.email = "tendondevastador@proton.me";
          puil.rebase = true;
        };
        includes = [
          {
            condition = "gitdir:~/Codigo/";
            contents.user = {
              name = "Anfigeno";
              email = "dolorcriticodevastador@proton.me";
            };
          }
        ];
      };

      programs.gh.enable = true;
    };
  };
}
