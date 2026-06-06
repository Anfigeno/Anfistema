{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Hover" = {
    # activar = false;
    paquete = pkgs.vimPlugins.hover-nvim;
    configuracion = /* lua */ ''
      require("hover").config({
        providers = {
          'hover.providers.diagnostic',
          'hover.providers.lsp',
          'hover.providers.gh',
          'hover.providers.fold_preview',
          'hover.providers.highlight',
          -- 'hover.providers.dictionary',
          -- 'hover.providers.dap',
          -- 'hover.providers.man',
          -- 'hover.providers.gh_user',
          -- 'hover.providers.jira',
        },
        preview_opts = {
          border = "rounded",
        },
        preview_window = false,
        title = true,
      })
    '';
    lazy = {
      eventos = [
        "BufReadPost"
        "BufNewFile"
      ];
      teclas."K" = {
        accion = /* lua */ ''require("hover").open()'';
        descripcion = "Hover: Mostrar información sobre el elemento";
      };
    };
  };
}
