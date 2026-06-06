{
  pkgs,
  perfiles,
  lib,
  usuario,
  ...
}:
{
  home-manager.users.${usuario}.programs.neovix.complementos."Obsidian" = {
    activar = false;
    paquete = pkgs.vimPlugins.obsidian-nvim;
    dependencias = with pkgs.vimPlugins; [
      telescope-nvim
      blink-cmp
    ];
    configuracion = /* lua */ ''
      require("obsidian").setup({
        workspaces = ${
          perfiles
          |> map (perfil: {
            name = perfil;
            path = "~/Vaul/${perfil}";
          })
          |> lib.generators.toLua { }
        }
      })
    '';
    lazy = {
      tiposDeArchivo = [ "markdown" ];
      comandos = [ "Obsidian" ];
    };
  };
}
