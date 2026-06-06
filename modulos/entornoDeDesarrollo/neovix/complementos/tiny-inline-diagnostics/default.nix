{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Tiny Inline Diagnostics" = {
    paquete = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
    configuracion = /* lua */ ''
      require("tiny-inline-diagnostic").setup({
        options = {
          show_source = { enabled = true },
          multilines = { enabled = true, always_show = true },
          use_icons_from_diagnostic = true,
        },
      })

      vim.diagnostic.config({ virtual_text = false })
      require("mestizo256.integraciones_especiales.tiny-inline-diagnostics").obtener()
    '';
    lazy.eventos = [ "VeryLazy" ];
  };
}
