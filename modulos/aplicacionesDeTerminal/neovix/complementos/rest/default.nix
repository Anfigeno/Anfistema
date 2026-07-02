{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Rest" = {
    paquete = pkgs.vimPlugins.rest-nvim;
    dependencias = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
      nvim-treesitter
      nvim-nio
    ];
    dependenciasDeSistema = with pkgs; [ curl ];
    dependenciasDeLua = [
      "mimetypes"
      "xml2lua"
    ];
    configuracion = /* lua */ ''
      require("telescope").load_extension("rest")

      vim.api.nvim_create_autocmd("FileType",  {
        pattern = { "json" },
        callback = function()
          vim.api.nvim_set_option_value("formatprg", "${pkgs.jq}/bin/jq", { scope = 'local' })
        end,
      })
    '';
    lazy = {
      tiposDeArchivo = [ "http" ];
      teclas = {
        "<space>fR" = {
          accion = /* lua */ ''require("telescope").extensions.rest.select_env()'';
          descripcion = "Telescope: Seleccionar entorno de REST";
        };
        "<space>rr" = {
          comando = "<cmd>Rest run<cr>";
          descripcion = "Rest: Ejecutar petición";
        };
        "<space>ra" = {
          comando = "<cmd>Rest open<cr>";
          descripcion = "Rest: Abrir panel de resultados";
        };
        "<space>ru" = {
          comando = "<cmd>Rest last<cr>";
          descripcion = "Rest: Ejecutar última petición";
        };
      };
    };
  };
}
