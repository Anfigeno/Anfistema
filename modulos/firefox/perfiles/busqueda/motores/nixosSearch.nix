{
  name = "NixOS Search";
  urls = [
    {
      template = "https://search.nixos.org/packages";
      params = [
        {
          name = "type";
          value = "packages";
        }
        {
          name = "query";
          value = "{searchTerms}";
        }
      ];
    }
  ];

  iconMapObj."16" = "https://nixos.org/favicon.ico";
}
