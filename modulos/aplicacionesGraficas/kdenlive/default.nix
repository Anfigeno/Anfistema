{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.anfistema.aplicacionesGraficas.kdenlive.activar =
    lib.mkEnableOption "Activa el módulo de KDEnlive";

  config = lib.mkIf config.anfistema.aplicacionesGraficas.kdenlive.activar {
    anfistema.paquetesHm =
      let
        kdenliveEnvuelto = pkgs.kdePackages.kdenlive.overrideAttrs (prevAttrs: {
          nativeBuildInputs = (prevAttrs.nativeBuildInputs or [ ]) ++ [ pkgs.makeBinaryWrapper ];
          postInstall = (prevAttrs.postInstall or "") + ''
            wrapProgram $out/bin/kdenlive \
              --prefix LADSPA_PATH : ${pkgs.tap-plugins}/lib/ladspa
          '';
        });
      in
      [ kdenliveEnvuelto ];
  };
}
