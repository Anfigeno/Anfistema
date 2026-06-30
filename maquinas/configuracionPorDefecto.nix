{
  inputs,
  maquina,
  usuario,
  lib,
  ...
}:

{
  imports = [
    ./${maquina}/configuracionDeHardware.nix
    ./${maquina}/configuracion.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.${usuario} = {
      home.stateVersion = "26.05"; # No tocar nunca
    };
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  networking.hostName = maquina;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Lima";

  i18n.defaultLocale = "es_MX.UTF-8";

  console.keyMap = "la-latin1";

  users.users.${usuario} = {
    isNormalUser = true;
    description = usuario |> lib.strings.toCamelCase;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "pipewire"
    ];
  };

  system.stateVersion = "26.05"; # No tocar nunca
}
