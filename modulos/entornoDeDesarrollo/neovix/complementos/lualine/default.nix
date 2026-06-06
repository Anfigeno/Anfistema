{
  pkgs,
  config,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Lualine" = {
    activar = false;
    paquete = pkgs.vimPlugins.lualine-nvim;
    dependencias = with pkgs.vimPlugins; [
      mini-icons
      config.programs.neovix.complementos."Mestizo".paquete
    ];
    configuracion = /* lua */ ''
      local colores = require("mestizo.paleta")

      local function obtener_icono()
        return require('mini.icons').get("filetype", vim.bo.filetype)
      end

      local winbar = {
        lualine_a = {
          {
            "navic",
            color_correction = nil,
            navic_opts = nil,
          },
        },
        lualine_z = {
          obtener_icono,
          {
            "filename",
            file_status = false,
            new_file_status = false,
          },
        },
      }

      -- Función tomada de: https://github.com/jdhao/nvim-config/commit/bbb8545403d276fa6bc56e956906fb14f871553f
      local function obtener_lsps_activos() --- @return string
        local mensaje = {}
        local lsps_activos = vim.lsp.get_clients({ bufnr = 0 })

        if #lsps_activos > 0 then
          table.insert(mensaje, " ")

          for _, cliente in ipairs(lsps_activos) do
            if cliente.name == "" then
              goto continue
            end

            table.insert(mensaje, " ")
            table.insert(mensaje, cliente.name)

            ::continue::
          end
        end

        return table.concat(mensaje)
      end

      local function modulo_direnv()
        local ok, direnv = pcall(require, "direnv")

        if not ok then
          return ""
        end

        return direnv.statusline()
      end

      require("lualine").setup({
        options = {
          theme = {
            normal = {
              a = { fg = colores.tope_2, bg = colores.base },
              b = { fg = colores.tope_2, bg = colores.base },
              c = { bg = colores.base },
              x = { fg = colores.lima, bg = colores.base },
              y = { fg = colores.tope_2, bg = colores.base },
              z = { fg = colores.tope_2, bg = colores.base },
            },
          },
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            winbar = { "neo-tree", "toggleterm", "trouble" },
          },
        },
        sections = {
          lualine_a = { "branch", "diff", "%=" },
          lualine_b = {},
          lualine_c = {
            { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
          },
          lualine_x = {
            obtener_lsps_activos,
          },
          lualine_y = {
            modulo_direnv
          },
          lualine_z = {
            obtener_icono,
            { "bo:filetype", fmt = string.upper },
            "progress",
            "location",
          },
        },
        winbar = winbar,
        inactive_winbar = winbar,
      })
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
