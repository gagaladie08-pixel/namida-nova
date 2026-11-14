class YoutiPieMusicBrowseEndpoint {
  static const home = YoutiPieMusicBrowseEndpoint('FEmusic_home');
  static const charts = YoutiPieMusicBrowseEndpoint('FEmusic_charts');
  static const explore = YoutiPieMusicBrowseEndpoint('FEmusic_explore');
  static const moodsAndGenres = YoutiPieMusicBrowseEndpoint('FEmusic_moods_and_genres');
  static const newReleases = YoutiPieMusicBrowseEndpoint('FEmusic_new_releases');

  final dynamic id;
  final dynamic name;
  final dynamic title;
  final dynamic browseId;

  const YoutiPieMusicBrowseEndpoint([this.id, this.name, this.title]) : browseId = id;

  YoutiPieMusicBrowseEndpoint withFormValues(List<dynamic> values) => this;
  String? extractPlaylistId() => null;

  dynamic noSuchMethod(Invocation invocation) => null;
}

typedef MusicBrowseEndpoint = YoutiPieMusicBrowseEndpoint;
