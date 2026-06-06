{
  util,
  pkgs,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Direnv" = {
    paquete = util.vim.obtenerComplementoDeGithub {
      rev = "4dfc8758a1deab45e37b7f3661e0fd3759d85788";
      ref = "main";
      repo = "NotAShelf/direnv.nvim";
    };
    dependenciasDeSistema = [ pkgs.direnv ];
    configuracion = /* lua */ ''
      require("direnv").setup({
        bin = "${pkgs.direnv}/bin/direnv",
        statusline = { enabled = true, icon = "󱚟 " }
      })
    '';
    lazy = {
      eventos = [
        "BufReadPre"
        "BufNewFile"
      ];
      teclas = {
        "<space>dp" = {
          accion = /* lua */ ''require("direnv").allow_direnv()'';
          descripcion = "Direnv: Permitir";
        };
        "<space>dd" = {
          accion = /* lua */ ''require("direnv").deny_direnv()'';
          descripcion = "Direnv: Denegar";
        };
        "<space>dr" = {
          accion = /* lua */ ''require("direnv").check_direnv()'';
          descripcion = "Direnv: Recargar";
        };
        "<space>de" = {
          accion = /* lua */ ''require("direnv").edit_envrc()'';
          descripcion = "Direnv: Editar .envrc";
        };
      };
    };
  };
}
