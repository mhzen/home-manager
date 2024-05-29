{config, ...}: {
  programs.beets = {
    enable = true;
    settings = {
      directory = "${config.home.homeDirectory}/Music";
      library = "${config.home.homeDirectory}/Music/data";
      plugins = [
        "lyrics"
        "thumbnails"
        "fetchart"
        "embedart"
        "chroma"
        "fromfilename"
        "lastgenre"
      ];
      import = {
        move = true;
        write = true;
      };
      lyrics = {
        auto = true;
      };
      thumbnails.auto = true;
      fetchart.auto = true;
      embedart = {
        auto = true;
        remove_art_file = true;
      };
      acousticbrainz.auto = true;
      chroma.auto = true;
    };
  };
}
