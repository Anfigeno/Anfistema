{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Mini Move" = {
    paquete = pkgs.vimPlugins.mini-move;
    configuracion = /* lua */ ''
      require("mini.move").setup({
        mappings = {
          left = '<M-h>',
          right = '<M-l>',
          down = '<M-j>',
          up = '<M-k>',
          line_left = '<M-h>',
          line_right = '<M-l>',
          line_down = '<M-j>',
          line_up = '<M-k>',
        },
        options = {
          reindent_linewise = true,
        },
      })
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
