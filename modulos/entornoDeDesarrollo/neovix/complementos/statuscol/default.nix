{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Statuscol" = {
    activar = false;
    paquete = pkgs.vimPlugins.statuscol-nvim;
    configuracion = /* lua */ ''
      local builtin = require("statuscol.builtin")

      require("statuscol").setup({
        thousands = true,
        segments = {
          { text = { "%s", " " }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          {
            sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
            click = "v:lua.ScSa",
          },
          {
            text = { " " },
          },
        },
      })
    '';
    lazy.eventos = [
      "BufReadPre"
      "BufNewFile"
    ];
  };
}
