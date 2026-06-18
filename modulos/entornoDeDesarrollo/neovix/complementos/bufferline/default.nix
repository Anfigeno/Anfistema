{
  pkgs,
  lib,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Bufferline" = {
    paquete = pkgs.vimPlugins.bufferline-nvim;
    dependencias = with pkgs.vimPlugins; [
      scope-nvim
      mini-icons
    ];
    configuracion = /* lua */ ''
      require("scope").setup({})

      require("bufferline").setup({
        options = {
          separator_style = "slant",
          offsets = ${
            [
              "fyler"
              "neo-tree"
            ]
            |> map (tda: {
              filetype = tda;
              text = "Archivos";
              highlight = "NeoTreeNormal";
              text_align = "center";
              separator = false;
            })
            |> lib.generators.toLua { }
          }
        },
      })
    '';
    lazy = {
      eventos = [ "BufEnter" ];
      teclas = {
        "<tab>" = {
          accion = /* lua */ ''
            require("bufferline").cycle(1)
          '';
          descripcion = "Bufferline: Siguiente buffer";
        };
        "<s-tab>" = {
          accion = /* lua */ ''
            require("bufferline").cycle(-1)
          '';
          descripcion = "Bufferline: Anterior buffer";
        };
        "<space>tt" = {
          comando = "<cmd>tabnew<cr>";
          descripcion = "Nueva ventana";
        };
        "<space>tc" = {
          comando = "<cmd>tabclose<cr>";
          descripcion = "Cerrar ventana";
        };
        "<space>tn" = {
          comando = "<cmd>tabnext<cr>";
          descripcion = "Siguiente ventana";
        };
        "<space>tp" = {
          comando = "<cmd>tabprevious<cr>";
          descripcion = "Anterior ventana";
        };
        "<space>bc" = {
          comando = "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>";
          descripcion = "Bufferline: Cerrar buffer";
        };
        "<space>bCo" = {
          accion = /* lua */ ''require("bufferline").close_others()'';
          descripcion = "Bufferline: Cerrar los demás bufferes";
        };
        "<space>bCl" = {
          accion = /* lua */ ''require("bufferline").close_in_direction("right")'';
          descripcion = "Bufferline: Cerrar los bufferes a la derecha";
        };
        "<space>bCh" = {
          accion = /* lua */ ''require("bufferline").close_in_direction("left")'';
          descripcion = "Bufferline: Cerrar los bufferes a la izquierda";
        };
        "<space>bCe" = {
          accion = /* lua */ ''require("bufferline").close_with_pick()'';
          descripcion = "Bufferline: Elegir buffer para cerrar";
        };
        "<space>bml" = {
          accion = /* lua */ ''require("bufferline").move(1)'';
          descripcion = "Bufferline: Mover buffer a la derecha";
        };
        "<space>bmh" = {
          accion = /* lua */ ''require("bufferline").move(-1)'';
          descripcion = "Bufferline: Mover buffer a la izquierda";
        };
        "<space>be" = {
          accion = /* lua */ ''require("bufferline").pick()'';
          descripcion = "Bufferline: Elegir buffer";
        };
        "<space>br" = {
          comando = /* vim */ ":BufferLineTabRename ";
          descripcion = "Bufferline: Renombrar buffer";
        };
      };
    };
  };
}
