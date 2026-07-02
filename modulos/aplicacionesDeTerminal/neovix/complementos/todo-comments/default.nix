{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Todo Comments" = {
    activar = false;
    paquete = pkgs.vimPlugins.todo-comments-nvim;
    dependencias = with pkgs.vimPlugins; [ plenary-nvim ];
    configuracion = /* lua */ ''
      local colores = require("mestizo.paleta")

      require("todo-comments").setup({
        keywords = {
          ERROR = { icon = " ", color = colores.rojo, alt = { "ERROR" } },
          TAREA = { icon = " ", color = colores.azul, alt = { "PENDIENTE", "TODO" } },
          TRUCO = { icon = " ", color = colores.cian, alt = { "HACK", "IMPORTANTE" } },
          ADVER = { icon = " ", color = colores.amarillo, alt = { "ADVERTENCIA", "WARN" } },
          MEJOR = { icon = " ", color = colores.magenta, alt = { "MEJORAR", "OPTIMIZAR", "PERF" } },
          NOTAS = { icon = " ", color = colores.verde, alt = { "INFO", "NOTA" } },
          PRUEB = { icon = "⏲ ", color = colores.lima, alt = { "PRUEBA", "PROBA", "TEST" } },
        },
        merge_keywords = false,
      })
    '';
    lazy.eventos = [
      "BufReadPost"
      "BufNewFile"
    ];
  };
}
