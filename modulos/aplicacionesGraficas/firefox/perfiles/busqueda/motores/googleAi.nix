{
  name = "Google AI";
  urls = [
    {
      template = "https://www.google.com/ai";
      params = [
        {
          name = "q";
          value = "{searchTerms}";
        }
      ];
    }
  ];

  iconMapObj."16" = "https://www.google.com/favicon.ico";
}
