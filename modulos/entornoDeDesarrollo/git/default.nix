{
  config,
  lib,
  usuario,
  ...
}:
{
  options.anfistema.entornoDeDesarrollo.git.activar = lib.mkEnableOption {
    description = "Activa el módulo de Git";
  };

  config = lib.mkIf config.anfistema.entornoDeDesarrollo.git.activar {
    home-manager.users.${usuario} = {
      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "main";
          user.name = "anfigeno";
          user.email = "dolorcriticodevastador@proton.me";
          puil.rebase = true;
        };
      };

      programs.gh.enable = true;
    };
  };
}
