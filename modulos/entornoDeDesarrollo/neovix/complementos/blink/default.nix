{
  pkgs,
  lib,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix = {
    complementos."Blink" = {
      paquete = pkgs.vimPlugins.blink-cmp;
      dependencias = with pkgs.vimPlugins; [
        friendly-snippets
      ];
      configuracion = /* lua */ ''
        require("blink.cmp").setup(require("mestizo256.integraciones_especiales.blink").obtener({
          keymap = { preset = "default" },
          appearance = { nerd_font_variant = "mono" },
          completion = { documentation = { auto_show = true } },
          sources = { default = { "lsp", "path", "snippets", "buffer" } },
          fuzzy = { implementation = "prefer_rust_with_warning" },
          signature = { enabled = false },
        }))
      '';
      lazy.eventos = [
        "CmdlineEnter"
        "InsertEnter"
      ];
    };

    lspconfig = {
      dependencias = [ pkgs.vimPlugins.blink-cmp ];
      configuracionComun = {
        capabilities = lib.generators.mkLuaInline /* lua */ ''require("blink-cmp").get_lsp_capabilities()'';
      };
    };
  };
}
