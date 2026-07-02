{ pkgs, usuario, ... }:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Fyler" = {
    activar = false;
    paquete = pkgs.vimPlugins.fyler-nvim;
    dependencias = with pkgs.vimPlugins; [ mini-icons ];
    configuracion = /* lua */ ''
      require("fyler").setup {}
    '';
    lazy.teclas = {
      "<C-n>" = {
        accion = /* lua */ ''
          require("fyler").toggle({ kind = "split_left" })
        '';
        descripcion = "Fyler: Alternar explorador";
      };
    };
  };
}
