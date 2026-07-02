{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Mini Icons" = {
    paquete = pkgs.vimPlugins.mini-icons;
    configuracion = /* lua */ ''
      local MiniIcons = require("mini.icons")
      MiniIcons.setup()
      MiniIcons.mock_nvim_web_devicons()
    '';
  };
}
