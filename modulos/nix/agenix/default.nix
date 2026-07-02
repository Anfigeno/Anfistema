{
  config,
  lib,
  inputs,
  system,
  ...
}:
{
  options.anfistema.nix.agenix.activar = lib.mkEnableOption "Activa el módulo de Agenix";

  config = lib.mkIf config.anfistema.nix.agenix.activar {
    environment.systemPackages = [ inputs.agenix.packages.${system}.default ];

    age.secrets = {
      playit.file = ../../secretos/playit.age;
    };
  };
}
